package away3d.core.utils
{
    /** Class for emmiting debuging messages, warnings and errors */
    public class Debug
    {
        public static var active:Boolean = false;
        public static var warningsAsErrors:Boolean = false;

        public static function clear():void
        {
        }
        
        public static function delimiter():void
        {
        }
        
        public static function trace(message:Object):void
        {
            dotrace(message);
        }
        
        public static function warning(message:Object):void
        {
            if (warningsAsErrors)
            {
                error(message);
                return;
            }
            trace("WARNING: "+message);
        }
        
        public static function error(message:Object):void
        {
            trace("ERROR: "+message);
            throw new Error(message);
        }
    }
}

/**
 * @private
 */
function dotrace(message:Object):void
{
    trace(message);
}

