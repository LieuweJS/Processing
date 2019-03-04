//the perfect screensaver?
float x = 0.0;
float y = 0.0;
void setup() {
 size(400,400,P3D); 
 background(0);
}

void draw() {
 int Color = color(round(noise(x) * 255), round(noise(y) * 255), round(noise(x + y) * 255));
 background(0);
 fill(Color);
 translate(width/2, height/2);
 rotateX(x);
 rotateY(x);
 box(round(noise(x)*200));
 x = x + 0.01;
 y = y + 0.01;
}
