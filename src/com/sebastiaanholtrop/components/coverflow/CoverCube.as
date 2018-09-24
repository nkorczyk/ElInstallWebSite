 package com.sebastiaanholtrop.components.coverflow {
	
	import away3d.core.*;
	import away3d.core.base.*;
	import away3d.core.stats.*;
	import away3d.core.utils.*;
	import away3d.materials.*;
	
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
	
	public class CoverCube extends Mesh {
		
		public var uiComponent:UIComponent;
		private var _initialX:Number;
		private var _coverFlow:CoverFlow;
		
		public function CoverCube(uiComponent:UIComponent, coverFlow:CoverFlow):void {
			
			this._coverFlow = coverFlow;
			
			this.uiComponent = uiComponent;
			this.uiComponent.visible = false;
			
			// create a bitmapdata as a snapshot from the component
			var coverBmd:BitmapData = new BitmapData(this.uiComponent.width, this.uiComponent.height, true, 0xffffff);
			coverBmd.draw(uiComponent);
			
			var transparentBmd:BitmapData = new BitmapData(this.uiComponent.width, this.uiComponent.height, true, 0xffffff);
			
			// the reflection part
			var reflection:Reflect = new Reflect(this.uiComponent as Sprite, 0.4, 150, true, Reflect.BOTTOM, 0);
			var reflectionBmd:BitmapData = reflection.reflectionAsBitmapData;
			
			// copy the reflection into the coverBmd
			//sidesBmd.copyPixels(reflectionBmd, reflectionBmd.rect, new Point(0, this.uiComponent.height));
			
			var coverMaterial:AlphaBitmapMaterial = new AlphaBitmapMaterial(coverBmd, {smooth:true, debug:false});
			var reflectionMaterial:AlphaBitmapMaterial = new AlphaBitmapMaterial(reflectionBmd, {smooth:true, debug:false});
			//var transparentMaterial:AlphaBitmapMaterial = new AlphaBitmapMaterial(transparentBmd, {smooth:false, debug:true});
			
			super({bothsides:false, debugbb:false});
			
            var width:Number  = this.uiComponent.width;
            var height:Number = this.uiComponent.height;
            var depth:Number  = this.uiComponent.height;
			
			var uva:UV = new UV(1, 1);
			var uvb:UV = new UV(0, 1);
			var uvc:UV = new UV(0, 0);
			var uvd:UV = new UV(1, 0);
			
			//create the cube
			
			var v000c:Vertex = new Vertex(-width/2, 0, 		-depth/2);
			var v001c:Vertex = new Vertex(-width/2, 0, 		+depth/2);
			var v010c:Vertex = new Vertex(-width/2, +height, -depth/2);
			var v011c:Vertex = new Vertex(-width/2, +height, +depth/2);
			var v100c:Vertex = new Vertex(+width/2, 0, 		-depth/2);
			var v101c:Vertex = new Vertex(+width/2, 0, 		+depth/2);
			var v110c:Vertex = new Vertex(+width/2, +height, -depth/2);
			var v111c:Vertex = new Vertex(+width/2, +height, +depth/2);
			
			//left face
			this.addFace(new Face(v000c, v010c, v001c, coverMaterial, uvd, uva, uvc));
			this.addFace(new Face(v010c, v011c, v001c, coverMaterial, uva, uvb, uvc));
			//right face
			this.addFace(new Face(v100c, v101c, v110c, coverMaterial, uvc, uvd, uvb));
			this.addFace(new Face(v110c, v101c, v111c, coverMaterial, uvb, uvd, uva));
			//bottom face
			//addFace(new Face(v000, v001, v100, bottom, uvb, uvc, uva));
			//addFace(new Face(v001, v101, v100, bottom, uvc, uvd, uva));
			//top face
			this.addFace(new Face(v010c, v110c, v011c, coverMaterial, uvc, uvd, uvb));
			this.addFace(new Face(v011c, v110c, v111c, coverMaterial, uvb, uvd, uva));
			//front face
			this.addFace(new Face(v000c, v100c, v010c, coverMaterial, uvc, uvd, uvb));
			this.addFace(new Face(v100c, v110c, v010c, coverMaterial, uvd, uva, uvb));
			//back face
			this.addFace(new Face(v001c, v011c, v101c, coverMaterial, uvd, uva, uvc));
			this.addFace(new Face(v101c, v011c, v111c, coverMaterial, uvc, uva, uvb));
			
			
			//create the reflection
			
			var v000r:Vertex = new Vertex(-width/2, -height, -depth/2);
			var v001r:Vertex = new Vertex(-width/2, -height, +depth/2);
			var v010r:Vertex = new Vertex(-width/2, 0, 		-depth/2);
			var v011r:Vertex = new Vertex(-width/2, 0, 		+depth/2);
			var v100r:Vertex = new Vertex(+width/2, -height, -depth/2);
			var v101r:Vertex = new Vertex(+width/2, -height, +depth/2);
			var v110r:Vertex = new Vertex(+width/2, 0, 		-depth/2);
			var v111r:Vertex = new Vertex(+width/2, 0, 		+depth/2);
			
			//left face
			this.addFace(new Face(v000r, v010r, v001r, reflectionMaterial, uvd, uva, uvc));
			this.addFace(new Face(v010r, v011r, v001r, reflectionMaterial, uva, uvb, uvc));
			//right face
			this.addFace(new Face(v100r, v101r, v110r, reflectionMaterial, uvc, uvd, uvb));
			this.addFace(new Face(v110r, v101r, v111r, reflectionMaterial, uvb, uvd, uva));
			//bottom face
			//addFace(new Face(v000, v001, v100, bottom, uvb, uvc, uva));
			//addFace(new Face(v001, v101, v100, bottom, uvc, uvd, uva));
			//top face
			this.addFace(new Face(v010r, v110r, v011r, reflectionMaterial, uvc, uvd, uvb));
			this.addFace(new Face(v011r, v110r, v111r, reflectionMaterial, uvb, uvd, uva));
			//front face
			this.addFace(new Face(v000r, v100r, v010r, reflectionMaterial, uvc, uvd, uvb));
			this.addFace(new Face(v100r, v110r, v010r, reflectionMaterial, uvd, uva, uvb));
			//back face
			this.addFace(new Face(v001r, v011r, v101r, reflectionMaterial, uvd, uva, uvc));
			this.addFace(new Face(v101r, v011r, v111r, reflectionMaterial, uvc, uva, uvb));
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			type = "Cube";
			url = "primitive";
			
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



/////////////////////////////////////////////////////////////////////////////

