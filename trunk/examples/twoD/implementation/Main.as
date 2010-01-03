/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

/* Main.as */

/*
 * 
 * This is an example of how you can implement DingX
 * 
 */

package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import flash.display.StageQuality;
	
	import org.joelTong.dingX.twoD.initializers.*;
	import org.joelTong.dingX.twoD.visualizations.*;
	
	import org.papervision3d.cameras.*;
	
	/*
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	
	 public class Main extends MovieClip {
		
		
		public function Main():void {
			//optimize if needed
			stage.quality = StageQuality.LOW;
			
			//sample sound loading stuff
			var sound:Sound = new Sound();
			var req:URLRequest = new URLRequest("Song1.mp3");
			sound.load(req);
			sound.play(0, int.MAX_VALUE);
			///////////////////////////////////////////////
			
			/*
			 * FOR TWO-D VISUALIZATIONS
			 * NOTE: YOU NEED TO HAVE THE 2 PACKAGES TO COMPILE:
			 * 						 PV3D - http://code.google.com/p/papervision3d/
			 * 		Flint Particle System - http://code.google.com/p/flint-particle-system/
			 * 
			 * */
						
			var initializer:InitializerTwoD = new InitializerTwoD(stage.stageWidth, stage.stageHeight);
			initializer.addVisualizer(new Type3(stage.stageWidth, stage.stageHeight, 20, 20, 200,80));
			addChild(initializer);
		}
		
	}
	
}