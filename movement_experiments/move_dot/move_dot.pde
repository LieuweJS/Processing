int x = 400;
int y = 400;
int speed = 10;
void setup() {
  background(0);
  size(800,800);
}

void draw() {
 ellipse(x,y,10,10);
}

void keyPressed() {
  background(0);
    if (keyCode == UP) {
      y -= speed; 
    } 
    if(keyCode == DOWN) {
      y += speed; 
    } 
    if(keyCode == LEFT) {
      x -= speed;
    }  
    if(keyCode == RIGHT) {
      x += speed;
    }
}
