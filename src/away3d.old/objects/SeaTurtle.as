package away3d.objects
{
    import away3d.core.mesh.*;

    public class SeaTurtle extends Mesh
    {
        private var varr:Array = [];
        private var uvarr:Array = [];

        private function v(x:Number,y:Number,z:Number):void
        {
            varr.push(new Vertex(x,y,z));
        }

        private function uv(u:Number,v:Number):void
        {
            uvarr.push(new UV(u,v));
        }

        private function f(vn0:int, vn1:int, vn2:int, uvn0:int, uvn1:int, uvn2:int):void
        {
            addFace(new Face(varr[vn0],varr[vn1],varr[vn2], null, uvarr[uvn0],uvarr[uvn1],uvarr[uvn2]));
        }

        public function SeaTurtle(init:Object = null)
        {
            super(init);
            build();
        }

        private function build():void
        {
            v(12.054155,296.353516,-115.868515);
            v(21.534782,258.468597,-109.481003);
            v(32.763741,296.353516,-94.095695);
            v(21.534782,258.468597,-83.930984);
            v(0.948191,258.468597,-74.349724);
            v(0.948191,296.353516,-72.752846);
            v(-21.509724,258.468597,-83.930984);
            v(-32.738682,296.353516,-94.095695);
            v(-21.509724,258.468597,-107.884132);
            v(-10.40376,296.353516,-115.868515);
            v(0.948191,258.468597,-115.868515);
            v(0.948191,296.353516,-127.046646);
            v(31.049969,341.127014,-138.371155);
            v(36.751354,346.209381,-90.406921);
            v(0.948191,346.209381,-71.447701);
            v(-37.133904,346.209381,-90.406921);
            v(-30.447557,341.127014,-136.742767);
            v(0.881103,341.127014,-148.144516);
            v(30.891399,379.912537,-99.370163);
            v(23.031027,382.355103,-145.201828);
            v(0.948191,377.37442,-79.432083);
            v(-30.867357,379.912537,-99.370163);
            v(-18.993958,381.931244,-144.710876);
            v(0.83028,384.753967,-148.146545);
            v(-15.894737,397.87558,-100.855225);
            v(0.948191,401.483063,-93.80397);
            v(-9.09048,407.296265,-124.127335);
            v(0.865856,407.95697,-133.594757);
            v(10.822192,407.296265,-124.127335);
            v(17.791119,397.87558,-100.855225);
            v(0.948191,415.653687,-108.756256);
            v(-154.384872,280.16925,8.289386);
            v(-62.681896,230.916153,-66.365341);
            v(-128.184311,247.20816,33.200047);
            v(-51.452934,175.810211,-34.427818);
            v(-133.798294,226.234283,20.745222);
            v(-96.368767,141.36911,-34.427818);
            v(-118.826683,179.655502,-87.219269);
            v(-150.642227,247.20816,9.534564);
            v(-176.842789,292.154449,46.902081);
            v(-146.898575,244.212616,65.584816);
            v(-152.51355,217.244614,66.831009);
            v(-173.099121,259.194366,31.954874);
            v(-203.04335,265.186493,129.109192);
            v(-184.328094,238.219498,131.600555);
            v(-193.68573,196.270752,147.792938);
            v(-199.300705,226.234283,112.916786);
            v(-238.601547,202.262863,178.931534);
            v(51.477993,175.810211,-34.427818);
            v(62.706951,230.916153,-66.365341);
            v(128.209366,247.20816,33.200047);
            v(154.409927,280.16925,8.289386);
            v(133.823349,226.234283,20.745222);
            v(96.393814,141.36911,-34.427818);
            v(150.66626,247.20816,9.534564);
            v(118.851738,179.655502,-87.219269);
            v(176.867844,292.154449,46.902081);
            v(146.923615,244.212616,65.584816);
            v(152.538605,217.244614,66.831009);
            v(173.124176,259.194366,31.954874);
            v(203.068405,265.186493,129.109192);
            v(184.353149,238.219498,131.600555);
            v(193.710785,196.270752,147.792938);
            v(199.32576,226.234283,112.916786);
            v(238.626587,202.262863,178.931534);
            v(-72.433922,-160.545212,-12.071548);
            v(-54.570454,-165.070541,-12.071548);
            v(-87.119896,-254.727371,33.718449);
            v(-69.065338,-276.840698,35.224857);
            v(-27.123697,-244.371567,-34.427818);
            v(-43.207317,-295.473663,11.256465);
            v(-86.486633,-278.455872,10.745181);
            v(-105.726402,-223.706696,-34.427818);
            v(56.066338,-279.889099,31.067492);
            v(49.16552,-165.070541,-12.071548);
            v(76.37442,-259.162231,34.01424);
            v(67.365433,-160.545212,-12.071548);
            v(74.472603,-283.946869,9.90964);
            v(100.136467,-223.706696,-34.427818);
            v(29.965397,-298.071747,7.151957);
            v(25.27743,-244.371567,-34.427818);
            v(-114.839066,-329.537628,106.792564);
            v(-103.288902,-346.708893,115.368523);
            v(-45.27787,-363.414581,68.401459);
            v(-70.712021,-356.321655,57.972469);
            v(86.017685,-349.970734,109.761665);
            v(100.18119,-335.066223,104.916145);
            v(61.55122,-361.758728,57.199947);
            v(34.05669,-372.025116,66.640938);
            v(-51.799553,-412.895386,101.780342);
            v(46.146599,-415.89093,102.988914);
            v(-0.923133,-175.489365,-12.071548);
            v(0.948191,10.492335,-4.087167);
            v(-72.039528,-44.612598,-12.071548);
            v(-81.397163,-6.727705,-12.071548);
            v(-81.397163,31.157196,-12.071548);
            v(-72.039528,69.042091,-12.071548);
            v(-53.325275,100.039391,-12.071548);
            v(-28.99502,120.704247,-12.071548);
            v(0.948191,127.592873,-12.071548);
            v(29.020075,120.704247,-12.071548);
            v(53.349312,100.039391,-12.071548);
            v(72.064575,69.042091,-12.071548);
            v(81.422218,31.157196,-12.071548);
            v(81.422218,-6.727705,-12.071548);
            v(72.064575,-44.612598,-12.071548);
            v(-0.923133,-247.815353,-34.427818);
            v(-128.184311,-123.827209,-34.427818);
            v(-146.898575,-54.94503,-34.427818);
            v(-146.898575,17.38096,-34.427818);
            v(-128.184311,86.263145,-34.427818);
            v(0.948191,189.586441,-34.427818);
            v(128.209366,86.263145,-34.427818);
            v(146.923615,17.38096,-34.427818);
            v(146.923615,-54.94503,-34.427818);
            v(128.209366,-123.827209,-34.427818);
            v(-0.923133,-361.4711,-66.365341);
            v(-43.96764,-333.91864,-66.365341);
            v(-98.240097,-265.036438,-66.365341);
            v(-159.998856,-168.600739,-66.365341);
            v(-182.456757,-85.942322,-66.365341);
            v(-182.456757,7.048531,-66.365341);
            v(-159.998856,96.595581,-82.334106);
            v(0.948191,248.1362,-50.39658);
            v(160.023911,96.595581,-82.334106);
            v(182.481812,7.048531,-66.365341);
            v(182.481812,-85.942322,-66.365341);
            v(160.023911,-168.600739,-66.365341);
            v(98.265144,-265.036438,-66.365341);
            v(43.992695,-333.91864,-66.365341);
            v(-0.923133,-358.027283,-77.54348);
            v(-43.96764,-327.029968,-77.54348);
            v(-96.368767,-265.036438,-80.737228);
            v(-158.127533,-168.600739,-83.930984);
            v(-180.585434,-82.498512,-87.124733);
            v(-180.585434,3.604727,-90.318489);
            v(-158.127533,103.483185,-107.884132);
            v(-116.955368,172.365372,-117.465393);
            v(-62.681896,237.803772,-112.674759);
            v(62.706951,237.803772,-112.674759);
            v(116.980408,172.365372,-117.465393);
            v(158.152588,103.483185,-107.884132);
            v(180.610489,3.604727,-90.318489);
            v(180.610489,-82.498512,-87.124733);
            v(158.152588,-168.600739,-83.930984);
            v(96.393814,-265.036438,-80.737228);
            v(43.992695,-327.029968,-77.54348);
            v(-0.923133,-240.92775,-127.046646);
            v(-34.610004,-234.039124,-127.046646);
            v(-77.654518,-196.154221,-128.643524);
            v(-128.184311,-123.827209,-130.240387);
            v(-145.027237,-54.94503,-133.434143);
            v(-145.027237,13.937157,-135.031021);
            v(-128.184311,86.263145,-143.015396);
            v(-94.497444,137.924271,-150.999786);
            v(-49.581612,168.92157,-150.999786);
            v(0.948191,196.475052,-152.596664);
            v(0.948191,255.024811,-131.837265);
            v(49.60667,168.92157,-150.999786);
            v(94.522491,137.924271,-150.999786);
            v(128.209366,86.263145,-143.015396);
            v(145.052292,13.937157,-135.031021);
            v(145.052292,-54.94503,-133.434143);
            v(128.209366,-123.827209,-130.240387);
            v(77.678551,-196.154221,-128.643524);
            v(34.635063,-234.039124,-127.046646);
            v(0.948191,-113.494789,-162.177917);
            v(-28.99502,-106.607178,-162.177917);
            v(-53.325275,-85.942322,-162.177917);
            v(-70.168198,-54.94503,-163.774796);
            v(-79.525841,-17.060131,-165.372696);
            v(-79.525841,24.269587,-166.969574);
            v(-70.168198,62.154488,-166.969574);
            v(-53.325275,89.706955,-168.566437);
            v(-27.123697,110.371811,-168.566437);
            v(0.948191,117.260437,-170.163315);
            v(27.148754,110.371811,-168.566437);
            v(53.349312,89.706955,-168.566437);
            v(70.193253,62.154488,-166.969574);
            v(79.550888,24.269587,-166.969574);
            v(79.550888,-17.060131,-165.372696);
            v(70.193253,-54.94503,-163.774796);
            v(53.349312,-85.942322,-162.177917);
            v(29.020075,-106.607178,-162.177917);
            v(0.948191,3.604727,-178.14769);
            uv(0.824219,0.166016);
            uv(0.839844,0.052734);
            uv(0.925781,0.160156);
            uv(0.914063,0.048828);
            uv(0.945313,0.046875);
            uv(0.960938,0.15625);
            uv(0.916016,0.048828);
            uv(0.826172,0.166016);
            uv(0.814453,0.054688);
            uv(0.789063,0.167969);
            uv(0.765625,0.308594);
            uv(0.941406,0.296875);
            uv(0.988281,0.294922);
            uv(0.943359,0.296875);
            uv(0.732422,0.310547);
            uv(0.927734,0.4375);
            uv(0.75,0.449219);
            uv(0.974609,0.435547);
            uv(0.929688,0.4375);
            uv(0.716797,0.451172);
            uv(0.890625,0.525391);
            uv(0.933594,0.511719);
            uv(0.800781,0.546875);
            uv(0.765625,0.548828);
            uv(0.888672,0.525391);
            uv(0.884766,0.566406);
            uv(0.205078,0.017578);
            uv(0.003906,0.089844);
            uv(0.287109,0.066406);
            uv(0.083984,0.160156);
            uv(0.248047,0.099609);
            uv(0.082031,0.207031);
            uv(0.087891,0.212891);
            uv(0.005859,0.185547);
            uv(0.253906,0.105469);
            uv(0.216797,0.074219);
            uv(0.009766,0.095703);
            uv(0.210938,0.023438);
            uv(0.337891,0.005859);
            uv(0.398438,0.076172);
            uv(0.402344,0.113281);
            uv(0.291016,0.054688);
            uv(0.408203,0.119141);
            uv(0.34375,0.009766);
            uv(0.611328,0.048828);
            uv(0.621094,0.091797);
            uv(0.671875,0.15625);
            uv(0.5625,0.115234);
            uv(0.677734,0.162109);
            uv(0.617188,0.054688);
            uv(0.777344,0.148438);
            uv(0.783203,0.154297);
            uv(0.089844,0.166016);
            uv(0.292969,0.072266);
            uv(0.210938,0.068359);
            uv(0.001953,0.179688);
            uv(0.404297,0.082031);
            uv(0.285156,0.048828);
            uv(0.626953,0.095703);
            uv(0.556641,0.109375);
            uv(0.292969,0.585938);
            uv(0.275391,0.597656);
            uv(0.224609,0.730469);
            uv(0.181641,0.736328);
            uv(0.136719,0.603516);
            uv(0.136719,0.673828);
            uv(0.134766,0.677734);
            uv(0.134766,0.607422);
            uv(0.191406,0.673828);
            uv(0.160156,0.589844);
            uv(0.291016,0.589844);
            uv(0.222656,0.734375);
            uv(0.177734,0.740234);
            uv(0.273438,0.601563);
            uv(0.21875,0.734375);
            uv(0.292969,0.580078);
            uv(0.189453,0.664063);
            uv(0.220703,0.724609);
            uv(0.162109,0.582031);
            uv(0.134766,0.667969);
            uv(0.136719,0.597656);
            uv(0.132813,0.677734);
            uv(0.177734,0.912109);
            uv(0.121094,0.919922);
            uv(0.056641,0.826172);
            uv(0.054688,0.830078);
            uv(0.121094,0.828125);
            uv(0.175781,0.916016);
            uv(0.117188,0.919922);
            uv(0.171875,0.914063);
            uv(0.119141,0.816406);
            uv(0.171875,0.904297);
            uv(0.052734,0.818359);
            uv(0.052734,0.828125);
            uv(0.005859,0.992188);
            uv(0.003906,0.996094);
            uv(0.009766,0.998047);
            uv(0.017578,0.990234);
            uv(0.478516,0.761719);
            uv(0.486328,0.785156);
            uv(0.671875,0.761719);
            uv(0.5,0.851563);
            uv(0.611328,0.835938);
            uv(0.650391,0.845703);
            uv(0.693359,0.845703);
            uv(0.732422,0.835938);
            uv(0.763672,0.816406);
            uv(0.785156,0.791016);
            uv(0.792969,0.761719);
            uv(0.785156,0.732422);
            uv(0.763672,0.707031);
            uv(0.732422,0.6875);
            uv(0.693359,0.677734);
            uv(0.650391,0.677734);
            uv(0.611328,0.6875);
            uv(0.5,0.677734);
            uv(0.486328,0.742188);
            uv(0.400391,0.761719);
            uv(0.404297,0.789063);
            uv(0.425781,0.871094);
            uv(0.53125,0.894531);
            uv(0.601563,0.914063);
            uv(0.677734,0.914063);
            uv(0.748047,0.894531);
            uv(0.806641,0.859375);
            uv(0.84375,0.814453);
            uv(0.857422,0.761719);
            uv(0.84375,0.708984);
            uv(0.806641,0.664063);
            uv(0.748047,0.628906);
            uv(0.677734,0.609375);
            uv(0.601563,0.609375);
            uv(0.53125,0.628906);
            uv(0.425781,0.658203);
            uv(0.404297,0.736328);
            uv(0.283203,0.761719);
            uv(0.3125,0.806641);
            uv(0.382813,0.863281);
            uv(0.482422,0.927734);
            uv(0.572266,0.951172);
            uv(0.666016,0.951172);
            uv(0.759766,0.927734);
            uv(0.847656,0.884766);
            uv(0.900391,0.826172);
            uv(0.916016,0.761719);
            uv(0.900391,0.697266);
            uv(0.759766,0.595703);
            uv(0.847656,0.638672);
            uv(0.666016,0.572266);
            uv(0.572266,0.572266);
            uv(0.482422,0.595703);
            uv(0.382813,0.660156);
            uv(0.3125,0.716797);
            uv(0.964844,0.802734);
            uv(0.935547,0.849609);
            uv(0.96875,0.802734);
            uv(0.939453,0.849609);
            uv(0.869141,0.904297);
            uv(0.867188,0.904297);
            uv(0.769531,0.970703);
            uv(0.767578,0.96875);
            uv(0.681641,0.992188);
            uv(0.679688,0.990234);
            uv(0.585938,0.992188);
            uv(0.587891,0.990234);
            uv(0.492188,0.970703);
            uv(0.664063,0.949219);
            uv(0.767578,0.925781);
            uv(0.445313,0.925781);
            uv(0.375,0.882813);
            uv(0.365234,0.884766);
            uv(0.90625,0.826172);
            uv(0.306641,0.826172);
            uv(0.90625,0.697266);
            uv(0.306641,0.697266);
            uv(0.375,0.640625);
            uv(0.365234,0.638672);
            uv(0.767578,0.597656);
            uv(0.445313,0.597656);
            uv(0.488281,0.558594);
            uv(0.582031,0.537109);
            uv(0.580078,0.537109);
            uv(0.664063,0.574219);
            uv(0.675781,0.537109);
            uv(0.761719,0.560547);
            uv(0.763672,0.558594);
            uv(0.861328,0.625);
            uv(0.863281,0.625);
            uv(0.929688,0.679688);
            uv(0.933594,0.679688);
            uv(0.964844,0.726563);
            uv(0.958984,0.726563);
            uv(0.283203,0.740234);
            uv(0.929688,0.740234);
            uv(0.929688,0.761719);
            uv(0.929688,0.783203);
            uv(0.929688,0.759766);
            uv(0.283203,0.783203);
            uv(0.585938,0.365234);
            uv(0.6875,0.416016);
            uv(0.71875,0.365234);
            uv(0.578125,0.40625);
            uv(0.611328,0.476563);
            uv(0.535156,0.455078);
            uv(0.501953,0.548828);
            uv(0.449219,0.511719);
            uv(0.404297,0.574219);
            uv(0.371094,0.533203);
            uv(0.300781,0.574219);
            uv(0.289063,0.533203);
            uv(0.205078,0.511719);
            uv(0.185547,0.548828);
            uv(0.146484,0.474609);
            uv(0.107422,0.501953);
            uv(0.111328,0.423828);
            uv(0.03125,0.4375);
            uv(0.080078,0.365234);
            uv(0.007813,0.365234);
            uv(0.078125,0.365234);
            uv(0.03125,0.291016);
            uv(0.111328,0.306641);
            uv(0.105469,0.228516);
            uv(0.146484,0.253906);
            uv(0.183594,0.179688);
            uv(0.203125,0.216797);
            uv(0.298828,0.154297);
            uv(0.287109,0.197266);
            uv(0.371094,0.197266);
            uv(0.402344,0.154297);
            uv(0.449219,0.216797);
            uv(0.5,0.179688);
            uv(0.533203,0.273438);
            uv(0.611328,0.251953);
            uv(0.576172,0.322266);
            uv(0.685547,0.3125);
            uv(0.583984,0.365234);
            uv(0.439453,0.365234);
            uv(0.429688,0.398438);
            uv(0.404297,0.425781);
            uv(0.369141,0.447266);
            uv(0.324219,0.458984);
            uv(0.279297,0.458984);
            uv(0.236328,0.447266);
            uv(0.201172,0.425781);
            uv(0.177734,0.396484);
            uv(0.169922,0.365234);
            uv(0.167969,0.365234);
            uv(0.175781,0.332031);
            uv(0.199219,0.302734);
            uv(0.234375,0.283203);
            uv(0.277344,0.271484);
            uv(0.324219,0.271484);
            uv(0.367188,0.283203);
            uv(0.404297,0.302734);
            uv(0.429688,0.332031);
            uv(0.4375,0.365234);
            uv(0.302734,0.365234);
            uv(0.300781,0.365234);
            uv(0.003906,0.390625);
            uv(0.003906,0.365234);
            uv(0.003906,0.339844);
            uv(0.003906,0.363281);
            f(0,1,2,0,1,2);
            f(1,3,2,1,3,2);
            f(3,4,5,3,4,5);
            f(2,3,5,2,3,5);
            f(4,6,5,4,6,5);
            f(6,7,5,6,2,5);
            f(6,8,7,6,1,2);
            f(8,9,7,1,7,2);
            f(10,11,8,8,9,1);
            f(11,9,8,9,7,1);
            f(0,11,1,0,9,1);
            f(11,10,1,9,8,1);
            f(12,0,13,10,0,11);
            f(0,2,13,0,2,11);
            f(13,2,14,11,2,12);
            f(2,5,14,2,5,12);
            f(5,7,14,5,2,12);
            f(7,15,14,2,13,12);
            f(7,9,15,2,7,13);
            f(9,16,15,7,10,13);
            f(11,17,9,9,14,7);
            f(17,16,9,14,10,7);
            f(12,17,0,10,14,0);
            f(17,11,0,14,9,0);
            f(18,12,13,15,10,11);
            f(19,12,18,16,10,15);
            f(20,18,14,17,15,12);
            f(18,13,14,15,11,12);
            f(15,21,14,13,18,12);
            f(21,20,14,18,17,12);
            f(16,21,15,10,18,13);
            f(16,22,21,10,16,18);
            f(17,22,16,14,16,10);
            f(17,23,22,14,19,16);
            f(23,17,19,19,14,16);
            f(19,17,12,16,14,10);
            f(21,24,20,18,20,17);
            f(24,25,20,20,21,17);
            f(22,24,21,16,20,18);
            f(22,26,24,16,22,20);
            f(22,23,26,16,19,22);
            f(23,27,26,19,23,22);
            f(27,23,28,23,19,22);
            f(23,19,28,19,16,22);
            f(29,19,18,24,16,15);
            f(28,19,29,22,16,24);
            f(25,29,20,21,24,17);
            f(29,18,20,24,15,17);
            f(24,30,25,20,25,21);
            f(26,30,24,22,25,20);
            f(26,27,30,22,23,25);
            f(27,28,30,23,22,25);
            f(30,28,29,25,22,24);
            f(30,29,25,25,24,21);
            f(31,32,33,26,27,28);
            f(32,34,33,27,29,28);
            f(34,35,33,29,30,28);
            f(34,36,35,29,31,30);
            f(36,37,35,32,33,34);
            f(37,38,35,33,35,34);
            f(32,31,38,36,37,35);
            f(37,32,38,33,36,35);
            f(39,33,40,38,28,39);
            f(31,33,39,26,28,38);
            f(40,33,41,39,28,40);
            f(33,35,41,28,30,40);
            f(35,42,41,34,41,42);
            f(35,38,42,34,35,41);
            f(42,31,39,41,37,43);
            f(38,31,42,35,37,41);
            f(43,40,44,44,39,45);
            f(39,40,43,38,39,44);
            f(40,41,44,39,40,45);
            f(44,41,45,45,40,46);
            f(41,46,45,42,47,48);
            f(41,42,46,42,41,47);
            f(46,39,43,47,43,49);
            f(42,39,46,41,43,47);
            f(43,44,47,44,45,50);
            f(44,45,47,45,46,50);
            f(45,46,47,48,47,51);
            f(46,43,47,47,49,51);
            f(48,49,50,52,36,53);
            f(49,51,50,36,37,53);
            f(52,48,50,34,52,53);
            f(53,48,52,32,52,34);
            f(54,55,52,54,55,30);
            f(55,53,52,55,31,30);
            f(51,49,54,26,27,54);
            f(49,55,54,27,55,54);
            f(50,56,57,53,43,56);
            f(50,51,56,53,37,43);
            f(50,57,58,53,56,42);
            f(52,50,58,34,53,42);
            f(59,52,58,57,30,40);
            f(54,52,59,54,30,57);
            f(51,59,56,26,57,38);
            f(51,54,59,26,54,57);
            f(57,60,61,56,49,58);
            f(57,56,60,56,43,49);
            f(58,61,62,42,58,48);
            f(58,57,61,42,56,58);
            f(63,58,62,59,40,46);
            f(59,58,63,57,40,59);
            f(56,63,60,38,59,44);
            f(56,59,63,38,57,59);
            f(61,60,64,58,49,51);
            f(62,61,64,48,58,51);
            f(63,62,64,59,46,50);
            f(60,63,64,44,59,50);
            f(65,66,67,60,61,62);
            f(66,68,67,61,63,62);
            f(66,69,68,61,64,63);
            f(69,70,68,64,65,63);
            f(70,69,71,66,67,68);
            f(69,72,71,67,69,68);
            f(71,65,67,68,70,71);
            f(72,65,71,69,70,68);
            f(73,74,75,72,73,74);
            f(74,76,75,73,70,74);
            f(76,77,75,75,76,77);
            f(76,78,77,75,78,76);
            f(78,79,77,78,79,76);
            f(78,80,79,78,80,79);
            f(79,80,73,81,67,72);
            f(80,74,73,67,73,72);
            f(67,68,81,62,63,82);
            f(68,82,81,63,83,82);
            f(68,83,82,63,84,83);
            f(68,70,83,63,65,84);
            f(83,70,84,85,66,86);
            f(70,71,84,66,68,86);
            f(84,71,81,86,68,87);
            f(71,67,81,68,71,87);
            f(85,73,86,88,72,89);
            f(73,75,86,72,74,89);
            f(77,87,86,76,90,91);
            f(75,77,86,77,76,91);
            f(77,79,87,76,79,90);
            f(79,88,87,79,92,90);
            f(88,73,85,93,72,88);
            f(79,73,88,81,72,93);
            f(82,89,81,83,94,82);
            f(83,89,82,84,94,83);
            f(83,84,89,85,86,95);
            f(89,84,81,95,86,87);
            f(90,85,86,96,88,89);
            f(87,90,86,90,97,91);
            f(87,88,90,90,92,97);
            f(88,85,90,93,88,96);
            f(91,66,92,98,99,100);
            f(66,65,92,99,101,100);
            f(65,93,92,101,102,100);
            f(93,94,92,102,103,100);
            f(94,95,92,103,104,100);
            f(95,96,92,104,105,100);
            f(96,97,92,105,106,100);
            f(97,98,92,106,107,100);
            f(98,99,92,107,108,100);
            f(99,100,92,108,109,100);
            f(100,101,92,109,110,100);
            f(101,102,92,110,111,100);
            f(102,103,92,111,112,100);
            f(103,104,92,112,113,100);
            f(104,105,92,113,114,100);
            f(105,76,92,114,115,100);
            f(76,74,92,115,116,100);
            f(74,91,92,116,98,100);
            f(106,69,91,117,118,98);
            f(69,66,91,118,99,98);
            f(72,107,65,119,120,101);
            f(65,107,93,101,120,102);
            f(107,108,93,120,121,102);
            f(108,94,93,121,103,102);
            f(109,95,94,122,104,103);
            f(108,109,94,121,122,103);
            f(95,110,96,104,123,105);
            f(109,110,95,122,123,104);
            f(96,36,97,105,124,106);
            f(110,36,96,123,124,105);
            f(97,36,98,106,124,107);
            f(36,34,98,124,125,107);
            f(98,34,99,107,125,108);
            f(34,111,99,125,126,108);
            f(99,48,100,108,127,109);
            f(111,48,99,126,127,108);
            f(100,53,101,109,128,110);
            f(48,53,100,127,128,109);
            f(101,53,102,110,128,111);
            f(53,112,102,128,129,111);
            f(102,112,103,111,129,112);
            f(112,113,103,129,130,112);
            f(103,113,104,112,130,113);
            f(113,114,104,130,131,113);
            f(114,105,104,131,114,113);
            f(114,115,105,131,132,114);
            f(105,115,76,114,132,115);
            f(115,78,76,132,133,115);
            f(80,91,74,134,98,116);
            f(80,106,91,134,117,98);
            f(116,117,106,135,136,117);
            f(117,69,106,136,118,117);
            f(117,118,69,136,137,118);
            f(118,72,69,137,119,118);
            f(118,119,72,137,138,119);
            f(119,107,72,138,120,119);
            f(119,120,107,138,139,120);
            f(120,108,107,139,121,120);
            f(121,109,108,140,122,121);
            f(120,121,108,139,140,121);
            f(109,122,110,122,141,123);
            f(121,122,109,140,141,122);
            f(110,122,36,123,141,124);
            f(122,37,36,141,142,124);
            f(34,32,111,125,143,126);
            f(32,123,111,143,144,126);
            f(111,49,48,126,145,127);
            f(123,49,111,144,145,126);
            f(53,124,112,128,146,129);
            f(55,124,53,147,146,128);
            f(112,124,113,129,146,130);
            f(124,125,113,146,148,130);
            f(113,125,114,130,148,131);
            f(125,126,114,148,149,131);
            f(126,115,114,149,132,131);
            f(126,127,115,149,150,132);
            f(127,78,115,150,133,132);
            f(127,128,78,150,151,133);
            f(128,80,78,151,134,133);
            f(128,129,80,151,152,134);
            f(129,106,80,152,117,134);
            f(129,116,106,152,135,117);
            f(130,131,116,153,154,155);
            f(131,117,116,154,156,155);
            f(131,118,117,154,157,156);
            f(131,132,118,154,158,157);
            f(132,119,118,158,159,157);
            f(132,133,119,158,160,159);
            f(133,120,119,160,161,159);
            f(133,134,120,160,162,161);
            f(134,121,120,162,163,161);
            f(134,135,121,162,164,163);
            f(135,122,121,164,165,163);
            f(135,136,122,166,167,141);
            f(136,37,122,167,142,141);
            f(136,137,37,168,169,170);
            f(37,138,32,142,171,143);
            f(137,138,37,169,172,170);
            f(139,55,49,173,147,145);
            f(139,140,55,174,175,176);
            f(55,141,124,147,177,146);
            f(140,141,55,175,178,176);
            f(124,142,125,179,180,181);
            f(141,142,124,177,182,146);
            f(125,143,126,181,183,183);
            f(142,143,125,180,183,181);
            f(143,144,126,183,184,183);
            f(144,127,126,184,185,183);
            f(144,145,127,184,186,185);
            f(145,128,127,186,187,185);
            f(145,146,128,186,188,187);
            f(146,129,128,188,189,187);
            f(146,116,129,188,190,189);
            f(146,130,116,188,191,190);
            f(1,139,3,192,174,192);
            f(3,139,49,193,173,145);
            f(3,49,123,193,145,144);
            f(4,3,123,194,193,144);
            f(6,4,123,195,196,144);
            f(32,6,123,143,195,144);
            f(138,6,32,171,195,143);
            f(138,8,6,172,197,197);
            f(147,131,130,198,199,200);
            f(147,148,131,198,201,199);
            f(148,132,131,201,202,199);
            f(148,149,132,201,203,202);
            f(149,133,132,203,204,202);
            f(149,150,133,203,205,204);
            f(150,134,133,205,206,204);
            f(150,151,134,205,207,206);
            f(151,135,134,207,208,206);
            f(151,152,135,207,209,208);
            f(153,136,135,210,211,208);
            f(152,153,135,209,210,208);
            f(154,137,136,212,213,211);
            f(153,154,136,210,212,211);
            f(137,155,138,213,214,215);
            f(154,155,137,212,214,213);
            f(156,157,138,216,217,215);
            f(155,156,138,214,216,215);
            f(157,156,139,217,218,219);
            f(156,158,139,218,220,219);
            f(158,140,139,220,221,219);
            f(158,159,140,220,222,221);
            f(140,159,141,221,222,223);
            f(159,160,141,222,224,223);
            f(141,160,142,223,224,225);
            f(160,161,142,224,226,225);
            f(142,162,143,225,227,228);
            f(161,162,142,226,227,225);
            f(162,163,143,227,229,228);
            f(143,163,144,228,229,230);
            f(163,164,144,229,231,230);
            f(144,164,145,230,231,232);
            f(164,165,145,231,233,232);
            f(145,165,146,232,233,234);
            f(165,147,146,233,235,234);
            f(146,147,130,234,235,200);
            f(166,148,147,236,201,198);
            f(166,167,148,236,237,201);
            f(167,149,148,237,203,201);
            f(167,168,149,237,238,203);
            f(168,150,149,238,205,203);
            f(168,169,150,238,239,205);
            f(169,151,150,239,207,205);
            f(169,170,151,239,240,207);
            f(170,152,151,240,209,207);
            f(170,171,152,240,241,209);
            f(171,153,152,241,210,209);
            f(171,172,153,241,242,210);
            f(173,154,153,243,212,210);
            f(172,173,153,242,243,210);
            f(174,155,154,244,214,212);
            f(173,174,154,243,244,212);
            f(175,156,155,245,216,214);
            f(174,175,155,244,245,214);
            f(156,175,158,218,246,220);
            f(175,176,158,246,247,220);
            f(158,176,159,220,247,222);
            f(176,177,159,247,248,222);
            f(159,177,160,222,248,224);
            f(177,178,160,248,249,224);
            f(160,179,161,224,250,226);
            f(178,179,160,249,250,224);
            f(161,180,162,226,251,227);
            f(179,180,161,250,251,226);
            f(180,181,162,251,252,227);
            f(162,181,163,227,252,229);
            f(181,182,163,252,253,229);
            f(163,182,164,229,253,231);
            f(182,183,164,253,254,231);
            f(164,183,165,231,254,233);
            f(183,166,165,254,255,233);
            f(165,166,147,233,255,235);
            f(184,167,166,256,237,236);
            f(184,168,167,256,238,237);
            f(184,169,168,256,239,238);
            f(184,170,169,256,240,239);
            f(184,171,170,256,241,240);
            f(184,172,171,256,242,241);
            f(184,173,172,256,243,242);
            f(184,174,173,256,244,243);
            f(184,175,174,256,245,244);
            f(175,184,176,246,257,247);
            f(176,184,177,247,257,248);
            f(177,184,178,248,257,249);
            f(178,184,179,249,257,250);
            f(179,184,180,250,257,251);
            f(180,184,181,251,257,252);
            f(181,184,182,252,257,253);
            f(182,184,183,253,257,254);
            f(183,184,166,254,257,255);
            f(138,157,8,215,217,258);
            f(157,10,8,217,259,258);
            f(157,139,1,217,219,260);
            f(10,157,1,261,217,260);
            
            type = "SeaTurtle";
        	url = "primitive";
        }
    }
}