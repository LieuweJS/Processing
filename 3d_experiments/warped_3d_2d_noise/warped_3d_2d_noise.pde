float scale = 1.0;
float increment = 0.015 * scale;
int maxHeight = 65;

void setup() {
  size(displayWidth,displayHeight,P3D);
  beginCamera();
  camera();
  rotateX(radians(35));
  endCamera();
  getNoiseLandscape();
  
}

void getNoiseLandscape() {
 lights();
  for(int y=0; y<height/2; y+=scale) {
    for(int x=0; x<width/2; x+=scale) {
      float xWarp = x * 0.001;
      float yWarp = y * 0.001;
      float warpX1 = noise(xWarp + 1, yWarp + 1);
      float warpY1 = noise(xWarp + 2, yWarp + 2);
      float warpX2 = noise(xWarp + 3 * warpX1, yWarp + 3 * warpY1);
      float warpY2 = noise(xWarp + 4 * warpX1, yWarp + 4 * warpY1);
      float warpX3 = noise(xWarp + 5 * warpX2, yWarp + 5 * warpY2);
      noStroke();
      pushMatrix();
      fill(warpX3*255);
      translate(x+(width/4),y+(height/4),(warpX3 * maxHeight)/2);  
      box(scale,scale,warpX3 * maxHeight);
      popMatrix();
    }
  }
}
