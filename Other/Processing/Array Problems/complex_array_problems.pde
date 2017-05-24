//Problem #5:
//Write a program that implements a simple rollover. In other words, if the mouse s over
//a rectangle, the rectangle changes color.
int x = 50;
int y = 50;
int w = 100;
int h = 75;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  stroke(0);
  if (mouseX>=x && mouseX<w+x && mouseY>y && mouseY<=h+y) {
    fill(255, 0, 0);
  } else {
    fill(128);
  }
  rect(x, y, w, h);
}