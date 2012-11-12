Title: The Cause of Slow Loading Wordpress Pages Over https
Date: 2009-06-24 21:40:46
Tags: web

For as long as I could remember, loading pages in my wordpress.com blog dashboard was really slow. I should have realised what was happening sooner but I never took the time to investigate. Whether I went to the edit posts page (/wp-admin/edit.php), new post (/wp-admin/post-new.php) there seemed to be numerous connections back to wordpress.com once parts of the page were loaded. These requests were to s-ssl.wordpress.com. Taking a look at the source, all the css and js files linked to from the html of the page were over the https protocol, and rightly so because I always go over the https protocol. What I didn't realise is that Firefox will not cache files from https by default. So if I go to about:config and change browser.cache.disk_cache_ssl to true then these static css and js files will be cached. I restart my browers and all of a sudden pages load much faster and much more tolerable. The only problem is that its not just css and js files transfered over https that are cached but html files as well. I'm not sure how to get Firefox just to cache css and js files from https, but I have to leave that for another day.