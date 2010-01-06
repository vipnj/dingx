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
	
	 /**
	  * This class is used to create a color pattern array to use for 
	  * min max coloring in Flint visualizations.
	  */
	public dynamic class ColorPattern extends Array {
		
		/**
		 * This constructor creates a new ColorPattern array.
		 */
		public dynamic function ColorPattern():void {
			super();
		}
		
		/**
		 * This pushes a MinMaxColor32 object into the ColorArray.  Useful for creating multi-colored
		 * color schemes.
		 * @see org.joelTong.dingX.common.palette.MinMaxColor32
		 * @param	color MinMaxColor32 object to push into ColorPattern array.
		 */
		public function pushColor(color:MinMaxColor32):void {
			this.push(color);
		}
		
		/**
		 * This function pops the last MinMaxColor32 object in array.
		 * @param	color
		 */
		public function popColor():void {
			this.pop();
		}
		
		/**
		 * This is used by visualizers to get the minimum specific color from the ColorPattern object.
		 * @param	curChannel current channel to collect data from.
		 * @return returns the minimum color in ARGB form.
		 */
		public function getMinSpecificColor(curChannel:int):uint {
			return this[curChannel % this.length].minColor;
		}
		
		/**
		 * This is used by visualizers to get the maximum specific color from the ColorPattern object.
		 * @param	curChannel current channel to collect data from.
		 * @return returns the maximum color in ARGB form.
		 */
		public function getMaxSpecificColor(curChannel:int):uint {
			return this[curChannel % this.length].maxColor;
		}
		
	}
	
}