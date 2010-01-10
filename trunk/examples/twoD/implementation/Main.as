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
	import flash.utils.Timer;
	import flash.display.StageQuality;
	import org.joelTong.dingX.common.lazy.SimpleSound;
	import org.joelTong.dingX.common.palette.ColorPattern;
	import org.joelTong.dingX.common.palette.MinMaxColor32;
	
	import org.joelTong.dingX.twoD.initializers.*;
	import org.joelTong.dingX.twoD.visualizations.*;
	
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
			var simpleSound:SimpleSound = new SimpleSound("Song1.mp3");

			///////////////////////////////////////////////
			
			/*
			 * FOR TWO-D VISUALIZATIONS
			 * NOTE: YOU NEED TO HAVE THE 2 PACKAGES TO COMPILE:
			 * 						 PV3D - http://code.google.com/p/papervision3d/
			 * 		Flint Particle System - http://code.google.com/p/flint-particle-system/
			 * 
			 * */
			

			var pattern2:ColorPattern = new ColorPattern();			
			pattern2.pushColor(new MinMaxColor32(0xFF00CC00, 0xFF00CCFF));
			pattern2.pushColor(new MinMaxColor32(0xFF00DD00, 0xFF00DDFF));
			pattern2.pushColor(new MinMaxColor32(0xFF00EE00, 0xFF00EEFF));
			pattern2.pushColor(new MinMaxColor32(0xFF00DD00, 0xFF00DDFF));
			
			
			var compoundVisualizer:CompoundVisual2D = new CompoundVisual2D();
			
			var initializer:InitializerTwoD = new InitializerTwoD(stage.stageWidth, stage.stageHeight/2);
			//compoundVisualizer.addVisualizer(new Type4(550, 400, 10, 50, 24,0.7, 5, 50, 80, false, 2, 2, pattern2));
			//compoundVisualizer.addVisualizer(new Type3(550, 400,10,10,500));
			//initializer.addVisualizer(compoundVisualizer);
			
			compoundVisualizer.addVisualizer(new Type4(550, 400,10,20,24,0.5,5,50,150));
			compoundVisualizer.addVisualizer(new BasicSpectrumLine(550, 400));
			initializer.addVisualizer(compoundVisualizer);
			
			
			addChild(initializer);
			
			
		}
		
	}
	
}