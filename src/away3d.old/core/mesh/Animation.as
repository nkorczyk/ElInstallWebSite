﻿package away3d.core.mesh
{
    import away3d.core.*;
    import away3d.core.material.*;
    import away3d.core.math.*;
    import away3d.core.mesh.*;
    
    import flash.geom.Matrix;
    import flash.events.Event;
    import flash.utils.*;
	import flash.events.EventDispatcher;
	
    public class Animation extends EventDispatcher implements IAnimation
    {
        private var _frame:Number = 0;
        private var _fps:Number = 24;
        private var _loop:Boolean = false;
        private var _smooth:Boolean = false;
        private var _delay:Number = 0;
        private var _sequence:Array = [];
		private var _latest:Number = 0;

        public function Animation()
        {
        }

        public function get sequence():Array
        {
            return _sequence;
        }
        public function set sequence(value:Array):void
        {
            _sequence = value;
        }

        public function get fps():Number
        {
            return _fps;
        }
        public function set fps(value:Number):void
        {
            _fps = value;
        }

        public function get loop():Boolean
        {
            return _loop;
        }
        public function set loop(value:Boolean):void
        {
            _loop = value;
        }

        public function get smooth():Boolean
        {
            return _smooth;
        }
        public function set smooth(value:Boolean):void
        {
            _smooth = value;
        }

        private var _running:Boolean;
        private var _time:uint;

        public function start():void
        {
            _time = getTimer();
            _running = true;
			_latest = 0;
            _frame = 0;
        }
		
        public function update(mesh:BaseMesh):void
        {
            if (!_running)
                return;

            var now:uint = getTimer();
            _frame += (now - _time) * fps / 1000;
            _time = now;

            if (_sequence.length == 1)
            {
                _frame = 0;
                _running = false;
            }
            else
            if (_loop)
            {
                while (_frame > _sequence.length-1+_delay)
                    _frame -= _sequence.length-1+_delay;
					
            }
            else
            {
                if (_frame > _sequence.length-1+_delay)
                {
                    _frame = _sequence.length-1+_delay;
                    _running = false;
                }
            }
			
            var rf:Number = _frame;

            if (!_smooth)
                rf = Math.round(rf);
                
            if (rf < 0)
                rf = 0;

            if (rf > _sequence.length-1)
                rf = _sequence.length-1;

            if (rf == Math.round(rf))
            {
                mesh.frames[_sequence[int(rf)].frame].adjust(1);
				
            }
            else
            {
                var lf:Number = Math.floor(rf);
                var hf:Number = Math.ceil(rf);
                mesh.frames[_sequence[int(lf)].frame].adjust(1);
                mesh.frames[_sequence[int(hf)].frame].adjust(rf-lf);
				
				if(_loop){
					if(_latest == 0 || _latest+1 == _sequence[int(lf)].frame || _latest == _sequence[int(lf)].frame){
						_latest = _sequence[int(lf)].frame;
					} else{
						dispatchEvent(new Event("CYCLE"));
						_latest = 0;
					}
				}
            }
        }

        public function stop():void
        {
            _running = false;
			_latest = 0;
        }
		
		public function get run():Boolean
		{
			return _running;
		}
		
		public function set delay(value:int):void
		{
			_delay = value;
		}
		
		public function get frame():Number
		{
			return _frame;
		}
		
		public function set frame(f:Number):void
		{
			_frame = f;
		}
		
    }
}
