package  {
	import flash.display.*;
	import flash.events.Event;
	import flash.geom.Rectangle;
	public class Triangle extends Sprite{
		private var _pointA:VerletPoint;
		private var _pointB:VerletPoint;
		private var _pointC:VerletPoint;
		private var _stickA:VerletStick;
		private var _stickB:VerletStick;
		private var _stickC:VerletStick;
		
		private var _stageRect:Rectangle;
		
		public function Triangle() {
			_pointA = new VerletPoint(100,100);
			_pointB = new VerletPoint(200,100);
			_pointC = new VerletPoint(150,200);
			_stickA = new VerletStick(_pointA,_pointB);
			_stickB = new VerletStick(_pointB,_pointC);
			_stickC = new VerletStick(_pointC,_pointA);
			
			_pointA.vx = 10;
			_stageRect = new Rectangle(0,0,stage.stageWidth,stage.stageHeight);
			this.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function loop(e:Event):void{
			_pointA.y += 0.2;
			_pointA.update();
			
			_pointB.y += 0.2;
			_pointB.update();
			
			_pointC.y += 0.2;
			_pointC.update();
			
			//意図しないバウンドを回避
			for(var i:int = 0;i<3;i++){
				_pointA.constrain(_stageRect);
				_pointB.constrain(_stageRect);
				_pointC.constrain(_stageRect);
				_stickA.update();
				_stickB.update();
				_stickC.update();
			}
			
			graphics.clear();
			
			
			_pointA.render(this.graphics);
			_pointB.render(this.graphics);
			_pointC.render(this.graphics);
			_stickA.render(this.graphics);
			_stickB.render(this.graphics);
			_stickC.render(this.graphics);
		}
		
		

	}
	
}
