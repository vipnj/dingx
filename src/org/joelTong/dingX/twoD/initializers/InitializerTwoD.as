/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

package org.joelTong.dingX.twoD.initializers
{
	import flash.display.Sprite;
	
	import caurina.transitions.*;
	
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	
	 /**
	  * The InitializerTwoD object constructor creates a renderer for the visualization.  
	  * As a rule of thumb, it is best to initialize the visualization within an InitializerTwoD renderer
	  * so that all visualizations can be handled efficiently and properly encapsulated.  Only
	  * one visualization can be displayed at any one time.
	  */
	public class InitializerTwoD extends Sprite {
		
		public var visualizers:Array = new Array();
		
		/**
		 * The InitializerTwoD object constructor creates a renderer for the visualization.  
		 * As a rule of thumb, it is best to initialize the visualization within an InitializerTwoD renderer
		 * so that all visualizations can be handled efficiently and properly encapsulated.  Only
		 * one visualization can be displayed at any one time.
		 * <p>
		 * To add a visualization, use the addVisualizer method.
		 * <p>
		 * @param	w width of container
		 * @param	h height of container
		 * @param	fill fill of container
		 */
		public function InitializerTwoD(w:int, h:int, fill:uint = 0x000000):void {
			super();
			//this.graphics.beginFill(fill);
			//this.graphics.drawRect(0, 0, w, h);
		}
		
		 /**
		  * This function adds a new visualizer to the initializer.  If there is more than 1 visualizer,
		  * the transition function will be called and the existing visualization deleted.
		  * To facilitate efficient memory management, it is recommended that you place all visualizations
		  * intended for use in an array and call the addVisualizer() function when you need to use it.
		  * <p>
		  * BUG: There is a memory leak problem when changing animations.  Use switching with care.
		  * <p>
		  * @param	visualizer2D visualizer to use.  Must be 2D.
		  * @param	timeToKill  Time to kill current visualization.  NOTE: timeToKill > timeToTransit.
		  * @param	timeToTransit Time to transit to next visualization.  NOTE: timeToKill > timeToTransit.
		  */
		public function addVisualizer(visualizer2D:Sprite, timeToKill:Number = 2, 
										timeToTransit:Number = 1):void {
			if (visualizers.length == 0) {
				visualizers.push(visualizer2D);
				this.addChild(visualizers[0]);
			} else if (visualizers.length == 1 && visualizers[0] != visualizer2D) {
				Tweener.addTween(visualizers[0], { time: timeToKill, alpha:0, onComplete:hideAway } );
				visualizers.push(visualizer2D);
				visualizer2D.alpha = 0;
				Tweener.addTween(visualizers[1], { time: timeToTransit, alpha:1} );
				this.addChild(visualizers[1]);
			}
		}
		
		/* Used with addVisualizer() for transition purposes. */
		private function hideAway():void {
			this.removeChildAt(0);
			this.visualizers = this.visualizers.splice(1, 1);		
		}
		
	}
	
}