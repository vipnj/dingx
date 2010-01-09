package org.joelTong.dingX.common.lazy
{
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	public class SimpleSound extends Sound {
		
		public function SimpleSound(url:String):void {
			var sound:Sound = new Sound();
			var req:URLRequest = new URLRequest(url);
			sound.load(req);
			sound.play(0, int.MAX_VALUE);
			
		}
	}
	
}