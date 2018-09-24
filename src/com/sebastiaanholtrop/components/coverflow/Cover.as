 package com.sebastiaanholtrop.components.coverflow {
	
	import away3d.materials.AlphaBitmapMaterial;
	import away3d.primitives.Plane;
	
	import caurina.transitions.Tweener;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.GradientType;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import mx.core.Application;
	import mx.core.UIComponent;
	import com.sebastiaanholtrop.components.coverflow.CoverFlow;
	
	public class Cover extends Plane {
		
		public var uiComponent:UIComponent;
		private var _initialX:Number;
		private var _coverFlow:CoverFlow;
		
		public function Cover(uiComponent:UIComponent, coverFlow:CoverFlow):void {
			
			this._coverFlow = coverFlow;
			
			this.uiComponent = uiComponent;
			this.uiComponent.visible = false;
			
			var coverBmd:BitmapData = new BitmapData(this.uiComponent.width, this.uiComponent.height, false, 0xffffff);
			coverBmd.draw(uiComponent);
			
			var material:AlphaBitmapMaterial = new AlphaBitmapMaterial(coverBmd);
			super({
				material:material,
				name:uiComponent.id,
				width:this.uiComponent.width,
				height:this.uiComponent.height,
				bothsides:true,
				y:0, x:0, z:0,
				segmentsW:2,
				segmentsH:2
				});
			
			this.rotationX = 90;
			this.rotationY = 180;
			
			this.addOnMouseDown(this.mouseDownHandler);
		}
		
		private function mouseDownHandler(event:Event):void {
			this._coverFlow.selectedItem = this.uiComponent;
			
		}
		
		public function set initialX(value:Number):void {
			this._initialX = value;
		}
		
		public function get initialX():Number {
			return this._initialX;
		}
	}
}