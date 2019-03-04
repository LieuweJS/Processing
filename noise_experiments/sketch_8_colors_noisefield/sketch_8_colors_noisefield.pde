color color1 = color(99, 186, 170);
color color2 = color(72, 156, 147);
color color3 = color(65, 139, 150);
color color4 = color(84,148,129);
color color5 = color(40,91,102);
color color6 = color(61,99,83);
color color7 = color(21,51,61);
color color8 = color(40,61,49);

float increment = 0.02;
void setup() {
 size(displayWidth,displayHeight);
 loadPixels();
}

void draw() {
noiseDetail(10,0.5);
 float xOff = 0;
 for(int x = 0; x < width; x++) {
   xOff += increment;
   float yOff = 0;
   for(int y = 0; y < height; y++) {
     yOff += increment;
     float noise = noise(xOff, yOff);
     if (noise < 0.2) {
       pixels[x+y*width] = color1;
     } else if (noise < 0.25) {  
       pixels[x+y*width] = color2;    
     } else if (noise < 0.3) {
       pixels[x+y*width] = color3;          
     }else if (noise < 0.4) {
       pixels[x+y*width] = color4;          
     }else if (noise < 0.55) {
       pixels[x+y*width] = color5;          
     }else if (noise < 0.65) {
       pixels[x+y*width] = color6;          
     }else if (noise < 0.8) {
       pixels[x+y*width] = color7;          
     }else if (noise < 1) {
       pixels[x+y*width] = color8;          
     }
   }
 }
 updatePixels();
}
