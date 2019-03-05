float rotation= 0;
int totalAddTo = 0;
float scale = 2.0;
float increment = 0.015 * scale;
int total = 0;
int maxHeight = 50;

void setup() {
 size(800,600,P3D);
 beginCamera();
 camera();
 rotateX(1);
 endCamera();
 lights();
 getNoiseLandscape();
}

float[] heightMap = new float[64000000];
float xPos = width/2;
float yPos = height/4;

void getNoiseLandscape() {;
 noiseDetail(10,0.5);
 float xOff = 0;
 for(int x = 0; x < width; x += scale) {
   xOff += increment;
   float yOff = 0;
   for(int y = 0; y < height/2; y += scale) {
   yOff += increment;
   float noise = noise(xOff * scale, yOff * scale);
   heightMap[totalAddTo] = round(noise * maxHeight);
   totalAddTo += 1;
   }
 } 
 for(int y = 0; y < height/2; y += scale) {
    for(int x = 0; x < width; x += scale) {
      noStroke();
      pushMatrix();
      translate(xPos,yPos,-100);
      box(scale,scale,heightMap[total]);
      popMatrix();
      total += 1;
      xPos += scale;
    }
    xPos = 0.0;
    yPos += scale;
  }
  yPos = 0.0;
}
