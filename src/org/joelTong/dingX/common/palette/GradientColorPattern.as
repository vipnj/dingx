/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

/* class GradientColorPattern */

package org.joelTong.dingX.common.palette
{
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	
	 /**
	  * The GradientColorPattern class takes the ColorPattern class 1 step further by allowing
	  * easy changing of colors based on a variable 1 channel while keeping others constant.  Use
	  * the same way as the ColorPattern class.  However, you only need to write 1 line of code 
	  * for usage of this class.
	  */
	public dynamic class GradientColorPattern extends ColorPattern {
		
		/**
		 * This constructor creates a GradientColorPattern class.
		 * @param	minColor minimum color to use.
		 * @param	maxColor maximum color to use.
		 * @param	levels Number of different colors to use.  If you specify 100, it would have 100
		 * colors created between the range specified for you.  As such, can be used to create a gradient
		 * color pattern.
		 */
		public dynamic function GradientColorPattern(minColor:uint, maxColor:uint, levels:int = 5):void {
			super();
			var step:uint = (maxColor - minColor) / levels;
			for (var i:uint = 0; i < levels; i++) {
				this.pushColor(new MinMaxColor32((minColor + i * step), minColor + (i+1) * step));
			}
		}	
		


	}
}