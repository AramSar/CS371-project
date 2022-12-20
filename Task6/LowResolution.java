import ij.plugin.filter.PlugInFilter;
import ij.ImagePlus;
import ij.process.ImageProcessor;
import ij.process.ColorProcessor;
import ij.IJ;
import java.lang.Math;
//import java.awt.Color;



public class LowResolution implements PlugInFilter {

	String title;

	public int setup(String arg, ImagePlus imp) {
		title = imp.getShortTitle();
		return DOES_RGB;
	}
	
	public void run(ImageProcessor inputIP) {
		
		int height = inputIP.getHeight();
		int width = inputIP.getWidth();
		int col, row;
		
		int w = (int) Math.ceil(width/5);
		int h = (int) Math.ceil(height/5);
		ColorProcessor outputIP = new ColorProcessor(w, h);
        
		int rsum;
		int gsum;
		int bsum;
		

		for (col = 0; col < w; col++){
			for (row = 0; row < h; row++){
				rsum=0;
				gsum=0;
				bsum=0;
				for (int c = col*5; c < col*5+5; c++){
					for (int r = row*5; r < row*5+5; r++){
						if (c > width || r > height){
							continue;
						}
						int pixel = inputIP.getPixel(c, r);
						int red = (pixel & 0xff0000) >> 16; 
						int green = (pixel & 0x00ff00) >> 8; 
						int blue = (pixel & 0x0000ff);
	
						rsum += red;
						gsum += green;
						bsum += blue;

					}
				}
				
				int adj_r = (int) rsum/25;
				int adj_g = (int) gsum/25;
				int adj_b = (int) bsum/25;

				int adj_c = ((adj_r & 0xff) << 16) | ((adj_g & 0xff) << 8) | adj_b & 0xff;
				outputIP.putPixel(col, row, adj_c);	
            }
        }
		
		(new ImagePlus(title + "low_res", outputIP)).show();
	}
}