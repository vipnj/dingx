/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

/* class type 2 (experimental) */

package org.joelTong.dingX.twoD.visualizations
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.actions.Fade;
	import org.flintparticles.common.counters.Blast;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.displayObjects.Dot;
	import org.flintparticles.common.displayObjects.RadialDot;
	import org.flintparticles.common.displayObjects.Rect;
	import org.flintparticles.common.initializers.ColorInit;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.common.initializers.SharedImage;
	import org.flintparticles.twoD.actions.AntiGravity;
	import org.flintparticles.twoD.actions.BoundingBox;
	import org.flintparticles.twoD.actions.DeathSpeed;
	import org.flintparticles.twoD.actions.Explosion;
	import org.flintparticles.twoD.actions.GravityWell;
	import org.flintparticles.twoD.actions.GravityWell;
	import org.flintparticles.twoD.actions.MinimumDistance;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.actions.MutualGravity;
	import org.flintparticles.twoD.actions.SpeedLimit;
	import org.flintparticles.twoD.activities.RotateEmitter;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.renderers.BitmapLineRenderer;
	import org.flintparticles.twoD.renderers.BitmapRenderer;
	import org.flintparticles.twoD.renderers.PixelRenderer;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.zones.DiscZone;
	
	import org.flintparticles.common.*;
	import org.flintparticles.twoD.*;
	
	import flash.media.SoundMixer;
	import flash.utils.ByteArray;
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	
	/**
	 * This constructor creates a visualization made up of rectangular particles.
	 * This was insipred by Type1 and is in  celebration of new year's day 2010.  It
	 * is based on the Flint Particle system developed by Richard Lord.
	 * To use visualization, add it to an InitializerTwoD object.
	 * 
	 * @see org.joelTong.dingX.twoD.initializers.InitializerTwoD#addVisualizer()
	 */
	public class Type2 extends Sprite {
		
		private var _w:int;									//width of visualiser
		private var _h:int;									//height of visualiser
		private var _noChannels:uint;						//no of sound channels to track (per emitter)
		private var _noParticles:int;						//no. of particles per emitter
		private var _explosionPower:Number;					//magnitude of explosion per beat
		private var _explosionThreshold:int;				//scale of explosion to count as 1 beat
		private var _particleBlurRadius:int;				//blur radius per particle
		private var _particleWidth:int;					//size of particles emitted
		private var _particleHeight:int;
		
		private var emitter:Array = new Array();
		private var renderer:BitmapRenderer;
		
		/**
		 * This constructor creates a visualization made up of rectangular particles.
		 * This was insipred by Type1 and is in  celebration of new year's day 2010.  It
		 * is based on the Flint Particle system developed by Richard Lord.
		 * To use visualization, add it to an InitializerTwoD object.
		 * 
		 * @see org.joelTong.dingX.twoD.initializers.InitializerTwoD#addVisualizer()
		 * @param	w width of visualization.
		 * @param	h height of visualization.
		 * @param	noChannels number of channels of sound spectrum to analyze.
		 * @param	noParticles number of particles used per channel.  The more the merrier
		 * but needs more processing power.
		 * @param	explosionPower the power of the explosion coming from speaker.
		 * @param	explosionThreshold Threshold of explosion.  This is set for beat detection.
		 * @param	particleWidth Width of rectangle.  Note that it is a random value from
		 * value specified.
		 * @param	particleHeight Height of particle.Note that it is a random value from
		 * value specified.  
		 * @param	particleBlurRadius Blue filer radius used on particle.
		 */
		public function Type2(w:int, h:int, noChannels:uint = 5, noParticles:int = 40, 
								explosionPower:Number = 1.7, explosionThreshold:int = 70,
								particleWidth:int = 20, particleHeight:int = 20, 
								particleBlurRadius:int = 4):void {
			super();
			
			_w = w;
			_h = h;
			_noParticles = noParticles;
			_explosionPower = explosionPower;
			_noChannels = noChannels;
			_explosionThreshold = explosionThreshold;
			_particleBlurRadius = particleBlurRadius;
			_particleWidth = particleWidth;
			_particleHeight = particleHeight;
			
			
			renderer = new BitmapRenderer(new Rectangle(0, 0, _w, _h));
			renderer.addFilter( new BlurFilter( _particleBlurRadius, _particleBlurRadius, 1 ) );
			renderer.addFilter( new ColorMatrixFilter( [ 1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.99,0 ] ) );

			
			for (var i:uint = 0; i < _noChannels; i++) {
				var tempEmitter:Emitter2D = new Emitter2D();
				emitter.push(tempEmitter);
				var minColor:uint = 0xFFcc0000;
				var maxColor:uint = 0xFFccFF00;;
				if (i == 0) {
					minColor = 0xFFcc0000;
					maxColor = 0xFFccFF00;
				} else if (i == 4) {
					minColor = 0xFFCCCCCC;
					maxColor = 0xFFFFFFFF;
				}
				
				tempEmitter.addInitializer( new ColorInit( minColor, maxColor) );
				
				tempEmitter.addInitializer(new SharedImage(new Rect(_particleWidth * Math.random(),
																	_particleHeight * Math.random(),0xFFFFFF)));
				tempEmitter.addInitializer( new Position(new DiscZone(new Point(_w / 2, _h / 2), _w / 2 )));
				tempEmitter.addInitializer(new Lifetime(0, 2));
				
				tempEmitter.addAction(new Move());
				tempEmitter.addAction(new Fade());
				tempEmitter.addAction(new GravityWell(100, 0, 0));
				tempEmitter.addAction(new GravityWell(100, 0, _h));
				tempEmitter.addAction(new GravityWell(100, _w, 0));
				tempEmitter.addAction(new GravityWell(100, _w, _h));
				
				tempEmitter.addAction(new GravityWell(100, _w/2, 0));
				tempEmitter.addAction(new GravityWell(100, _w/2, _h));
				tempEmitter.addAction(new GravityWell(100, 0, _h/2));
				tempEmitter.addAction(new GravityWell(100, _w, _h/2));
				tempEmitter.addAction(new GravityWell(110, _w / 2, _h / 2));
				
				tempEmitter.addAction(new SpeedLimit(250));
				tempEmitter.addAction(new MinimumDistance(20, 20));
				tempEmitter.addAction(new Age());
				tempEmitter.addAction(new BoundingBox(0, 0, _w, _h));
				
				renderer.addEmitter(tempEmitter);
				
				tempEmitter.start();
			}
			
			addChild(renderer);
			
			var timer:Timer = new Timer(100, 0);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			
		}
		
		private function onTimer(e:TimerEvent):void {

			var bytes:ByteArray = new ByteArray();
			SoundMixer.computeSpectrum(bytes, true, 0);
			var initialRef:uint = 0;
			for (var i:Number = 0; i < 512; i+= (512 /  _noChannels)) {
				var n:Number = bytes.readFloat();
				if (initialRef < _noChannels) {
					emitter[initialRef].counter = new Steady(Math.abs(new int(n * _noParticles)));
					if ( (Math.abs(new int(n * 100))) > _explosionThreshold ) {
						emitter[initialRef].addAction(new Explosion(_explosionPower, _w / 2, _h / 2, new int(Math.abs(n * 200))))
					}
					
				}
				initialRef++;
			}
			
		}
		
	}
	
}