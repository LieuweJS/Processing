float increment = 0.02;
void setup() {
 size(displayWidth,displayHeight);
 loadPixels();
}

void draw() {
noiseDetail(10,0.5);
 float xOff = 0;
 for(int x = 0; x < width; x++) {
   xOff += increment;
   float yOff = 0;
   for(int y = 0; y < height; y++) {
     yOff += increment;
     float noise = noise(xOff, yOff);
     if ((noise - 0.5) < 0) {
       pixels[x+y*width] = color(0,0,0);
     } else {  
       pixels[x+y*width] = color(255,255,255);    
     }
   }
 }
 updatePixels();
}
