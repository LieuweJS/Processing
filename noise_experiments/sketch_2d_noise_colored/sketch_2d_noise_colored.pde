float increment = 0.02;
void setup() {
 size(displayWidth,displayHeight);
 colorMode(HSB);
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
   float noise = noise(xOff, yOff) * 360;
   pixels[x+y*width] = color(noise, 360,360);
   }
 }
 updatePixels();
}
