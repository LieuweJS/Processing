float freq = 0.01; // Change this to essentially zoom in and out.
float res = 1; // Resolution, if the program is running slowly then increase this value, this value corresponds to how large each square is in pixels, reduce to 1 if you want a full res image
int r = round(random(255));
int g = round(random(255));
int b = round(random(255));
color grad1 = color(r,g,b);// Start of gradient change this to give the image a general tint of that color
void setup() {
  size(displayWidth,displayHeight); // Change this value to change the size of the window
  surface.setResizable(false); // Changing this to false makes the window not resizable
  background(255,0,0);
  colorMode(RGB);
}
void draw() {
  for(int y=0; y<height; y++) {
    for(int x=0; x<width; x++) {
      color b = warp(x*freq,y*freq);
      fill(b);
      stroke(b);
      rect(x, y, x, y);
    }
  }
  noLoop();
}
color warp(float x, float y) { // Returns a color using warped perlin noise based on domain warping.
  float x1 = noise(x + 1, y + 1);// First warping
  float y1 = noise(x + 2, y + 2);//
  float x2 = noise(x + 4.0 * x1, y + 4.0 * y1);// Second Warping
  float y2 = noise(x + 4.0 * x1 + 1, y + 4.0 * y1 + 1);//
  float x3 = noise(x1 + 4.0 * x2, y1 + 4.0 * y2);// Final Value from domain Warping
  color grad2 = color(x1*255, y1*255, x2*255); //End of gradient
  //float y3 = noise(x1 + 4.0 * x2 + 1, y1 + 4.0 * y2 + 1);
  int r = round(map(x3, 0, 1, red(grad1), red(grad2)));
  int g = round(map(x3, 0, 1, green(grad1), green(grad2)));
  int b = round(map(x3, 0, 1, blue(grad1), blue(grad2)));
  return color(r,g,b);
}
  
