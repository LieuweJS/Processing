//takes a while to load
int randCol = round(random(240));
int randSat = round(random(70));
int randBright = round(random(90));
void setup() {
  size(displayWidth,displayHeight);
  colorMode(HSB);
  for(int y=0; y<height; y++) {
    for(int x=0; x<width; x++) {
      color Color = warp(x*0.0105,y*0.01);
      noStroke();
      fill(Color);     
      rect(x, y, x, y);
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

/*
warp distorts the noise field, so it looks a lot more interesing, 
for a more detailed explanation see: http://www.nolithius.com/articles/world-generation/world-generation-techniques-domain-warping
*/
