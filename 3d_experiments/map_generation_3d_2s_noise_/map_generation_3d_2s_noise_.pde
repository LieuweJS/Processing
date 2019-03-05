float scale = 2.0;
float increment = 0.015 * scale;
int maxHeight = 50;

int randCol = round(random(240));
int randSat = round(random(70));
int randBright = round(random(90));

void setup() {
  size(1920,1080,P3D);
  beginCamera();
  camera();
  rotateX(radians(30));
  endCamera();
  getNoiseLandscape();
}

void getNoiseLandscape() {
 lights();
  for(int y=0; y<height; y+=scale) {
    for(int x=0; x<width; x+=scale) {
      float xWarp = x * 0.001;
      float yWarp = y * 0.001;
      float warpX1 = noise(xWarp + 1, yWarp + 1);
      float warpY1 = noise(xWarp + 2, yWarp + 2);
      float warpX2 = noise(xWarp + 3 * warpX1, yWarp + 3 * warpY1);
      float warpY2 = noise(xWarp + 4 * warpX1, yWarp + 4 * warpY1);
      float warpX3 = noise(xWarp + 5 * warpX2, yWarp + 5 * warpY2);
      float warpY3 = noise(x + 6 * warpX2, y + 6 * warpY2); 
      
      if(round(warpX3 * 100) <= 30) {
        noStroke();
        pushMatrix();
        fill(0,0,200);
        translate(x,y,(warpX3 * maxHeight)/2);  
        box(scale,scale,warpX3 * maxHeight);
        popMatrix();
      } else {
        noStroke();
        pushMatrix();
        fill(0,200,0);
        translate(x,y,(warpX3 * maxHeight)/2);  
        box(scale,scale,warpX3 * maxHeight);
        popMatrix();
      }
    }
  }
}
