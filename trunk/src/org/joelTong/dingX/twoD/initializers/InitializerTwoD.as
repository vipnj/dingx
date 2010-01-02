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
	public class InitializerTwoD extends Sprite {
		
		public var visualizers:Array = new Array();
		
		/* this is the initializer */
		public function InitializerTwoD(w:int, h:int, fill:uint = 0x000000):void {
			super();
			this.graphics.beginFill(fill);
			this.graphics.drawRect(0, 0, w, h);
		}
		
		/* This function is used for adding visualizations 
		 * timeToKill > timeToTransit
		 * */
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
		
		/* Used with addVisualizer() */
		private function hideAway():void {
			this.removeChildAt(0);
			this.visualizers = this.visualizers.splice(1, 1);		
		}
		
	}
	
}