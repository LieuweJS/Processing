float scale = 1.0;
float increment = 0.015 * scale;
int maxHeight = 50;

int randCol = round(random(240));
int randSat = round(random(70));
int randBright = round(random(90));

void setup() {
 colorMode(HSB);
 size(displayWidth,displayHeight,P3D);
 beginCamera();
 camera();
 rotateX(0.75);
 endCamera();
 lights();
 getNoiseLandscape();
}

void getNoiseLandscape() {;
 noiseDetail(10,0.5);
 float xOff = 0;
 for(int x = 0; x < width; x += scale) {
   xOff += increment;
   float yOff = 0;
   for(int y = 0; y < height; y += scale) {
     yOff += increment;
     float noise = noise(xOff, yOff);
     noStroke();
     pushMatrix();
     fill(noise*360,360,360);
     translate(x,y,round(noise*maxHeight)/2);
     box(scale,scale,round(noise * maxHeight));
     popMatrix();
   }
 } 
}

color warp(float x, float y) { 
  //warps
  float warpX1 = noise(x + 1, y + 1);
  float warpY1 = noise(x + 2, y + 2);
  float warpX2 = noise(x + 3 * warpX1, y + 3 * warpY1);
  float warpY2 = noise(x + 4 * warpX1, y + 4 * warpY1);
  float warpX3 = noise(x + 5 * warpX2, y + 5 * warpY2);
  float warpY3 = noise(x + 6 * warpX2, y + 6 * warpY2);
  
  float H = noise(x + 3 * warpX1, y + 3 * warpY1);
  float S = noise(x + 3.1 * warpX2, y + 3.1 * warpY2);
  float B = noise(x + 3.2 * warpX3, y + 3.2 * warpY3);
  color Color = color((H*120) + randCol, (S*150) + randSat, (B*250) + randBright);
  return Color;
} 
