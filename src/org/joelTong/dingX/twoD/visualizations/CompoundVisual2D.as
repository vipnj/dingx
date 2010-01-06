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
	
	 
	 /**
	  * This class creates a CompoundVisual2D visualization.  Useful if you wish to combine 2 or more 
	  * visualizations together.
	  */
	public class CompoundVisual2D extends Sprite {
		
		/**
		 * This constructor creates a CompoundVisual2D container.  Useful to have if you want to 
		 * create compounded 2D visualizations from the same or different classes.  
		 */
		public function CompoundVisual2D():void {
			super();
		}
		
		/**
		 * This function adds a visualizer to the object.  Behaves the same way as addChild().
		 * @param	visualizer2D name of visualizer2D to add.  Can be any visual from 
		 * package org.joelTong.dingX.twoD.visualizations.
		 */
		public function addVisualizer(visualizer2D:Sprite):void {
			this.addChild(visualizer2D);
		}
		
	}
	
}