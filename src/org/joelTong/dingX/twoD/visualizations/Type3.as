/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

/* class type 3 (experimental) 
 * 
 * This class creates a visualization similar to a series of bars
 * Except this time, it is with particles.
 * Features gravity
 * 
 * */

package org.joelTong.dingX.twoD.visualizations
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.media.SoundMixer;
	import flash.utils.Timer;
	import org.flintparticles.common.counters.Pulse;
	import org.flintparticles.common.renderers.Renderer;
	import org.flintparticles.twoD.actions.Jet;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.PixelRenderer;
	import org.flintparticles.twoD.zones.RectangleZone;
	import org.joelTong.dingX.common.palette.ColorPattern;
	import org.joelTong.dingX.common.palette.MinMaxColor32;
	
	
		import flash.system.System;
	import flash.display.*;
	import flash.geom.*;
	import flash.text.*;
	import flash.events.*;
	import flash.filters.*;
	import flash.utils.getDefinitionByName;
	import org.flintparticles.common.counters.*;
	import org.flintparticles.common.displayObjects.*;
	import org.flintparticles.common.actions.*;
	import org.flintparticles.common.initializers.*;
	import org.flintparticles.common.energyEasing.*;
	import org.flintparticles.twoD.actions.*;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.*;
	import org.flintparticles.twoD.renderers.*;
	import org.flintparticles.twoD.zones.*;

	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	public class Type3 extends Sprite {
		
		private var _w:int;
		private var _h:int;
		private var _barW:int;
		private var _barH:int;
		private var _noChannels:int;
		private var _noParticles:int;
		private var _explosionThreshold:Number;
		private var _explosionExponent:int;
		private var _colorPattern:ColorPattern;
		
		private var emitters_Emitter2D:Array = new Array();
		private var jetZones_RectangleZone:Array = new Array();
		private var jetStack:Array = new Array();
		
		private var renderer:BitmapRenderer;
		
		private var timer:Timer;
		
		
		public function Type3(w:int, h:int, noChannels:int = 10, barH:int = 20, noParticles:int = 400,
								explosionThreshold:Number = 70, explosionExponent:int = 20, 
								colorPattern:ColorPattern = null):void {
			super();
			_w = w; 
			_h = h;
			_noChannels = noChannels;
			_barW = _w / noChannels;
			_barH = barH;
			_noParticles = noParticles;
			_explosionThreshold = explosionThreshold;
			_explosionExponent = explosionExponent;
			
			//this set the default pattern if found to have no color passed aka ORANGE.
			if (colorPattern == null) {
				colorPattern = new ColorPattern();
				colorPattern.pushColor(new MinMaxColor32(0xFFDDCC00, 0xFFFFCCDD));
			}
			
			renderer = new PixelRenderer(new Rectangle(0, 0, _w, _h));
			renderer.addFilter(new BlurFilter(8, 8, 1));
			renderer.addFilter( new ColorMatrixFilter( [
					1,0,0,0,0,
					0,1,0,0,0,
					0,0,1,0,0,
					0, 0, 0, .93, 0 ] ) );
			this.addChild(renderer);
			
			
			
					
			for (var i:uint = 0; i < noChannels; i++) {
				var tempEmitter:Emitter2D = new Emitter2D();  
				var tempRectZone:RectangleZone = new RectangleZone(i * _barW, _h - _barH, (i + 1) * _barW, _h);
				emitters_Emitter2D.push(tempEmitter);
				jetZones_RectangleZone.push(tempRectZone); 
				
				tempEmitter.addInitializer(new Position(tempRectZone));
				tempEmitter.addInitializer(new ColorInit(colorPattern.getMinSpecificColor(i), 
														colorPattern.getMaxSpecificColor(i)));
				tempEmitter.addInitializer(new Lifetime(0, 5));
				
				tempEmitter.addAction(new Age());
				tempEmitter.addAction(new Move());
				tempEmitter.addAction(new Fade());
				tempEmitter.addAction(new Accelerate(0, 100));
				tempEmitter.addAction(new DeathZone(new RectangleZone(0, _h, _w, _h + 20), false));
				
				var jet:Jet = new Jet(0, -500, tempRectZone);
				tempEmitter.addAction(jet);
				jetStack.push(jet);
				//tempEmitter.removeAction(jet);
				
				renderer.addEmitter(tempEmitter);
				tempEmitter.start();
			}			
			
			timer = new Timer(50, 0);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function onTimer(e:TimerEvent):void {
			var bytes:ByteArray = new ByteArray();
			SoundMixer.computeSpectrum(bytes, true, 0);
			var initialRef:uint = 0;
			for (var i:Number = 0; i < 512; i+= (512 /  _noChannels)) {
				var n = bytes.readFloat();
				if (initialRef < _noChannels) {
					emitters_Emitter2D[initialRef].counter = new Steady(Math.abs(new int(n * _noParticles)));
					if ( (Math.abs(new int(n * 100))) > _explosionThreshold ) {						
						jetStack[initialRef].y = -Math.abs(new int(n * 100)) * _explosionExponent;
					} else {
						jetStack[initialRef].y = 0;
					}
				}
				initialRef++;
			}
		}
		
	}
	
}