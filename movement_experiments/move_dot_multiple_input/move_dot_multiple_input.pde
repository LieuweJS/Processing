boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;

boolean rightPressed = false;
int speed = 3;
int x = 400;
int y = 400;

void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  fill(255,0,0);
   if (upPressed) {
    y += speed;;
  }
  
  if (downPressed) {
    y -= speed;
  }
  
  if (leftPressed) {
    x += speed;
  }
  
  if (rightPressed) {
    x -= speed;
  }
  ellipse(x,y,50,50);
}

void keyPressed() {
  if (keyCode == UP) {
    upPressed = true;
  }
  else if (keyCode == DOWN) {
    downPressed = true;
  }
  else if (keyCode == LEFT) {
    leftPressed = true;
  }
  else if (keyCode == RIGHT) {
    rightPressed = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    upPressed = false;
  }
  else if (keyCode == DOWN) {
    downPressed = false;
  }
  else if (keyCode == LEFT) {
    leftPressed = false;
  }
  else if (keyCode == RIGHT) {
    rightPressed = false;
  }
}
