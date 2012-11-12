Title: 3D NearMap Prototype From 4 Oblique + 1 Ortho
Date: 2011-09-04 21:51:28
Tags: geo,nearmap

I was on a flight the other day and I enjoyed looking down and seeing the land from a different perspective. It reminded me of a project I was working on which was essentially a 3D map viewer like Google Earth, but not in perspective and just implemented in the web browser. The main incentive was NearMap doesn't just offer orthophotos, but 4 oblique views too. So leveraging on Polymaps I got a prototype working: <a href="http://tianjara.net/3d-nearmap.html">http://tianjara.net/3d-nearmap.html</a> It allows you to move the camera with the WASD keys, when your view angle gets smaller (less straight overhead) it switches to the oblique views. (It would be nicer if you could use the mouse to rotate though... <a href="https://gist.github.com/1192690">patches welcome</a>)

Just viewing the obliques with NearMap's front end at nearmap.com, you will often find all the buildings are slanted on an angle, with my viewer however you can correct this to make them straight and looking nice again by tweaking the camera rotation. If nothing else came out of this experiment I think that just the mere ability to easily correct this artefact to produce nicer looking obliques made it a worthwhile endeavour.

You could push the concept further and add perspective (like Google Earth, rather than my simple parallel projection) and have each tile pick the optimal {Vert|N|S|E|W} layer, although with LIDAR progressing we can now capture true 3D so we don't need to fake it with 2D images any more...