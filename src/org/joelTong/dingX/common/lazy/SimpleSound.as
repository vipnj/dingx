/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

package org.joelTong.dingX.common.lazy
{
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	
	
	 /**
	 * This class allows the developer to load a sound in 1 line instead of 4.  
	 * Implement using the constructor.
	 * NOTE: The visualization created depends on the total NET output sound, so yeah.
	 * This should be more for debugging purposes only.
	 */
	public class SimpleSound extends Sound {
		
		/**
		 * The SimpleSound constructor creates and loops a sound for an infinite number of times.
		 * To use, specify the URL of the sound file in constructor.
		 * @param	url url of sound file.  E.g. Sound1.mp3
		 */
		public function SimpleSound(url:String):void {
			var sound:Sound = new Sound();
			var req:URLRequest = new URLRequest(url);
			sound.load(req);
			sound.play(0, int.MAX_VALUE);
			
		}
	}
	
}