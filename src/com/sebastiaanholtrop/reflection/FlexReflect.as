package com.sebastiaanholtrop.reflection {
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import flash.events.TimerEvent;
	import flash.display.Sprite;
	
	public class FlexReflect extends UIComponent {
		
		private var _reflect:Reflect;
		private var _target:Sprite;
		
		private var _alpha:Number = 0.5;
		private var _ratio:Number = 50;
		private var _distance:Number = 0;
		private var _side:String = Reflect.BOTTOM;
		private var _add:Boolean = true;
		private var _updateTime:Number = 0;
		
		public function FlexReflect() {
			super();
			
			this.addEventListener(FlexEvent.CREATION_COMPLETE, this.creationCompleteHandler);
		}
		
		private function creationCompleteHandler(event:FlexEvent):void {
			trace("cration");
			this._reflect = new Reflect(this._target, this._alpha, this._ratio, this._add, this._side, this._distance, this._updateTime);
		}
		
		
		public function set target(target:UIComponent):void {
			
			this._target = target as Sprite;
		}
		
		[Bindable]
		override public function set alpha(alpha:Number):void {
			this._alpha = alpha;
			if (this._reflect != null) {
				this._reflect.alpha = this.alpha;
			}
		}
		
		override public function get alpha():Number {
			return this._alpha;
		}
		
		[Bindable]
		public function set ratio(ratio:Number):void {
			this._ratio = ratio;
			if (this._reflect != null) {
				this._reflect.ratio = this.ratio;
			}
		}
		
		public function get ratio():Number {
			return this._ratio;
		}
		
		[Bindable]
		public function set distance(distance:Number):void {
			this._distance = distance;
			if (this._reflect != null) {
				this._reflect.distance = this.distance;
			}
		}
		
		public function get distance():Number {
			return this._distance;
		}
		
		public function get side():String {
			return this._side;
		}
		
		public function get add():Boolean {
			return this._add;
		}
		
		[Bindable]
		public function set updateTime(updateTime:Number):void {
			this._updateTime = updateTime;
			if (this._reflect != null) {
				this._reflect.updateTime = this.updateTime;
			}
		}
		
		public function get updateTime():Number {
			return this._updateTime;
		}
		
		public function redraw():void {
			if (this._reflect != null) {
				this._reflect.redraw();
			}
		}
		
		public function refresh():void {
			if (this._reflect != null) {
				this._reflect.refresh();
			}
		}
	}
}