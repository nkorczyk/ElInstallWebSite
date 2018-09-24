package away3d.core.render
{
    import away3d.core.base.*;
    import away3d.core.draw.*;
    import away3d.core.filter.*;
    
    import flash.display.*;
    import flash.geom.*;

    /** A static class for an easy access to the most useful renderers */
    public class Renderer
    {
        /** Fastest and simplest renderer, useful for many applications <br> @see away3d.core.render.BasicRenderer */
        public static function get BASIC():IRenderer
        {
            return new BasicRenderer();
        }
        
        /** Perform reordering of triangles after sorting to guaranty their correct rendering <br> @see away3d.core.render.QuadrantRenderer @see away3d.core.render.AnotherRivalFilter */
        public static function get CORRECT_Z_ORDER():IRenderer
        {
            return new QuadrantRenderer(new AnotherRivalFilter());
        }

        /** Perform triangles splitting to correctly render scenes with intersecting objects <br> @see away3d.core.render.QuadrantRenderer @see away3d.core.render.QuadrantRiddleFilter @see away3d.core.render.AnotherRivalFilter */
        public static function get INTERSECTING_OBJECTS():IRenderer
        {
            return new QuadrantRenderer(new QuadrantRiddleFilter(), new AnotherRivalFilter());
        }
    }

}
