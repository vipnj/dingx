/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

/* class CompoundVisual2D */

package org.joelTong.dingX.twoD.visualizations
{
	import flash.display.Sprite;
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	
	 
	 /*This class is a container class if you want to put together more than 1 visualization. */
	public class CompoundVisual2D extends Sprite {
		
		/* Constructor */
		public function CompoundVisual2D():void {
			super();
		}
		
		/* performs the same function as addChild */
		public function addVisualizer(visualizer2D:Sprite):void {
			this.addChild(visualizer2D);
		}
		
	}
	
}