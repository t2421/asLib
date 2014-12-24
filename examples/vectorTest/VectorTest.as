package  {
	import jp.t2421.math.*;
	import flash.display.Graphics;
	import flash.display.*;
	public class VectorTest extends MovieClip{
		var vectorA:Vector2D;
		var vectorB:Vector2D;
		var projectionVector:Vector2D;
		public function VectorTest() {
			vectorA = new Vector2D(100,50);
			vectorB = new Vector2D(0,200);
			
			trace("radian---->"+vectorA.getAngleBetween(vectorB));
			trace("degree---->"+(Number(vectorB.getAngleBetween(vectorA)*MathUtil.toDegree)));
			projectionVector = Vector2D.projection(vectorA,vectorB);
			
			draw();
		}
		
		private function draw():void{
			var offset:Number = 100;
			var g:Graphics = this.graphics;
			g.beginFill(0x000000);
			g.drawCircle(vectorA.x+offset,vectorA.y+offset,5);
			g.drawCircle(vectorB.x+offset,vectorB.y+offset,5);
			g.endFill();
			
			g.beginFill(0xff0000);
			
			g.drawCircle(projectionVector.x+offset,projectionVector.y+offset,2);
			g.endFill();
			
			g.lineStyle(1,0);
			g.moveTo(0+offset,0+offset);
			g.lineTo(vectorA.x+offset,vectorA.y+offset);
			g.moveTo(0+offset,0+offset);
			g.lineTo(vectorB.x+offset,vectorB.y+offset);
			g.moveTo(0+offset,0+offset);
			g.lineStyle(1,0xff0000);
			g.lineTo(projectionVector.x+offset,projectionVector.y+offset);
		}
		
		
		

	}
	
}
