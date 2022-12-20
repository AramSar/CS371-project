run("Binary Layers");
selectWindow("layer_0_");
close();
setOption("BlackBackground", false);
selectWindow("layer_1_");
run("Convert to Mask");
selectWindow("layer_2_");
run("Convert to Mask");
selectWindow("layer_3_");
run("Convert to Mask");
selectWindow("layer_1_");
run("Fill Holes");
selectWindow("layer_2_");
run("Fill Holes");
selectWindow("layer_3_");
run("Fill Holes");
imageCalculator("AND create", "layer_1_","layer_2_");
selectWindow("Result of layer_1_");
imageCalculator("AND create", "Result of layer_1_","layer_3_");
selectWindow("Result of Result of layer_1_");
selectWindow("Result of layer_1_");
close();
selectWindow("layer_2_");
close();
selectWindow("layer_3_");
close();
selectWindow("layer_1_");
close();
run("Set Measurements...", "centroid redirect=None decimal=3");
run("Analyze Particles...", "  show=Ellipses display");
saveAs("Results", "/Users/aram/Desktop/IP/CS371-project/Task2_179-13.csv");
selectWindow("Result of Result of layer_1_");
saveAs("Jpeg", "/Users/aram/Desktop/IP/CS371-project/task2_179-13.jpg");





