package away3d.loaders
{
    import away3d.core.*;
    import away3d.core.base.*
    import away3d.materials.*;
    import away3d.core.base.*;
    import away3d.core.utils.*;
	
    import flash.display.BitmapData;

    /** Ase file format loader */
    public class Ase
    {
        private var mesh:Mesh;
        private var scaling:Number;

        public function Ase(data:String, init:Object = null)
        {
            init = Init.parse(init);

            scaling = init.getNumber("scaling", 1) * 100;

            mesh = new Mesh(init);

            parseAse(data);
        }

        public static function parse(data:*, init:Object = null, loader:Object3DLoader = null):Mesh
        {
            return new Ase(Cast.string(data), init).mesh;
        }
    
        public static function load(url:String, init:Object = null):Object3DLoader
        {
            return Object3DLoader.loadGeometry(url, parse, false, init);
        }
    
        private function parseAse(data:String):void
        {
            var lines:Array = data.split('\r\n');
            var vertices:Array = [];
            var uvs:Array = [];
            var faces:Array = [];
            
            if (lines.length == 1)
            	lines = data.split('\n');
            
            while (lines.length > 0)
            {
                var line:String = lines.shift();
                
                line = line.substr(line.indexOf('*') + 1);
    
                if (line.indexOf('}') >= 0)
                    continue;
    
                var chunk:String = line.substr(0, line.indexOf(' '));
                
                switch (chunk)
                {
                    case 'MESH_VERTEX_LIST':
                        while (true)
                        {
                            var vertexline:String = lines.shift();
                            
                            if (vertexline.indexOf('}') >= 0)
                                break;
                                
                            vertexline = vertexline.substr(vertexline.indexOf('*') + 1);
    
                            var mvl:Array = vertexline.split('\t');
    
                            // Swapped Y and Z
                            var x:Number = parseFloat(mvl[1]) * scaling;
                            var z:Number = parseFloat(mvl[2]) * scaling; 
                            var y:Number = parseFloat(mvl[3]) * scaling;
    
                            vertices.push(new Vertex(x, y, z));
                        }
                        break;
                    case 'MESH_FACE_LIST':
                        while (true)
                        {
                            var faceline:String = lines.shift();
                            
                            if (faceline.indexOf('}') >= 0)
                                break;
                                
                            faceline = faceline.substr(faceline.indexOf('*') + 1);
    
                            var mfl:String = faceline.split('\t')[0]; // ignore: [MESH_SMOOTHING,MESH_MTLID]
                            var drc:Array = mfl.split( ':' ); // separate here
    
                            var con:String;
                            con = drc[2]
                            var a:Vertex = vertices[parseInt(con.substr(0, con.lastIndexOf(' ')))];
    
                            con = drc[3];
                            var b:Vertex = vertices[parseInt(con.substr(0, con.lastIndexOf(' ')))];
    
                            con = drc[4];
                            var c:Vertex = vertices[parseInt(con.substr(0, con.lastIndexOf(' ')))];
    
                            faces.push(new Face(a, b, c));
                        }
                        break;
    
                    case 'MESH_TVERTLIST':
                        while (true)
                        {
                            var textureline:String = lines.shift();
                            
                            if (textureline.indexOf('}') >= 0)
                                break;

                            textureline = textureline.substr(textureline.indexOf('*') + 1);

                            var mtvl:Array = textureline.split('\t');
                            uvs.push(new UV(parseFloat(mtvl[1]), parseFloat(mtvl[2])));
                        }
                        break;
                    case 'MESH_TFACELIST':
                        var num:int = 0;
    
                        while (true)
                        {
                            var mapline:String = lines.shift();
                            
                            if (mapline.indexOf('}') >= 0)
                                break;

                            mapline = mapline.substr(mapline.indexOf('*') + 1);

                            var mtfl:Array = mapline.split('\t');
    
                            var face:Face = faces[num];
                            face.uv0 = uvs[parseInt(mtfl[1])];
                            face.uv1 = uvs[parseInt(mtfl[2])];
                            face.uv2 = uvs[parseInt(mtfl[3])];
                            num++;
    
                        }
                        break;
                }
            }
            
            for each (var f:Face in faces)
                mesh.addFace(f);
            
            mesh.type = ".Ase";
        }
    }
}
