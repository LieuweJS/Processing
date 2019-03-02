//takes a while to load
int r = round(random(255));
int g = round(random(255));
int b = round(random(255));
color gradientStart = color(100,55,33); //100,55,33 is great
void setup() {
  //size(400,200);
  size(displayWidth,displayHeight);
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
  float warpX3 = noise(x + 4 * warpX2, y + 4 * warpY2);
  //color gradients
  color gradientEnd = color(warpX1*255,warpY1*255,warpX2*255);
  color Color = color(round(map(warpX3, 0, 1, red(gradientStart), red(gradientEnd))), round(map(warpX3, 0, 1, green(gradientStart), green(gradientEnd))), round(map(warpX3, 0, 1, blue(gradientStart), blue(gradientEnd))));
  return Color;   
} 

/*
warp distorts the noise field, so it looks a lot more interesing, 
for a more detailed explanation see: http://www.nolithius.com/articles/world-generation/world-generation-techniques-domain-warping
*/
