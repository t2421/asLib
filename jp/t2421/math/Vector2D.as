package  jp.t2421.math{
	
	public class Vector2D {
		public var x:Number;
		public var y:Number;
		
		public function Vector2D(x:Number=0,y:Number=0) {
			this.x = x;
			this.y = y;
		}
		
		public function clone():Vector2D{
			return new Vector2D(x,y);
		}
		
		public function isEqual(vector:Vector2D):Boolean{
			return x == vector.x && y == vector.y;
		}
		
		public function zero():void{
			x = 0;
			y = 0;
		}
		
		public function mag():Number{
			return Math.sqrt(x*x+y*y);
		}
		
		public function add(vector:Vector2D):void{
			x += vector.x;
			y += vector.y;
		}
		
		public function sub(vector:Vector2D):void{
			x -= vector.x;
			y -= vector.y;
		}
		
		public function mult(k:Number):void{
			x *= k;
			y *= k;
		}
		
		public function div(k:Number):void{
			x /= k;
			y /= k;
		}
		
		public function dotProduct(vector:Vector2D):Number{
			return x*vector.x+y*vector.y;
		}
		
		public function normalize():void{
			var magSq:Number = x * x + y * y;
			if(magSq > 0){
				var oneOverMag = 1/Math.sqrt(magSq);
				x *= oneOverMag;
				y *= oneOverMag;
			}
		}
		
		//2つのベクトルのなす角を求める
		public function getAngleBetween(vector:Vector2D):Number{
			//return Math.atan2(vector.y - this.y,vector.x-this.x);
			var dot:Number = this.dotProduct(vector);
			
			var cos:Number = dot/(this.mag()*vector.mag());
			var theta:Number = Math.acos(cos);
			return theta;
		}
		
		static public function dotProduct(a:Vector2D,b:Vector2D):Number{
			return a.x * b.x + a.y * b.y;
		}
		static public function normalize(vector:Vector2D):Vector2D{
			var vec:Vector2D = vector.clone();
			vec.normalize();
			return vec;
		}
		
		static public function vectorMag(vector:Vector2D):Number{
			return Math.sqrt(vector.x*vector.x+vector.y*vector.y);
		}
		
		static public function distance(vectorA:Vector2D,vectorB:Vector2D):Number{
			var dx:Number = vectorB.x - vectorA.x;
			var dy:Number = vectorB.y - vectorA.y;
			return Math.sqrt(dx*dx+dy*dy);
		}
		
		//aをbに投影する
		static public function projection(a:Vector2D,b:Vector2D):Vector2D{
			var vec:Vector2D;
			vec = Vector2D.normalize(b);
			var dotProduct:Number = Vector2D.dotProduct(a,vec);
			vec.mult(dotProduct);
			return vec;
		}
		
		

	}
	
}
