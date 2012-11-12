Title: Saving the Wordpress.com Export File and The Linked Media Files (and wget's strictness)
Date: 2009-12-07 19:36:32
Tags: sh

So I've been wanting a way to automatically backup my wordpress.com export file. I decided to go for a bash and wget mix to do this work. But I soon had a problem wget won't save cookies that have a path different to the file you are downloading. This is a problem because, well here is what I basically do to get the export file.

Grab wp-login.php. This will issue a cookie that WP looks for as proof that I can indeed store cookies.

Next I post login credentials to wp-login.php. This will issue a bunch of authentication cookies. Specifically,
<pre>Set-Cookie: wordpress_test_cookie=WP+Cookie+check; path=/; domain=.wordpress.com
Set-Cookie: wordpress=some_string; path=/wp-content/plugins; domain=.wordpress.com; httponly
Set-Cookie: wordpress=some_string path=/wp-admin; domain=.wordpress.com; httponly
Set-Cookie: wordpress_logged_in=some_string; path=/; domain=.wordpress.com; httponly
Set-Cookie: wordpress_sec=some_string; path=/wp-content/plugins; domain=.wordpress.com; secure; httponly
Set-Cookie: wordpress_sec=some_string path=/wp-admin; domain=.wordpress.com; secure; httponly</pre>
The problem is Wget will refuse to save number 2,3,5 and 6 (only saving wordpress_test_cookie and wordpress_logged_in). It refuses the rest because it requires the cookie path to be the same as the path of the file you are requesting. Using --debug wget says,
<pre>
<pre>cdm: 1 2 3 4 5 6 7 8Attempt to fake the path: /wp-content/plugins, /wp-login.php
cdm: 1 2 3 4 5 6 7 8Attempt to fake the path: /wp-admin, /wp-login.php
cdm: 1 2 3 4 5 6 7 8Attempt to fake the path: /wp-content/plugins, /wp-login.php
cdm: 1 2 3 4 5 6 7 8Attempt to fake the path: /wp-admin, /wp-login.php</pre>
</pre>
Specifically to get the export file I need the wordpress_sec cookie for the path /wp-admin. I can't just request /wp-admin and try to get the cookie from there because only wp-login.php will let me post credentials.

Possible solutions are A) write a hacky solution that just grabs the cookie value using grep/sed and manually add this to the cookies file, B) recompile wget to accept some other argument that will accept these cookies, or C) don't use wget.

I took a look at the source for wget, and it was easy to identify the problem area, I could just simply remove this segment,
<pre>/* The cookie sets its own path; verify that it is legal. */
 if (!check_path_match (cookie-&gt;path, path))
 {
 DEBUGP (("Attempt to fake the path: %s, %s\n",
 cookie-&gt;path, path));
 goto out;
 }</pre>
But then my download script wouldn't be as portable and I'll have to make sure I use and have the patched wget available.

I ended up using curl for some parts, but I probably could have done option A.

Anyhow, <a href="http://github.com/andrewharvey/shellmisc/raw/master/wordpress_export.sh">the script is here</a>. It should grab the export xml file as well as any media files that it references and were uploaded to that wordpress.com blog.