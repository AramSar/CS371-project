run("Enhance Contrast...", "saturated=10");
run("Mean...", "radius=1");
run("Binary Layers");
selectWindow("layer_0_");
setOption("BlackBackground", false);
run("Dilate");
selectWindow("layer_1_");
run("Dilate");
selectWindow("layer_3_");
close();
selectWindow("layer_2_");
close();
imageCalculator("OR create", "layer_0_","layer_1_");
selectWindow("Result of layer_0_");
saveAs("Jpeg", "/Users/aram/Desktop/IP/CS371-project/Task5M2_179-11.jpg");

