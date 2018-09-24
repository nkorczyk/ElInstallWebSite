package com.sebastiaanholtrop.components.coverflow {
	
	import away3d.core.math.Number3D;
	import away3d.core.base.Object3D;
	import away3d.containers.View3D;
	import away3d.primitives.WirePlane;
	
	import caurina.transitions.Tweener;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.containers.Canvas;
	import mx.controls.Image;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.events.ChildExistenceChangedEvent;
	import mx.controls.SWFLoader;
	
	public class CoverFlow extends Canvas {
		
		public static const CUBESHAPE:String = "cubeshape";
		public static const PLANESHAPE:String = "planeshape";
		
		private var _viewContainer:UIComponent;
		private var _view3D:View3D;
		private var _selectedIndex:int = 0;
		private var _horizontalGap:Number = 10;
		private var _children:Array;
		private var _timer:Timer;
		private var _shape:String;
		private var _angle:Number = 90;
		private var _flippoint:Number = 200;
		private var _cameraOffsetX:Number = 0;
		private var _cameraOffsetY:Number = 0;
		private var _pointOfInterest:Number3D;
		private var _selectedItemWidth:Number = 100;
		private var _selectedItemZoom:Number = 200;
		private var _selectedItem:UIComponent;
		
		public function CoverFlow():void {
			
			this._view3D = new View3D();
			this._viewContainer = new UIComponent();
			this._children = new Array();
			this._pointOfInterest = new Number3D();
			
			// add the container as a child to this
			this.addChild(this._viewContainer);
			// add the view3D as a child to the viewContainer
			this._viewContainer.addChild(this._view3D);
			
			this.addEventListener(ChildExistenceChangedEvent.CHILD_ADD, this.childAddEventHandler);
			this.addEventListener(FlexEvent.CREATION_COMPLETE, this.creationCompleteHandler);
		}
		
		private function childAddEventHandler(event:ChildExistenceChangedEvent):void {
			
			var uiComponent:UIComponent = event.relatedObject as UIComponent;
			uiComponent.addEventListener(FlexEvent.CREATION_COMPLETE, this.uiComponentCreationCompleteHandler);
		}
		
		private function uiComponentCreationCompleteHandler(event:FlexEvent):void {
			this.addItem(event.currentTarget as UIComponent);
		}
		
		private function creationCompleteHandler(event:FlexEvent):void {
			
			// -------------------------------------------------------------------------------------------------
			//var wireplane:WirePlane = new WirePlane({width:this.width, height:this.height, segments:10, x:0 , y:0, z: 0});
			//this._view3D.scene.addChild(wireplane);
			// -------------------------------------------------------------------------------------------------
			this._view3D.camera.roll(90);
			this.lineUp();
			this._timer = new Timer(10);
			this._timer.addEventListener(TimerEvent.TIMER, this.timerEventHandler);
			this._timer.start();
		}
		
		
		public function addItem(uiComponent:UIComponent):void {
			
			var cover:*;
			
			if (this.shape == CoverFlow.PLANESHAPE) {
				cover = new CoverPlane(uiComponent, this);
			}
			else if (this.shape == CoverFlow.CUBESHAPE) {
				cover = new CoverCube(uiComponent, this);
			}
			this._view3D.scene.addChild(cover);
			this._children.push(cover);
		}
		
		private function timerEventHandler(event:TimerEvent):void {
			this.render();
		}
		
		private function lineUp():void {
			for (var i:Number = 0; i < this._children.length; i++) {
				
				var cover:*;
				if (this.shape == CoverFlow.PLANESHAPE) {
					cover = this._children[i] as CoverPlane;
				}
				else if (this.shape == CoverFlow.CUBESHAPE) {
					cover = this._children[i] as CoverCube;
				}
				
				cover.initialX = -(i * this.horizontalGap);
				cover.x = -(i * this.horizontalGap);
			}
		}
		
		public function next():void {
			if (this.selectedIndex < this._children.length - 1) {
				this.selectedIndex++;
			}
		}
		
		public function previous():void {
			if (this.selectedIndex > 0) {
				this.selectedIndex--;
			}
		}
		
		public function first():void {
			this.selectedIndex = 0;
		}
		
		public function last():void {
			this.selectedIndex = this._children.length - 1;
		}
		
		[Bindable]
		public function set selectedIndex(value:int):void {
			
			var previousIndex:int = this._selectedIndex;
			this._selectedIndex = value;
			
			var time:Number = 2;
			
			if (Math.abs(previousIndex - this._selectedIndex) == 1) {
				time = 1;
			}
			
			Tweener.addTween(this._pointOfInterest, {x:this._children[this._selectedIndex].initialX, time:time, onUpdate:this.render});
		}
		
		public function get selectedIndex():int {
			return this._selectedIndex;
		}
		
		
		[Bindable]
		public function set selectedItem(value:UIComponent):void {
			this._selectedItem = value;
			for (var i:Number = 0; i < this._children.length; i++) {
				if (this._selectedItem == this._children[i].uiComponent) {
					this.selectedIndex = i;
					break;
				}
			}
		}
		
		public function get selectedItem():UIComponent {
			return this._selectedItem;
		}
		
		[Bindable]
		public function set angle(value:Number):void {
			this._angle = value;
			//this.setCoverAngles();
			this.render();
		}
		
		public function get angle():Number {
			return this._angle;
		}
		
		public function set shape(value:String):void {
			this._shape = value;
		}
		
		public function get shape():String {
			return this._shape;
		}
		
		[Bindable]
		public function set selectedItemWidth(value:Number):void {
			this._selectedItemWidth = value;
			this.render();
		}
		
		public function get selectedItemWidth():Number {
			return this._selectedItemWidth;
		}
		
		
		[Bindable]
		public function set selectedItemZoom(value:Number):void {
			this._selectedItemZoom = value;
			this.render();
		}
		
		public function get selectedItemZoom():Number {
			return this._selectedItemZoom;
		}
		
		[Bindable]
		public function set flippoint(value:Number):void {
			this._flippoint = value;
			this.render();
		}
		
		public function get flippoint():Number {
			return this._flippoint;
		}
		
		[Bindable]
		public function set horizontalGap(value:Number):void {
			this._horizontalGap = value;
			this._pointOfInterest.x = this._children[this.selectedIndex].x;
			this.lineUp();
			this.render();
		}
		
		public function get horizontalGap():Number {
			return this._horizontalGap;
		}
		
		[Bindable]
		public function set cameraOffsetX(value:Number):void {
			this._cameraOffsetX = value;
			this.render();
		}
		
		public function get cameraOffsetX():Number {
			return this._cameraOffsetX;
		}
		
		[Bindable]
		public function set cameraOffsetY(value:Number):void {
			this._cameraOffsetY = value;
			this.render();
		}
		
		public function get cameraOffsetY():Number {
			return this._cameraOffsetY;
		}
		
		
		private function setCoverAngles():void {
			
			for (var i:uint = 0; i < this._children.length; i++) {
				
				var cover:*;
				if (this.shape == CoverFlow.CUBESHAPE) {
					cover = this._children[i] as CoverCube;
				}
				else if (this.shape == CoverFlow.PLANESHAPE) {
					cover = this._children[i] as CoverPlane;
				}
				
				var distance:Number = this._pointOfInterest.x - cover.initialX;
				
				if (distance > this.flippoint) {
					
					// y 
					cover.rotationY = 180 + this.angle;
					
					// z
					cover.z = 0;
					
					// x
					cover.x = cover.initialX - selectedItemWidth/2;
				}
				else if (distance < -this.flippoint) {
					
					// y 
					cover.rotationY = 180 - this.angle;
					
					// z
					cover.z = 0;
					
					// x
					cover.x = cover.initialX + selectedItemWidth/2;
				}
				else {
					
					var rotationPercentage:Number = (100/this.flippoint * distance) / 100;
					
					// y
					cover.rotationY = 180 + (this.angle * rotationPercentage);
					
					// z
					cover.z = this.selectedItemZoom * (1 - Math.abs(rotationPercentage));
					
					// x
					cover.x = cover.initialX - (this.selectedItemWidth/2 * rotationPercentage);
					
				}
			}
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			this._view3D.x = this.width/2;
			this._view3D.y = this.height/2;
		}
		
		private function setCamera():void {
			this._view3D.camera.x = this._pointOfInterest.x + this.cameraOffsetX;
			this._view3D.camera.y = this._pointOfInterest.y + this.cameraOffsetY;
			
			this._view3D.camera.lookAt(this._pointOfInterest);
		}
		
		private function render():void {
			
			if (this._view3D.stage != null) {
				this._timer.stop();
				this.setCoverAngles();
				this.setCamera();
				this._view3D.render();
			}
			
		}
	}
}