package ;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.util.FlxColor;
#if !doc
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.display.Graphics;
import flash.display.Sprite;
import flash.Lib;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;
import flixel.FlxG;
import flixel.system.FlxPreloaderBase;
import flash.events.Event;


@:bitmap("bg.png") private class AdBG extends BitmapData { } 

/**
 * This is the Default HaxeFlixel Themed Preloader 
 * You can make your own style of Preloader by overriding FlxPreloaderBase and using this class as an example.
 * To use your Preloader, simply change Project.xml to say: <app preloader="class.path.MyPreloader" />
 */
class FGLFlxPreloader extends FlxPreloaderBase
{
	#if !js
	
	private static var BlendModeScreen = BlendMode.SCREEN;
	private static var BlendModeOverlay = BlendMode.OVERLAY;
	
	private var _buffer:Sprite;
	private var _bmpBar:Bitmap;
	private var _text:TextField;
	private var _logo:Sprite;
	private var _logoGlow:Sprite;

	
	private var wrapper:FGLWrapper;
	
	/**
	 * Initialize your preloader here.
	 */
	override public function new(MinDisplayTime:Float = 15, ?AllowedURLs:Array<String>):Void
	{
		super(MinDisplayTime, AllowedURLs);
		
		addEventListener(Event.ADDED_TO_STAGE, init);
        addEventListener(Event.REMOVED_FROM_STAGE, dispose);
	}
	
	private function init(?e:Event)
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
		
        wrapper = new FGLWrapper(
        {
            adid: "FGL-XXXXXXXX",
            gametitle: "",
            developer: "", 
            developerlink: "", // your url
            onerror: adFinished,  // function(e:Event)
            oncomplete: adFinished,  // function(e:Event)
            custombackground: new Bitmap(new AdBG(0, 0)), // optional displayobject to use as background
           
            sponsor: "",     // sponsor's name
            sponsorlink: "", // sponsor's url
            background: 0xff204631, // optional  background color
            titletext: 0xFFFFFF, // color for the game name
            titlebackground: 0x000000, // background color underlaying the game name
            fgltext: 0xFFFFFF, // color for the 'ads by fgl'
            fglbackground: 0x000000, // background color underlaying 'ads by fgl'
            preloadertext: 0x999999, // preloader text color
            preloaderbar: 0xffd7e894, // preloader progress bar color
            preloaderbackground: 0x000000, // preloader bar background color
            adbackground: 0x000000, // ad box background
            playbuttonbackground: 0xFFFFFF, // play button background
            playbuttontext: 0x000000, // play button text color
            playbuttonborder: 0xFFFFFF // play button border color
           
        });
        
        addChild(wrapper);
		
		
    }
	
	
	/**
	 * This class is called as soon as the FlxPreloaderBase has finished Initalizing.
	 * Override it to draw all your graphics and things - make sure you also override update
	 * Make sure you call super.create()
	 */
	override private function create():Void
	{
		
	}
	
	/**
	 * This function simply draws the HaxeFlixel logo.
	 * @param	graph
	 */
	private function drawLogo(graph:Graphics):Void
	{
		// draw green area
		graph.beginFill(0x00b922);
		graph.moveTo(50, 13);
		graph.lineTo(51, 13);
		graph.lineTo(87, 50);
		graph.lineTo(87, 51);
		graph.lineTo(51, 87);
		graph.lineTo(50, 87);
		graph.lineTo(13, 51);
		graph.lineTo(13, 50);
		graph.lineTo(50, 13);
		graph.endFill();
		
		// draw yellow area
		graph.beginFill(0xffc132);
		graph.moveTo(0, 0);
		graph.lineTo(25, 0);
		graph.lineTo(50, 13);
		graph.lineTo(13, 50);
		graph.lineTo(0, 25);
		graph.lineTo(0, 0);
		graph.endFill();
		
		// draw red area
		graph.beginFill(0xf5274e);
		graph.moveTo(100, 0);
		graph.lineTo(75, 0);
		graph.lineTo(51, 13);
		graph.lineTo(87, 50);
		graph.lineTo(100, 25);
		graph.lineTo(100, 0);
		graph.endFill();
		
		// draw blue area
		graph.beginFill(0x3641ff);
		graph.moveTo(0, 100);
		graph.lineTo(25, 100);
		graph.lineTo(50, 87);
		graph.lineTo(13, 51);
		graph.lineTo(0, 75);
		graph.lineTo(0, 100);
		graph.endFill();
		
		// draw light-blue area
		graph.beginFill(0x04cdfb);
		graph.moveTo(100, 100);
		graph.lineTo(75, 100);
		graph.lineTo(51, 87);
		graph.lineTo(87, 51);
		graph.lineTo(100, 75);
		graph.lineTo(100, 100);
		graph.endFill();
	}
	
	/**
	 * Cleanup your objects!
	 * Make sure you call super.destroy()!
	 */
	override private function destroy():Void
	{
		if (_buffer != null)	
		{
			removeChild(_buffer);
		}
		_buffer = null;
		_bmpBar = null;
		_text = null;
		_logo = null;
		_logoGlow = null;
		super.destroy();
	}
	
	/**
	 * Update is called every frame, passing the current percent loaded. Use this to change your loading bar or whatever.
	 * @param	Percent	The percentage that the project is loaded
	 */
	override public function update(Percent:Float):Void
	{
		
	}
	
	// called when the ad closes or errors, OpenFL then proceeds 
    // to add your own document class to the stage as normal
    private function adFinished(e:Event)
    {
        dispatchEvent (new Event (Event.COMPLETE));
    }
	
	// required for OpenFL ApplicationMain.hx
    override public function onLoaded()
    {
        wrapper.preloaderLoaded = true;
    }

	
	private function dispose(e:Event)
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        removeEventListener(Event.REMOVED_FROM_STAGE, dispose);
    }
	#end
}
#end