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
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	public class InitializerTwoD extends Sprite {
		
		public function InitializerTwoD(w:int, h:int, fill:uint = 0x000000):void {
			super();
			this.graphics.beginFill(fill);
			this.graphics.drawRect(0, 0, w, h);
		}
		
		public function addVisualizer(visualizer2D:Sprite):void {
			this.addChild(visualizer2D);
		}
		
	}
	
}