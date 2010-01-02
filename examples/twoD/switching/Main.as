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
	
	 /*
	  * This shows you how you can switch between 2D animations with ease.
	  */
	
	 public class Main extends MovieClip {
		
		private var initializer:InitializerTwoD;
		
		private var visuals:Array = new Array();		//I recommend you use an array for recycling
		
		 
		public function Main():void {
			//optimize if needed
			stage.quality = StageQuality.BEST;
			
			visuals.push(new Type1(stage.stageWidth, stage.stageHeight));
			visuals.push(new Type2(stage.stageWidth, stage.stageHeight));
			
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
						
			initializer = new InitializerTwoD(stage.stageWidth, stage.stageHeight);
			initializer.addVisualizer(new Type2(stage.stageWidth, stage.stageHeight));
			addChild(initializer);
			
			//timer code for switching////////////////////////////////////////
			var timer:Timer = new Timer(5000, 0);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			//////////////////////////////////////////////////////////////////
		}
		
		/* Note the auto garbage collection.  Sweet. */
		private function onTimer(e:TimerEvent):void {
			initializer.addVisualizer(visuals[Math.round(Math.random())]);
			trace(Math.round(Math.random()));
		}
		
	}
	
}