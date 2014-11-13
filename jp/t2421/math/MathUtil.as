package jp.t2421.math{
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.geom.*;
	
	public class MathUtil extends MovieClip {
		
		public static const toRadian:Number = Math.PI / 180;
		public static const toDegree:Number = 180 / Math.PI;
		
		public static function randomInRange(low:Number, high:Number):Number
		{
			return low + (high - low) * Math.random();
		}

		public static function randomSign(p:Number = 0.5):Number
		{
			return Math.random() < p ? 1 : -1;
		}
		
		public static function map(value:Number, inLow:Number = 0.0, inHigh:Number = 1.0, outLow:Number = 0.0, outHigh:Number = 1.0, clip:Boolean = true):Number
		{
			var outValue:Number = (value - inLow) / (inHigh - inLow) * (outHigh - outLow) + outLow;
			if (!clip)
				return outValue;
			if (outValue < outLow)
				return outLow;
			if (outValue > outHigh)
				return outHigh;
			return outValue;
		}
		
		
		
		
	
	}
	
}
