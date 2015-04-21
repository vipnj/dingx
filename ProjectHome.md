<img src='http://joeltong.org/dingx/img/logo_small.jpg'></img>
<p>
This package for Actionscript 3 is designed to facilitate the easy deployment of 3D / 2D sound visualizations for Flash-based music players. Used in conjunction with PV3D and Tweener.<br>
<br>
<br>
See what DingX can do!<br>
<br><b>Type 2 - <a href='http://joeltong.org/blog/flash/3dSoundSpectrum/soundSpectrum3D_4.swf'>http://joeltong.org/blog/flash/3dSoundSpectrum/soundSpectrum3D_4.swf</a></b><br><b>Type 1 - <a href='http://joeltong.org/blog/flash/3dSoundSpectrum/soundSpectrum3D_2.swf'>http://joeltong.org/blog/flash/3dSoundSpectrum/soundSpectrum3D_2.swf</a></b><br><b>BoxGrid3D - <a href='http://www.joeltong.org/blog/flash/3dSoundSpectrum/soundSpectrum3D.swf'>http://www.joeltong.org/blog/flash/3dSoundSpectrum/soundSpectrum3D.swf</a></b>


DingX needs 3 lines of code to implement!<br>
<br>1. Create the initializer. (Every visualization needs an initializer)<br>
<br>2. Create a new visualization. (For now, only supports 1 visualization)<br>
<br>3. Add the visualization to the initializer.<br>
<br>4. Add the initializer to the stage.<br>
<br>
<br>
e.g.<br>
<pre><code>var initializer:InitializerTwoD = new InitializerTwoD(stage.stageWidth, stage.stageHeight);<br>
initializer.addVisualizer(new Type2(stage.stageWidth, stage.stageHeight));<br>
addChild(initializer);<br>
</code></pre>

COMPILING REQUIREMENTS:<br>
<br>1.) Papervision 3D - <a href='http://code.google.com/p/papervision3d/'>http://code.google.com/p/papervision3d/</a>
<br>2.) Flint Particle System - <a href='http://code.google.com/p/flint-particle-system/'>http://code.google.com/p/flint-particle-system/</a>
<br>3.) DingX (of course)<br>
<br>
<br>
Please see the examples in SVN repository for more information.<br>
<br>
Visit www.joeltong.org/blog for more information / post queries!<br>
<br>
Enjoy!<br>
<br>
<br>
Best rgds,<br>
<br>Joel Tong (Tong Haowen Joel)<br>
<br>www.joeltong.org/blog/<br>
<br>DingX Webmaster<br>
