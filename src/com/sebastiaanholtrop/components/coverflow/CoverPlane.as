 package com.sebastiaanholtrop.components.coverflow {
	
	import away3d.materials.AlphaBitmapMaterial;
	import away3d.primitives.Plane;
	
	import caurina.transitions.Tweener;
	
	import com.sebastiaanholtrop.reflection.Reflect;
	
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
	
	public class CoverPlane extends Plane {
		
		public var uiComponent:UIComponent;
		private var _initialX:Number;
		private var _coverFlow:CoverFlow;
		
		public function CoverPlane(uiComponent:UIComponent, coverFlow:CoverFlow):void {
			
			this._coverFlow = coverFlow;
			
			this.uiComponent = uiComponent;
			this.uiComponent.visible = false;
			
			// create a bitmapdata as a snapshot from the component
			var coverBmd:BitmapData = new BitmapData(this.uiComponent.width, this.uiComponent.height * 2, true, 0xffffff);
			coverBmd.draw(uiComponent);
			
			// the reflection part
			var reflection:Reflect = new Reflect(this.uiComponent as Sprite, 0.4, 150, true, Reflect.BOTTOM, 0);
			var reflectionBmd:BitmapData = reflection.reflectionAsBitmapData;
			// copy the reflection into the coverBmd
			coverBmd.copyPixels(reflectionBmd, reflectionBmd.rect, new Point(0, this.uiComponent.height));
			
			var material:AlphaBitmapMaterial = new AlphaBitmapMaterial(coverBmd, {smooth:true, debug:false});
			super({
				material:material, 
				name:uiComponent.id,
				width:this.uiComponent.width,
				height:this.uiComponent.height * 2,
				bothsides:false,
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