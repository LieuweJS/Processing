float scale = 1.0;
float increment = 0.015 * scale;
int maxHeight = round(random(100));

int R = round(random(255));
int G = round(random(255));
int B = round(random(255));
color gradientStart = color(R,G,B);

int randCol = round(random(240));
int randSat = round(random(70));
int randBright = round(random(90));

void setup() {
  size(displayWidth,displayHeight,P3D);
  beginCamera();
  camera();
  rotateX(radians(0));
  endCamera();
  lights();
  getNoiseLandscape();
}

void getNoiseLandscape() {
  for(int y=0; y<height; y+=scale) {
    for(int x=0; x<width; x+=scale) {
      float xWarp = x * 0.001;
      float yWarp = y * 0.001;
      float warpX1 = noise(xWarp + 1, yWarp + 1);
      float warpY1 = noise(xWarp + 2, yWarp + 2);
      float warpX2 = noise(xWarp + 3 * warpX1, yWarp + 3 * warpY1);
      float warpY2 = noise(xWarp + 4 * warpX1, yWarp + 4 * warpY1);
      float warpX3 = noise(xWarp + 5 * warpX2, yWarp + 5 * warpY2);
      
      color gradientEnd = color(warpX1*255,warpY1*255,warpX2*255);
      
      int r = round(map(warpX3, 0, 1, red(gradientStart), red(gradientEnd)));
      int g = round(map(warpX3, 0, 1, green(gradientStart), green(gradientEnd)));
      int b = round(map(warpX3, 0, 1, blue(gradientStart), blue(gradientEnd)));

      color Color = color(r,g,b); 
      noStroke();
      pushMatrix();
      fill(Color);
      translate(x,y,(warpX3 * maxHeight)/2);  
      box(scale,scale,warpX3 * maxHeight);
      popMatrix(); 
    }
  }
}
