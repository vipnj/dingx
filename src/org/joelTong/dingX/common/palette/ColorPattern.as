/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

/* ColorPattern.as */

package org.joelTong.dingX.common.palette
{
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	
	 /* This class creates a new color pattern array to use for min max coloring in Flint visualizations */
	public dynamic class ColorPattern extends Array {
		
		public dynamic function ColorPattern():void {
			super();
		}
		
		public function pushColor(color:MinMaxColor32):void {
			this.push(color);
		}
		
		public function popColor(color:MinMaxColor32):void {
			this.pop();
		}
		
		public function getMinSpecificColor(curChannel:int):uint {
			return this[curChannel % this.length].minColor;
		}
		
		public function getMaxSpecificColor(curChannel:int):uint {
			return this[curChannel % this.length].maxColor;
		}
		
	}
	
}