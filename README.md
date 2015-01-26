# FGLAds for HaxeFlixel
### With Mochi Media style preloader

A port of [Ben Lowry's](https://github.com/benlowry) [FGLAds Preloader Wrapper](https://github.com/benlowry/openfl-fglads-preloader) for OpenFL and AS3 to HaxeFlixel.

### Changes to the original version:
Since the default HaxeFlixel preloader inherits from FlxPreloaderBase and not NMEPreloader (at least not directly) some changes were needed to make this custom preloader work out of the box. The only file that had to be changed was FGLPreloader.hx, which in this fork is replaced by FGLFlxPreloader.hx. The code for implementing it in the project's xml is also slightly different, but other than that, everything has been kept the same including the available customization options; for help on this, please check the original repository [here](https://github.com/benlowry/openfl-fglads-preloader). Many thanks to Ben Lowry for his original work and doing all the heavy lifting! :D

### Features include:
- attractive preloading bar
- preloading bar converts into play button after the game is finished loading *and* at least 15 seconds have passed
- fully customizable appearance and behavior

### Usage (HaxeFlixel):
Copy the three FGL*.hx files into your project, and then in your project's xml file replace the default preloader with this one:

    <app preloader="FGLFlxPreloader" />


### License:

The MIT License (MIT)

Copyright (c) 2014 Andrej Preradovic

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.