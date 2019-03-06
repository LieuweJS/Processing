float scale = 1.0;
float increment = 0.02 * scale;
int maxHeight = round(random(250));
float minHeight = 0.3;
color Color;
int boxHeight;
color gradientStart = color(50, 240, 43);

void setup() {
  size(displayWidth,displayHeight,P3D);
  beginCamera();
  camera();
  rotateX(radians(35));
  endCamera();
  lights();
  getNoiseLandscape();
}


void getNoiseLandscape() {
  for(int y=0; y<height/2; y+=scale) {
    for(int x=0; x<width/2; x+=scale) {
      float xWarp = x * 0.001;
      float yWarp = y * 0.001;
      float warpX1 = noise(xWarp + 1, yWarp + 1);
      float warpY1 = noise(xWarp + 2, yWarp + 2);
      float warpX2 = noise(xWarp + 3 * warpX1, yWarp + 3 * warpY1);
      float warpY2 = noise(xWarp + 4 * warpX1, yWarp + 4 * warpY1);
      float warpX3 = noise(xWarp + 5 * warpX2, yWarp + 5 * warpY2);
      if (warpX3 * 100 < 30) {
        if(warpX3 * 100 < minHeight * 100) {
          minHeight = warpX3;
        }
        Color = color(15,94,240); 
        boxHeight = round(0.3*maxHeight);
      } else {
        color gradientEnd = color(warpX1*255,warpY1*255,warpX2*255);
      
        int r = round(map(warpX3, 0, 1, red(gradientStart), red(gradientEnd)));
        int g = round(map(warpX3, 0, 1, green(gradientStart), green(gradientEnd)));
        int b = round(map(warpX3, 0, 1, blue(gradientStart), blue(gradientEnd)));
        Color = color(r,g,b); 
        boxHeight = round(warpX3 * maxHeight);
      }
      noStroke();
      pushMatrix();
      fill(Color);
      translate(x+width/4,y+height/4,boxHeight/2);  
      box(scale,scale,boxHeight-(round((minHeight * maxHeight))));
      popMatrix(); 
    }
  }
}
