/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

/* class RotatingContainer */

package org.joelTong.dingX.twoD.visualizations
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.joelTong.dingX.twoD.visualizations.CompoundVisual2D;
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	
	 /**
	  * The RotatingContainer class makes it very easy to rotate a visualiztion without much effort.
	  * Instead of the registration point being at (0,0) of the graphic, the registration point is
	  * now at the center of the object.  To use, see www.joeltong.org/dingx/examples/ for more details.
	  * <p>
	  * Note that if you want the visualization to be centered, on the main stage use:
	  * <p>
	  * x = stage.stageWidth / 2;
	  * <br>
	  * y = stage.stageHeight / 2;
	  */
	public class RotatingContainer extends CompoundVisual2D {
		
		private var _degree:Number;
		
		/* This constructor creates a RotatingContainerObject.  Useful if you need to constantly rotate 
		 * a visualizer for added effect.  Use with start() and stop().
		 */
		public function RotatingContainer(degree:Number):void {
			super();
			_degree = degree;
		}
		
		
	    /**
		 * This function adds a visualizer to the object.  Behaves the same way as addChild().
		 * @param	visualizer2D name of visualizer2D to add.  Can be any visual from 
		 * package org.joelTong.dingX.twoD.visualizations.
		 */
		override public function addVisualizer(visualizer2D:Sprite):void {
			var w:int = visualizer2D.width / 2;
			var h:int = visualizer2D.height / 2;
			visualizer2D.x = -w;
			visualizer2D.y = -h;
			this.addChild(visualizer2D);
		}
		
		/**
		 * Start the rotation.
		 */
		public function start():void {
			this.addEventListener(Event.ENTER_FRAME, onRotate);
		}
		
		/**
		 * Stop the rotation.
		 */
		public function stop():void {
			this.removeEventListener(Event.ENTER_FRAME, onRotate);
		}
		
		private function onRotate(e:Event):void {
			this.rotation = (this.rotation + _degree) % 360;		//MOD to prevent overflow.
		}
		
	}
	
}