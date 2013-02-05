Title: COMP3421 - Lec 1 - Colour
Date: 2009-08-22 09:29:25
Tags: comp3421,graphics

<h2>Colour</h2>
Pure spectral light, is where the light source has just one single wavelength. This forms monochromatic (or pure spectral) colours.

<a href="/blog/attachments/2009/07/spectrum.png"><img class="aligncenter size-full wp-image-647" title="spectrum" src="/blog/attachments/2009/07/spectrum.png" alt="spectrum" width="450" height="51" /></a>

However mostly light is made up of light of multiple wavelengths so you end up with a distribution of wavelengths. You could describe colour by this frequency distribution of wavelengths. For example brown is not in the spectrum, but we can get brown from this distribution of different light wavelengths,

[caption id="attachment_648" align="aligncenter" width="374" caption="Spectral Distribution for a Brown Colour (http://www.cs.rit.edu/~ncs/color/a_spectr.html)"]<a href="/blog/attachments/2009/07/brown_distribution.png"><img class="size-full wp-image-648" title="brown_distribution" src="/blog/attachments/2009/07/brown_distribution.png" alt="brown_distribution" width="374" height="224" /></a>[/caption]
<p style="text-align:left;">We could describe colour like this (as opposed to RGB) but human eyes perceive many different distributions (spectral density functions) as the same colour (that is they are indistinguishable when placed side by side). The total power of the light is known as its luminance which is given by the area under the entire spectrum.</p>
<p style="text-align:left;">The human eye has three cones (these detect light), the short, medium and long cones (we have two kinds of receptors cones and rods, rods are good for detecting in low light but they cannot detect colour or fine detail). The graph below shows how these three cones respond to different wavelengths.</p>


[caption id="attachment_649" align="aligncenter" width="300" caption="(Source: http://en.wikipedia.org/wiki/File:Cones_SMJ2_E.svg)"]<a href="/blog/attachments/2009/07/300px-cones_smj2_e-svg.png"><img class="size-full wp-image-649" title="300px-Cones_SMJ2_E.svg" src="/blog/attachments/2009/07/300px-cones_smj2_e-svg.png" alt="300px-Cones_SMJ2_E.svg" width="300" height="227" /></a>[/caption]
<p style="text-align:left;">So the colour we see is the result of our cones relative responses to RGB light. Because of this the human eye cannot distinguish some distributions that are different, to the eye they appear as the same color, hence you don't need to recreate the exact spectrum to create the same sensation of colour. We can just describe the colour as a mixture of three colours.</p>
<p style="text-align:left;">There are three CIE standard primaries X, Y, Z. An XYZ colour has a one to one match to RGB colour. (See <a href="http://www.cs.rit.edu/~ncs/color/t_spectr.html">http://www.cs.rit.edu/~ncs/color/t_spectr.html</a> for the formulae.)</p>
<p style="text-align:left;">Not all visible colours can be produced using the RGB     system.</p>
<p style="text-align:left;">=====</p>
<p style="text-align:left;">Where S, P, N are spectral functions,</p>
<p style="text-align:left;">if S = P then N + S = N + P (ie. we can add a colour to both sides and if they were perceived the same before, they will be percieved the same after)</p>
<p style="text-align:left;">On one side you project $latex S(\lambda)$ on the other you project combinations of A, B and C to give $latex aA(\lambda) + bB(\lambda) + cC(\lambda)$</p>
<p style="text-align:left;">By experimentation it was shown that to match any pure spectral colour $latex \lambda$ you needed the amounts of RGB shown,</p>
<p style="text-align:left;">=====</p>
<p style="text-align:left;">To detirmine the XYZ of a colour from its spectral distribution  you need to use the following equations,</p>
<p style="text-align:left;">$latex X= \int_0^\infty I(\lambda)\,\overline{x}(\lambda)\,d\lambda$
$latex Y= \int_0^\infty I(\lambda)\,\overline{y}(\lambda)\,d\lambda$
$latex Z= \int_0^\infty I(\lambda)\,\overline{z}(\lambda)\,d\lambda$</p>
<p style="text-align:left;">Where the $latex \overline{x}$, $latex \overline{y}$ and $latex \overline{z}$ functions are defined as,</p>
<p style="text-align:left;"></p>


[caption id="attachment_705" align="aligncenter" width="446" caption="The CIE 1931 XYZ colour matching functions. (Source: http://commons.wikimedia.org/wiki/File:CIE_1931_XYZ_Color_Matching_Functions.svg CC-BY-SA)"]<a href="/blog/attachments/2009/08/446px-cie_1931_xyz_color_matching_functions-svg.png"><img class="size-full wp-image-705" title="446px-CIE_1931_XYZ_Color_Matching_Functions.svg" src="/blog/attachments/2009/08/446px-cie_1931_xyz_color_matching_functions-svg.png" alt="The CIE 1931 XYZ color matching functions." width="446" height="271" /></a>[/caption]
<h2>CIE Chromaticity Diagram</h2>
We can take a slice of the CIE space to get the CIE chromaticity diagram.

<a href="/blog/attachments/2009/08/cie3d.png"><img class="aligncenter size-full wp-image-903" title="cie3d" src="/blog/attachments/2009/08/cie3d.png" alt="(Source: Hill)" width="450" height="365" /></a><a href="/blog/attachments/2009/08/495px-cie1931xy_blank-svg.png"><img class="aligncenter size-full wp-image-904" title="495px-CIE1931xy_blank.svg" src="/blog/attachments/2009/08/495px-cie1931xy_blank-svg.png" alt="Source: http://en.wikipedia.org/wiki/File:CIE1931xy_blank.svg" width="450" height="478" /></a>
<h2>RGB</h2>
<a href="/blog/attachments/2009/08/fsc_stego_kessler_fig021.jpg"><img class="aligncenter size-full wp-image-711" title="fsc_stego_kessler_fig02" src="/blog/attachments/2009/08/fsc_stego_kessler_fig021.jpg" alt="fsc_stego_kessler_fig02" width="436" height="399" /></a>(r, g, b) is the amount of red, green and blue primaries.
<h2>CMY</h2>
CMY is a subtractive colour model (inks and paint works this way). (c,m,y) = (1,1,1) - (r,g,b).

But inks don't always subtract well so printers usually use a black ink as well using CMYK.
<h2>HSV</h2>
The HSV colour model is really good for allowing the user to select a colour as they choose the hue (colour), saturation (how rich the colour is) and value (how dark the colour is).

[caption id="attachment_712" align="aligncenter" width="450" caption="HSV Colour Cone"]<a href="/blog/attachments/2009/08/450px-hsv_color_cone.png"><img class="size-full wp-image-712" title="450px-HSV_Color_Cone" src="/blog/attachments/2009/08/450px-hsv_color_cone.png" alt="HSV Colour Cone" width="450" height="360" /></a>[/caption]
<h2>Gamut</h2>
Gamut is the range of colours available which is represented as a triangle in the CIE Chromacity diagram. Different devices have different gamuts (for instance the printer and LCD monitor).
<ul>
	<li>Gamut Clipping - A shading in one image becomes just a solid colour in the other.</li>
	<li>Gamut Scaling - Shading looks the same but the size of the gamut is minimal.</li>
</ul>
<p style="text-align:left;"></p>
