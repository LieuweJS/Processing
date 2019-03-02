//takes a while to load
int b = round(random(255));
void setup() {
  //size(400,400);
  size(displayWidth,displayHeight);
  for(int y=0; y<height; y++) {
    for(int x=0; x<width; x++) {
      color b = warp(x*0.01,y*0.01);
      fill(b);
      stroke(b);
      rect(x, y, x, y);
    }
  }
}

color warp(float x, float y) { 
  float warp1 = noise(x + 1, y + 1);//first warp
  float warp2 = noise(x * warp1, y * warp1);//second warp
  float warp3 = noise(x * warp2, y * warp2);//third warp
  float warp4 = noise(x * warp3, y * warp3);//fourth warp
  color b = color(warp4*255); 
  return color(b);   
} 

/*
warp distorts the noise field, so it looks a lot more interesing, 
for a more detailed explenation see: http://www.nolithius.com/articles/world-generation/world-generation-techniques-domain-warping
*/
