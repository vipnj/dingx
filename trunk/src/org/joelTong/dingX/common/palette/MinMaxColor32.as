/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

/* MinMaxColor32.as */

package org.joelTong.dingX.common.palette
{
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	
	/* This class creates an easy way of storing min and maxColors */
	public class MinMaxColor32 {
		
		private var colors:Array = new Array(0xFF000000, 0xFFFFFFFF);
		
		/* constructor */
		public function MinMaxColor32(minColor:uint = 0xFF000000, maxColor:uint = 0xFFFFFFFF):void {
			colors[0] = minColor;
			colors[1] = maxColor;
		}
		
		
		public function get minColor():uint {
			return colors[0];
		}
		
		public function set minColor(color:uint) {
			colors[0] = color;
		}
		
		public function get maxColor():uint {
			return colors[1];
		}
		
		public function set maxColor(color:uint) {
			colors[1] = color;
		}
		
	}
	
}