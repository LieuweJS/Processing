//takes a while to load
void setup() {
  size(displayWidth,displayHeight);
  colorMode(HSB);
  for(int y=0; y<height; y++) {
    for(int x=0; x<width; x++) {
      color Color = warp(x*0.01,y*0.01);
      fill(Color);
      stroke(Color);
      rect(x, y, x, y);
    }
  }
}

color warp(float x, float y) { 
  //warps
  float warpX1 = noise(x + 1, y + 1);
  float warpY1 = noise(x + 2, y + 2);
  float warpX2 = noise(x + 4 * warpX1, y + 4 * warpY1);
  float warpY2 = noise(x + 5 * warpX1, y + 5 * warpY1);
  float warpX3 = noise(x + 6 * warpX2, y + 6 * warpY2);
  float warpY3 = noise(x + 7 * warpX2, y + 4 * warpY2);
  
  float H = noise(x + 4 * warpX1, y + 4 * warpY1);
  float S = noise(x + 6 * warpX2, y +6 * warpY2);
  float B = noise(x + 8 * warpX3, y + 8 * warpY3);
  color Color = color(H*360,S*360,B*360);
  return Color;
} 

/*
warp distorts the noise field, so it looks a lot more interesing, 
for a more detailed explanation see: http://www.nolithius.com/articles/world-generation/world-generation-techniques-domain-warping
*/
