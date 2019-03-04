FloatList heightMap;
float increment = 0.015;

void setup() {
 size(800,400,P3D);
 getNoiseLandscape();
 println(heightMap);
}

void draw() {
 
}

void getNoiseLandscape() {
 loadPixels();
 noiseDetail(10,0.4);
 heightMap = new FloatList();
 float xOff = 0;
 for(int x = 0; x < width; x++) {
   xOff += increment;
   float yOff = 0;
   for(int y = 0; y < height; y++) {
   yOff += increment;
   float noise = noise(xOff, yOff);
   pixels[x+y*width] = color(noise * 255);
   heightMap.append(round(noise * 100));
   }
 } 
 updatePixels();
}
