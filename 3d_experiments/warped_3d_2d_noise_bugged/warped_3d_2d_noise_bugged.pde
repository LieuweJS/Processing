float scale = 1.0;
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
 for(int x = 0; x < width; x += scale) {
   for(int y = 0; y < height; y += scale) {
     color Color = warp(x*0.0105,y*0.01);
     noStroke();
     pushMatrix();
     fill(Color);
     translate(x,y,round(Color)/2);
     box(scale,scale,round(Color * maxHeight));
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
