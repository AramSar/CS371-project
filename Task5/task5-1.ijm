run("Enhance Contrast...", "saturated=10");
run("Mean...", "radius=1");
run("Binary Layers");
selectWindow("layer_0_");
selectWindow("layer_2_");
close();
selectWindow("layer_1_");
close();
selectWindow("layer_3_");
close();
setOption("BlackBackground", false);
run("Skeletonize");
saveAs("Jpeg", "/Users/aram/Desktop/IP/CS371-project/Task5M1_179-11.jpg");

