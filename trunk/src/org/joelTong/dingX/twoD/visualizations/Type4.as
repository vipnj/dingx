/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

/* class Type4 (experimental) */

package org.joelTong.dingX.twoD.visualizations
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import flash.utils.ByteArray;
	import flash.media.SoundMixer;
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.actions.Fade;
	import org.flintparticles.common.counters.PerformanceAdjusted;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.initializers.ColorInit;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.actions.Accelerate;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.renderers.BitmapRenderer;
	import org.flintparticles.twoD.renderers.PixelRenderer;
	import org.flintparticles.twoD.zones.PointZone;
	import org.flintparticles.twoD.zones.RectangleZone;
	import org.joelTong.dingX.common.palette.ColorPattern;
	import org.joelTong.dingX.common.palette.MinMaxColor32;
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	
	 /**
	  * The class Type4 creates a typical line spectrum analyzer.  However, the "line" is drawn
	  * using 512 particles and not the actual line drawing API found in Flash.  There are 512 emitters,
	  * each emitter emitting a variable number of particles subject to changes in beat from the sound 
	  * spectrum.  The rate of update is subject to a combination of variables, namely: 
	  * minParticles, 
	  * maxParticles, 
	  * fps, 
	  * lifeTime, 
	  * blurX and blurY.
	  * 
	  */
	public class Type4 extends Sprite {
		
		private var _w:int;
		private var _h:int;
		private var _noChannels:int;
		private var _minParticles:int;
		private var _maxParticles:int;
		private var _fps:int;
		private var _lifeTime:Number;
		private var _gravity:int;
		private var _timerUpdate:int;
		private var _amplitude:int;
		private var _performFFT:Boolean;
		private var _blurX:int;
		private var _blurY:int;
		
		
		private var emitterArray:Array = new Array();
		private var presentPosition:Array = new Array();
		
		private var renderer:BitmapRenderer;
		
		private var timer:Timer;
		
		
		/**
		 * This constructor instantiates a Type4 object.  It features a color mode that can be set by passing
		 * in an instance of the ColorPattern object.  To use visualization, add it to an InitializerTwoD object.
		 *
		 * <p>Certain variables will dramatically alter performance.  Please refer to comments for more details.  
		 * @see org.joelTong.dingX.twoD.initializers.InitializerTwoD#addVisualizer()
		 * @see package org.joelTong.dingX.common.palette.ColorPattern
		 * 
		 * @param	w width of visualizer
		 * @param	h height of visualizer
		 * @param	minParticles Minimum number of particles emitted.  Will affect update rate.
		 * @param	maxParticles Maximum number of particles emitted.  Will affect update rate.
		 * @param	fps Optimal FPS to achieve.  Will affect performance.
		 * @param	lifeTime Maximum lifetime of particle.  Will affect performance.
		 * @param	gravity Gravity to use on particle in the Y-axis direction.
		 * @param	timerUpdate time to update sound spectrum data.  Will affect performance.
		 * @param	amplitude Amplitude of wave.
		 * @param	performFFT To perform Fast Fourier Transform on sound spectrum.
		 * @param	blurX blur in X axis direction.  Will affect performance significantly.
		 * @param	blurY blur in Y axis direction.  Will affect performance significantly.
		 * @param	colorPattern color pattern to use.  If not passed, it uses orange.
		 */
		public function Type4(w:int , h:int , minParticles:int = 10, maxParticles:int = 20,
								fps:int = 24, lifeTime:Number = 0.5, gravity:int = 5, 
								timerUpdate:int = 50, amplitude:int = 50, 
								performFFT:Boolean = false, blurX:int = 2, blurY:int = 2,
								colorPattern:ColorPattern = null):void {
			_w = w ;
			_h = h ;
			_minParticles = minParticles;
			_maxParticles = maxParticles;
			_fps = fps;
			_lifeTime = lifeTime;
			_gravity = gravity;
			_timerUpdate = timerUpdate;
			_amplitude = amplitude;
			_performFFT = performFFT;
			_blurX = blurX;
			_blurY = blurY;
			
			super();
			
			renderer = new PixelRenderer(new Rectangle(0, 0, _w, _h));
			renderer.addFilter(new BlurFilter(_blurX, _blurY, 1));
			renderer.addFilter( new ColorMatrixFilter( [
					1,0,0,0,0,
					0,1,0,0,0,
					0,0,1,0,0,
					0, 0, 0, .93, 0 ] ) );
			this.addChild(renderer);

			if (colorPattern == null) {
				colorPattern = new ColorPattern();
				colorPattern.pushColor(new MinMaxColor32(0xFFDDCC00, 0xFFFFCCDD));
				//0xFF00FFFF.0xFFFFFFFF
			}
			
			for (var i:uint = 0; i < 512; i++) {
				var emitter:Emitter2D = new Emitter2D();
				emitter.addInitializer(new Lifetime(0, _lifeTime));
				emitter.addInitializer(new ColorInit(colorPattern.getMinSpecificColor(i), 
													colorPattern.getMaxSpecificColor(i)));
				presentPosition.push(new Position());

				emitter.counter = new PerformanceAdjusted(_minParticles, _maxParticles, _fps);
				emitter.addAction(new Move());
				emitter.addAction(new Fade());
				emitter.addAction(new Age());
				emitter.addAction(new Accelerate(0, _gravity));
				emitter.start();
				renderer.addEmitter(emitter);
				emitterArray.push(emitter);
			}
			
			timer = new Timer(_timerUpdate, 0);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();

		}
		
		private function onTimer(e:TimerEvent):void {
			
			var bytes:ByteArray = new ByteArray();
			SoundMixer.computeSpectrum(bytes, _performFFT,0);
			
			for (var i:uint = 0; i < 512; i++) {
				var n:Number = bytes.readFloat();
				var curPosition:Position = presentPosition[i];
				emitterArray[i].removeInitializer(curPosition);
				presentPosition[i] = new Position(new PointZone(new Point(i * _w / 512, _h / 2 + (n * _amplitude))));
				emitterArray[i].addInitializer(presentPosition[i]);
				
				
			}
			
		}
	}
	
}