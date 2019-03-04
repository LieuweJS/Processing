float xOff = 0.01;
void setup() {
 size(400,400); 
 frameRate(5);
}

void draw() {
 for(int y = 0; y < height; y++) {
   for(int x = 0; x < width; x++) {
    float hue = noise(xOff);
    stroke(hue*360);
    line(x, y, x, y);
    xOff = xOff + 0.01;
  }
 }
}
