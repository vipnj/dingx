/*---------------------------------------------
########  #### ##    ##  ######   ##     ## 
##     ##  ##  ###   ## ##    ##   ##   ##  
##     ##  ##  ####  ## ##          ## ##   
##     ##  ##  ## ## ## ##   ####    ###    
##     ##  ##  ##  #### ##    ##    ## ##   
##     ##  ##  ##   ### ##    ##   ##   ##  
########  #### ##    ##  ######   ##     ## 
-----------------------------------------------*/

/* SoundSpectrum3D.as */

package org.joelTong.dingX.threeD.visualizations
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundMixer;
	import org.papervision3d.materials.WireframeMaterial;
	
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	
	import org.papervision3d.core.proto.LightObject3D;
	import org.papervision3d.materials.shadematerials.FlatShadeMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Cube;
	
	import caurina.transitions.*;
	
	/**
	 * joeltong.org
	 * @author JOELTONG
	 * joel [dot] tong [at] gmail [dot] com
	 */
	public class BoxGrid3D extends DisplayObject3D {
		
		private var HEIGHT:int;
		private var WIDTH:int;
		private var NO_CUBES_HEIGHT:int;
		private var NO_CUBES_WIDTH:int;
		private var cubes:Array = new Array();
		
		
		private var sound:Sound;
		
		private var timer:Timer;
		
		private var rotateTimer:Timer;
		private var _timeToRotate:Number;
		
		public function BoxGrid3D(RADIUS:int, _NO_CUBES_HEIGHT:int, _NO_CUBES_WIDTH:int, 
									rotate:Boolean = true, periodBetweenRotation:int = 5000, 
									timeToRotate:Number = 2):void {
			super();
			NO_CUBES_HEIGHT = _NO_CUBES_HEIGHT;
			NO_CUBES_WIDTH = _NO_CUBES_WIDTH;
			
			HEIGHT = RADIUS * NO_CUBES_HEIGHT;			//separate height and width
			WIDTH = RADIUS * NO_CUBES_WIDTH;
			
			for (var y:uint = 0; y < NO_CUBES_HEIGHT; y++) {
				for (var x:uint = 0; x < NO_CUBES_WIDTH; x++) {
				
					//var tempShadeMaterial:FlatShadeMaterial = new FlatShadeMaterial(new LightObject3D(), 0xfffff,0xcc00 + 0x110000 * (x + y * NO_CUBES_WIDTH));
					var wireFrameMaterial:WireframeMaterial = new WireframeMaterial(0x0099FF);
					var tempMaterialsList:MaterialsList = new MaterialsList();
					var tempCube:Cube;
					
					tempMaterialsList.addMaterial(wireFrameMaterial, "all");
					tempCube = new Cube(tempMaterialsList, RADIUS, RADIUS, 300,2,2,2);
					tempCube.x = (0.5 * (RADIUS - WIDTH) ) + RADIUS  * x;
					tempCube.z = (0.5 * (RADIUS - HEIGHT) )+ RADIUS * y;
					tempCube.useOwnContainer = true;
					cubes.push(tempCube);
					this.addChild(tempCube);
				}
			}
			start();
			if (rotate) {
				_timeToRotate = timeToRotate;
				rotateTimer = new Timer(periodBetweenRotation, 0);
				rotateTimer.addEventListener(TimerEvent.TIMER, onRotate);
				rotateTimer.start();
			}
		}
		
		public function start():void {
			timer = new Timer(100, 0);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function onTimer(e:TimerEvent):void {
			var bytes:ByteArray = new ByteArray();
			SoundMixer.computeSpectrum(bytes, false, 0);
			var initialRef:uint = 0;
			for (var i:Number = 0; i < 512; i+= (512 /  (NO_CUBES_HEIGHT * NO_CUBES_WIDTH))) {
                var n:Number = bytes.readFloat();
				if (initialRef < cubes.length) {
					Tweener.addTween(cubes[initialRef], {alpha: Math.abs(n), scaleY: n, time:2, transition: "easeOut" } );

				}
				initialRef++;
            }

		}
		
		private function onRotate(e:TimerEvent):void {
			Tweener.addTween(this, { rotationX: Math.random() * 360, rotationZ: Math.random() * 360,
			rotationY: Math.random() * 360, time: _timeToRotate, transition:"easeOut" } );
		}
		
		
		//sets the view of object
		public function setView(xPos:int = 0, yPos:int = 0, zPos:int = 0):void {
			this.x = xPos;
			this.y = yPos;
			this.z = zPos;
		}
		
		//sets the rotation of object
		public function setRot(xRot:int = 0, yRot:int = 0, zRot:int = 0):void {
			this.rotationX = xRot;
			this.rotationY = yRot;
			this.rotationZ = zRot;
		}
		
	}
	
}