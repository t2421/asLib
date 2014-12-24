package  {
	import flash.display.*;
	import flash.events.Event;
	import flash.geom.Rectangle;
	public class VerletStickTest extends Sprite{
		private var _pointA:VerletPoint;
		private var _pointB:VerletPoint;
		private var _stick:VerletStick;
		private var _stageRect:Rectangle;
		
		public function VerletStickTest() {
			_pointA = new VerletPoint(100,100);
			_pointB = new VerletPoint(105,200);
			_stick = new VerletStick(_pointA,_pointB);
			
			
			_stageRect = new Rectangle(0,0,stage.stageWidth,stage.stageHeight);
			this.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function loop(e:Event):void{
			_pointA.y += 0.2;
			_pointA.update();
			
			
			_pointB.y += 0.2;
			_pointB.update();
			
			//意図しないバウンドを回避
			for(var i:int = 0;i<3;i++){
				_pointA.constrain(_stageRect);
				_pointB.constrain(_stageRect);
				_stick.update();
			}
			
			graphics.clear();
			
			
			_pointA.render(this.graphics);
			_pointB.render(this.graphics);
			_stick.render(this.graphics);
		}
		
		

	}
	
}
