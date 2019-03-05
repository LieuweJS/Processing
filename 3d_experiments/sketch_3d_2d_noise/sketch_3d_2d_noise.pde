float scale = 1.0;
float increment = 0.015 * scale;
int maxHeight = 50;

void setup() {
 size(800,600,P3D);
 beginCamera();
 camera();
 rotateX(0.75);
 endCamera();
 lights();
 getNoiseLandscape();
}

void getNoiseLandscape() {;
 noiseDetail(10,0.5);
 float xOff = 0;
 for(int x = 0; x < width; x += scale) {
   xOff += increment;
   float yOff = 0;
   for(int y = 0; y < height; y += scale) {
     yOff += increment;
     float noise = noise(xOff, yOff);
     noStroke();
     pushMatrix();
     fill(noise*255);
     translate(x,y,round(noise*maxHeight)/2);
     box(scale,scale,round(noise * maxHeight));
     popMatrix();
   }
 } 
}
