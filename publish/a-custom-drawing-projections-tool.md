Title: A Custom Drawing Projections Tool
Date: 2008-11-29 00:58:56
Tags: industrial technology,projections,technical drawing

Back in 2007 I developed a software tool that could generate technical drawings in a range of drawing projections from a 3D model with emphasis on oblique (both cabinet and cavalier, as well as custom obliques), planometric, dimetric, trimetric and one-point perspective.

I could describe them all as well as many more in terms of what the projected three axis look like on the projection plane. I described them all in terms of a scale on each of the three axis, as well as the angle two of the axis make with the projection plane's horizontal.

[caption id="attachment_130" align="aligncenter" width="151" caption="Description of the projection in terms of the projected view of the three standard basis."]<a href="/blog/attachments/2008/11/pp-description1.png"><img class="size-full wp-image-130" title="pp-description1" src="/blog/attachments/2008/11/pp-description1.png" alt="Description of the projection in terms of the projected view of the three standard basis." width="151" height="154" /></a>[/caption]

In terms of the actual development of the program I'm sure I could have done things a lot better. But I did learn a lot from the experience. The program worked to my needs and did what I wrote it to do so in that sense it was a success. The only downside would be that I did a lot of code rewriting of code that already existed out there (which probably did thinks better than I implemented them). Although since then I have done much more programming and had formal training so have learnt about better methods and practices.

The approach I took was basically import a DXF file, process the data to change its projection, and then export it as a DXF again. I used 3D polylines generated from my 3D model in Rhino and saved as DXF for the input. So I had to write a cutdown DXF reader/writer, as well as a way of storing this data internally and then doing the transformations on it then exporting it back into DXF so I could open it up in AutoCAD.

I only supported points, polylines, circles and arcs as this is basically all that Rhino exported from my model. To simplify the process of circles and arcs I internally converted them to a bunch of polylines as only for some projections they stayed as nice ellipses.

[caption id="attachment_104" align="aligncenter" width="961" caption="The user interface of the tool."]<a href="/blog/attachments/2008/11/ui.png"><img class="size-full wp-image-104" title="ui" src="/blog/attachments/2008/11/ui.png" alt="The user interface of the tool." width="961" height="634" /></a>[/caption]
<p style="text-align:left;">From a very simple model in Rhino, I use the silhouette tool to create the polylines which once impororted into my program produced the following samples.</p>


[caption id="attachment_131" align="aligncenter" width="152" caption="Cabinet Oblique"]<a href="/blog/attachments/2008/11/cabob.png"><img class="size-full wp-image-131" title="Cabinet Oblique" src="/blog/attachments/2008/11/cabob.png" alt="Cabinet Oblique" width="152" height="164" /></a>[/caption]
<p style="text-align:center;"></p>


[caption id="attachment_132" align="aligncenter" width="205" caption="Cavalier Oblique"]<a href="/blog/attachments/2008/11/cavob.png"><img class="size-full wp-image-132" title="Cavalier Oblique" src="/blog/attachments/2008/11/cavob.png" alt="Cavalier Oblique" width="205" height="219" /></a>[/caption]

[caption id="attachment_133" align="aligncenter" width="184" caption="Planometric"]<a href="/blog/attachments/2008/11/plan.png"><img class="size-full wp-image-133" title="Planometric" src="/blog/attachments/2008/11/plan.png" alt="Planometric" width="184" height="276" /></a>[/caption]
<p style="text-align:left;"></p>


[caption id="attachment_134" align="aligncenter" width="180" caption="One Point Perspective"]<a href="/blog/attachments/2008/11/oneptpersp.png"><img class="size-full wp-image-134" title="One Point Perspective" src="/blog/attachments/2008/11/oneptpersp.png" alt="One Point Perspective" width="180" height="201" /></a>[/caption]

There is also a range of built in axonometric projections...

[caption id="attachment_105" align="aligncenter" width="450" caption="A range of axonometric projections are built in."]<a href="/blog/attachments/2008/11/block-all-axonometric.png"><img class="size-full wp-image-105" title="block-all-axonometric" src="/blog/attachments/2008/11/block-all-axonometric.png" alt="A range of axonometric projections are built in." width="450" height="516" /></a>[/caption]

Finally here are some of my production drawings (from my <a href="http://andrew.harvey4.googlepages.com/">2007 HSC ITG Major Work</a> (<a href="http://andrew.harvey4.googlepages.com/itgmajorworkphotos">photos here</a>)) that I used the software to create.

[caption id="attachment_135" align="aligncenter" width="450" caption="Oblique"]<a href="/blog/attachments/2008/11/itg_major_2007_oblique.png"><img class="size-full wp-image-135" title="itg_major_2007_oblique" src="/blog/attachments/2008/11/itg_major_2007_oblique.png" alt="Oblique" width="450" height="317" /></a>[/caption]

[caption id="attachment_136" align="aligncenter" width="450" caption="One Point Perspective"]<a href="/blog/attachments/2008/11/itg_major_2007_persp.png"><img class="size-full wp-image-136" title="itg_major_2007_persp" src="/blog/attachments/2008/11/itg_major_2007_persp.png" alt="One Point Perspective" width="450" height="317" /></a>[/caption]

[caption id="attachment_137" align="aligncenter" width="450" caption="Planometric"]<a href="/blog/attachments/2008/11/itg_major_2007_planometric.png"><img class="size-full wp-image-137" title="itg_major_2007_planometric" src="/blog/attachments/2008/11/itg_major_2007_planometric.png" alt="Planometric" width="450" height="317" /></a>[/caption]

[caption id="attachment_138" align="aligncenter" width="450" caption="Trimetric"]<a href="/blog/attachments/2008/11/itg_major_2007_trimetric.png"><img class="size-full wp-image-138" title="itg_major_2007_trimetric" src="/blog/attachments/2008/11/itg_major_2007_trimetric.png" alt="Trimetric" width="450" height="317" /></a>[/caption]