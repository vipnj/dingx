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
	
	/**
	 * This class creates an easy way of storing min and maxColors.  Used especially in conjunction
	 * with visualizations based on the Flint particle system.  To create a multi-colored visualization,
	 * place into an array using the ColorPattern class.
	 * <p>
	 * @see org.joelTong.dingX.common.palette.ColorPattern
	 */
	public class MinMaxColor32 {
		
		private var colors:Array = new Array(0xFF000000, 0xFFFF0000);
		
		/**
		 * The MinMaxColor32 constructor creates an object storing 2 color values per channel used - 
		 * the minimum color, in ARGB, and the maximum color, in ARGB.
		 * @param	minColor The minimum color for that channel, in ARGB form.
		 * @param	maxColor The maximum color for that channel, in ARGB form.
		 */
		public function MinMaxColor32(minColor:uint = 0xFF000000, maxColor:uint = 0xFFFFFFFF):void {
			colors[0] = minColor;
			colors[1] = maxColor;
		}
		
		/**
		 * Returns the minimum color, in ARGB.
		 */
		public function get minColor():uint {
			return colors[0];
		}
		
		/** 
		 * Sets the minimum color, in ARGB.
		 */
		public function set minColor(color:uint):void {
			colors[0] = color;
		}
		
		/**
		 * Returns the maximum color, in ARGB.
		 */
		public function get maxColor():uint {
			return colors[1];
		}
		
		/**
		 * Sets the maximum color, in ARGB.
		 */
		public function set maxColor(color:uint):void {
			colors[1] = color;
		}
		
	}
	
}