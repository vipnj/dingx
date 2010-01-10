/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

/* BasicSpectrumLine.as */

package org.joelTong.dingX.twoD.visualizations
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	import flash.media.SoundMixer;
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	
	/**
	 * The BasicSpectrumLine class is a handy class that draws a simple line spectrum using
	 * Flash's drawing API.  It currently outputs a Sprite and may be extended as a Bitmap to 
	 * take advantage of Flash's powerful filter classes.  To use, add it to an initializer 
	 * using the addVisualizer() function.
	 * 
	 * @see org.joelTong.dingX.twoD.initializers.InitializerTwoD#addVisualizer()
	 * @see package org.joelTong.dingX.common.palette.ColorPattern
	 * 
	 */
	public class BasicSpectrumLine extends Sprite {
		
		private var _w:int;
		private var _h:int;
		private var _thickness:Number;
		private var _performFFT:Boolean;
		private var _amplitude:int;
		private var _timerUpdate:int;
		private var _lineColor:int;
		private var _transparency:Number;
		
		/**
		 * This constructor creates a BasicSpectrumLine instance.
		 * @param	w width of visualizer
		 * @param	h height of visualizer
		 * @param	thickness line thickness
		 * @param	performFFT boolean to determine if Fast Fourier Transform (FFT) is performed.
		 * @param	amplitude amplitude of wave generated
		 * @param	timerUpdate time to update visualizer
		 * @param	lineColor color of line, in RGB format
		 * @param	transparency alpha of sprite, maximum alpha = 1.
		 */
		public function BasicSpectrumLine(w:int, h:int, thickness:Number = 1, performFFT:Boolean = false,
											amplitude:int = 150, timerUpdate:int = 50, 
											lineColor:uint = 0xFFFFFF, transparency:Number = 0.3):void {
			super();
			
			_transparency = transparency;
			_w = w;
			_h = h;
			_thickness = thickness;
			_performFFT = performFFT;
			_amplitude = amplitude;
			_timerUpdate = timerUpdate;
			_lineColor = lineColor;
			
			this.alpha = _transparency;
			
			var timer:Timer = new Timer(_timerUpdate, 0);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
			
		private function onTimer(e:TimerEvent):void {
			this.graphics.clear();
			this.graphics.lineStyle(_thickness, _lineColor);
			this.graphics.moveTo(0, _h / 2);
			
			var bytes:ByteArray = new ByteArray();
			SoundMixer.computeSpectrum(bytes, _performFFT,0);
			
			for (var i:uint = 0; i < 512; i++) {
				var n:Number = bytes.readFloat();
				this.graphics.lineTo(i * _w / 512, _h / 2 + (n * _amplitude));
			}		
		}	
	}
}