float yOff = 0.0;
float prevX = 0;
int prevY = displayHeight/2;
float increment = 0.01;
void setup() {
 size(displayWidth,displayHeight); 
 background(255);
}

void draw() {
 for(float x = 0; x < displayWidth; x++) {
  float noise = noise(yOff);
  int noiseFinal = round((noise * 100) + displayHeight/2);
  line(prevX, prevY, x, noiseFinal);
  prevX = x;
  prevY = noiseFinal;
  yOff += increment;
 }
 noLoop();
}
