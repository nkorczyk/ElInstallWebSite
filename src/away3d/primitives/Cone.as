﻿package away3d.primitives
{
    import away3d.core.*;
    import away3d.core.base.*;
    import away3d.core.math.*;
    import away3d.core.stats.*;
    import away3d.core.utils.*;
    import away3d.materials.*;
    
    /** Cone */ 
    public class Cone extends Mesh
    {
        public function Cone(init:Object = null)
        {
            super(init);
            
            init = Init.parse(init);

            var radius:Number = init.getNumber("radius", 100, {min:0});
            var height:Number = init.getNumber("height", 200, {min:0});
            var segmentsW:int = init.getInt("segmentsW", 8, {min:3});
            var segmentsH:int = init.getInt("segmentsH", 1, {min:1})
			var openEnded:Boolean = init.getBoolean("openEnded", false);
			var yUp:Boolean = init.getBoolean("yUp", true);
			
            buildCone(radius, height, segmentsW, segmentsH, openEnded, yUp);
        }
    
        private var grid:Array;
        private var jMin:int;
        
        private function buildCone(radius:Number, height:Number, segmentsW:int, segmentsH:int, openEnded:Boolean, yUp:Boolean):void
        {
            var i:int;
            var j:int;

            height /= 2;

            grid = new Array();
			
			
			if (!openEnded) {
				jMin = 1;
	            segmentsH += 1;
	            var bottom:Vertex = yUp? new Vertex(0, -height, 0) : new Vertex(0, 0, -height);
	            grid[0] = new Array(segmentsW);
	            for (i = 0; i < segmentsW; i++) 
	                grid[0][i] = bottom;
			} else {
				jMin = 0;
			}
			
            for (j = jMin; j < segmentsH; j++)  
            { 
                var z:Number = -height + 2 * height * (j-1) / (segmentsH-1);

                grid[j] = new Array(segmentsW);
                for (i = 0; i < segmentsW; i++) 
                { 
                    var verangle:Number = 2 * i / segmentsW * Math.PI;
                    var ringradius:Number = radius * (segmentsH-j)/(segmentsH-1)
                    var x:Number = ringradius * Math.sin(verangle);
                    var y:Number = ringradius * Math.cos(verangle);
                    
                    if (yUp)
                    	grid[j][i] = new Vertex(y, z, x);
                    else
                    	grid[j][i] = new Vertex(y, -x, z);
                }
            }

            var top:Vertex = yUp? new Vertex(0, height, 0) : new Vertex(0, 0, height);
            grid[segmentsH] = new Array(segmentsW);
            for (i = 0; i < segmentsW; i++) 
                grid[segmentsH][i] = top;

            for (j = 1; j <= segmentsH; j++) 
                for (i = 0; i < segmentsW; i++) 
                {
                    var a:Vertex = grid[j][i];
                    var b:Vertex = grid[j][(i-1+segmentsW) % segmentsW];
                    var c:Vertex = grid[j-1][(i-1+segmentsW) % segmentsW];
                    var d:Vertex = grid[j-1][i];
					
					var i2:int = i
					if (i == 0) i2 = segmentsW
					
                    var vab:Number = j / (segmentsH + 1);
                    var vcd:Number = (j-1) / (segmentsH + 1);
                    var uad:Number = i2 / segmentsW;
                    var ubc:Number = (i2-1) / segmentsW;
                    var uva:UV = new UV(uad,vab);
                    var uvb:UV = new UV(ubc,vab);
                    var uvc:UV = new UV(ubc,vcd);
                    var uvd:UV = new UV(uad,vcd);

                    if (j < segmentsH)
                        addFace(new Face(a,b,c, null, uva,uvb,uvc));
                    if (j > 1)                
                        addFace(new Face(a,c,d, null, uva,uvc,uvd));
                }
            
            type = "Cone";
        	url = "primitive";
        }

        public function vertex(i:int, j:int):Vertex
        {
            return grid[j][i];
        }
    }
}