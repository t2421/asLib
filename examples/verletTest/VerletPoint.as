package  {	import flash.geom.Rectangle;	import flash.display.Graphics;		public class VerletPoint {		public var x:Number;		public var y:Number;				private var _oldX:Number;		private var _oldY:Number;
		
		private var _oldVx:Number;
		private var _oldVy:Number;				public function VerletPoint(x:Number,y:Number) {			setPosition(x,y);
					}				public function update():void{			//oldXおよびoldYはvxとvyを求めるために必要なので一時変数を定義			var tempX:Number = x;			var tempY:Number = y;
			var tempVx:Number = vx;
			var tempVy:Number = vy;
			
						x += vx;			y += vy;			_oldX = tempX;			_oldY = tempY;
			
			_oldVx = tempVx;
			_oldVy = tempVy;		}				public function setPosition(x:Number,y:Number):void{			this.x = _oldX = x;			this.y = _oldY = y;		}				//rect内に拘束する		public function constrain(rect:Rectangle):void{			x = Math.max(rect.left,Math.min(x,rect.right));			y = Math.max(rect.top,Math.min(y,rect.bottom));		}
		
		public function get ax():Number{
			return vx-_oldVx;
		}
		
		public function get ay():Number{
			return vy-_oldVy;
		}				public function get vx():Number{			return x-_oldX;		}				public function get vy():Number{			return y-_oldY;		}				public function set vx(value:Number):void{			_oldX = x - value;		}				public function set vy(value:Number):void{			_oldY = y - value;		}				public function render(g:Graphics):void{			g.beginFill(0);			g.drawCircle(x,y,4);			g.endFill();		}	}	}