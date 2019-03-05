float rotation= 0;
float scale = 1.0;
float increment = 0.015 * scale;
int maxHeight = 50;

void setup() {
 size(800,600,P3D);
 loadPixels();
 beginCamera();
 camera();
 //rotateX(1);
 endCamera();
 lights();
 getNoiseLandscape();
 save("3dWithSeedOriginalNoise");
}

void getNoiseLandscape() {;
noiseSeed(44);
 noiseDetail(10,0.5);
 float xOff = 0;
 for(int x = 0; x < width/2; x += scale) {
   xOff += increment;
   float yOff = 0;
   for(int y = 0; y < height/2; y += scale) {
     yOff += increment;
     float noise = noise(xOff, yOff);
      pixels[x+y*width] = color(round(noise *255));
     /*noStroke();
     pushMatrix();
     fill(noise*255);
     translate(x+100,y+100, round(noise*maxHeight)/2);
     box(scale,scale,round(noise * maxHeight));
     popMatrix();*/
   }
 } 
 updatePixels();
}
