package jp.t2421.geom{
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.geom.*;
	
	public class GeometryUtil extends MovieClip {

		/**
		 * ある点を回転を加味して、x座標,y座標を求める
		 * @param tx 対象のrotationが0であると仮定したときのtargetX
		 * @param ty 対象のrotationが0であると仮定したときのtargetY
		 * @param ox 回転の中心x座標
		 * @param oy 回転の中心y座標
		 * @param tr 何度回転させるか
		 */
		public static function linearTransformationRotate(tx:Number = 0, ty:Number = 0, ox:Number = 0, oy:Number = 0, tr:Number = 0):Point {
			var distX:Number = tx - ox;
			var distY:Number = ty - oy;
			
			var rad:Number = tr/180*Math.PI;
			var cos:Number = Math.cos(rad);
			var sin:Number = Math.sin(rad);
			var posX:Number = distX * cos + distY * sin + ox;
			var posY:Number = -distX * sin + distY * cos + oy;
			var point:Point = new Point(posX, posY);
			return point;
		}
		
		
		public static function dot(p1:Point,p2:Point):Number {
			return p1.x * p2.x + p1.y * p2.y;
		}
		
		public static function cross(p1:Point, p2:Point):Number {
			return p1.x * p2.y - p1.y * p2.x;
		}
		
		/**
		 * 始点a1,終点a2のベクトルにpベクトルを投影する
		 * ゲーム3D数学参考　http://www.oreilly.co.jp/books/9784873113777/
		 * @param a1 直線の始点
		 * @param a2 直線の終点
		 * @param p 投影したいベクトル
		 */
		public static function projection(a1:Point, a2:Point, p:Point):Point {
			var aVector:Point = a2.subtract(a1);
			var distX:Number = a2.x - a1.x;
			var distY:Number = a2.y - a1.y;
			var distA1A2Sqr:Number = distX * distX + distY * distY;
			var pVector:Point = p.subtract(a1);
			var t:Number = GeometryUtil.dot(aVector,pVector) / distA1A2Sqr;
			var aMult:Point = new Point(aVector.x*t,aVector.y*t);
			return a1.add(aMult);
		}
		
		/**
		 * 点(tx,ty),点(ox,oy)で表される直線の垂直二等分線を取得する
		 * @param tx 回転対称の座標
		 * @param ty 回転対称の座標
		 * @param ox 回転の中心x座標
		 * @param oy 回転の中心y座標
		 * @param direction どちらの方向の垂直線を得るか？
		 * @param scale 垂直線の大きさ
		 */
		public static function perpendicularAtMidpoint(tx:Number = 0, ty:Number = 0, ox:Number = 0, oy:Number = 0, direction:Number = 1.0, scale:Number = 1.0):Point {
			return perpendicular(tx,ty,ox,oy,direction,scale,0.5);
		}
		
		/**
		 * 点(tx,ty),点(ox,oy)で表される直線の垂線を取得する
		 * @param tx 回転対称の座標
		 * @param ty 回転対称の座標
		 * @param ox 回転の中心x座標
		 * @param oy 回転の中心y座標
		 * @param direction どちらの方向の垂直線を得るか？
		 * @param scale 垂直線の大きさ
		 * @param ratio 垂線どこから伸ばすかをコントロールする
		 */
		public static function perpendicular(tx:Number = 0, ty:Number = 0, ox:Number = 0, oy:Number = 0, direction:Number = 1.0, scale:Number = 1.0, ratio:Number = 0.5):Point {
			var distX:Number = tx - ox;
			var distY:Number = ty - oy;
			var distance:Number = Math.sqrt(distX * distX + distY * distY);
			var degree:Number = Math.atan2(distY, distX) * 180 / Math.PI ;
			var point:Point = GeometryUtil.linearTransformationRotate(tx, ty, ox, oy, -degree);
			var middlePoint:Point = new Point((ox+point.x)*ratio, oy);
			var middleVerticalPoint:Point = new Point(middlePoint.x, middlePoint.y + (direction * scale));
			var rotateMiddlePoint:Point = GeometryUtil.linearTransformationRotate(middleVerticalPoint.x, middleVerticalPoint.y, ox, oy, degree);
			
			return rotateMiddlePoint;
		}
		

		
	
	}
	
}
