/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

package org.joelTong.dingX.threeD.initializers
{
	import flash.display.MovieClip;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.view.BasicView;
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	public class InitializerThreeDBasic extends BasicView {
		
		public function InitializerThreeDBasic(w:int, h:int,zoom:int = -200):void {
			super(w, h);
			this.camera.z = zoom;
			startRendering();
		}
		
		public function addVisualizer(visualizer3D:DisplayObject3D):void {
			this.scene.addChild(visualizer3D);
		}
		
	}
	
}