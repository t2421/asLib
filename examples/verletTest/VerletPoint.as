﻿package  {
		
		private var _oldVx:Number;
		private var _oldVy:Number;
			
			var tempVx:Number = vx;
			var tempVy:Number = vy;
			
			
			
			_oldVx = tempVx;
			_oldVy = tempVy;
		
		public function get ax():Number{
			return vx-_oldVx;
		}
		
		public function get ay():Number{
			return vy-_oldVy;
		}