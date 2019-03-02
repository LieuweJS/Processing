//takes a while to load
int gradientStart = 99;
int gradientEnd = 230;
void setup() {
  size(800,500);
  //size(displayWidth,displayHeight);
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
  float warp1 = noise(x + 1, y + 2);//first warp
  float warp2 = noise(x + 4 * warp1, y + 4 * warp1 + 3);//second warp
  float warp3 = noise(x + 4 * warp2, y + 4 * warp2 + 6);//third warp
  int hue = round(warp3 * 360);
  int Color = round(map(hue,0,360,gradientStart,gradientEnd));
  return color(Color,360,360);   
} 

/*
warp distorts the noise field, so it looks a lot more interesing, 
for a more detailed explanation see: http://www.nolithius.com/articles/world-generation/world-generation-techniques-domain-warping
*/
