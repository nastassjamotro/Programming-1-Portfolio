int x = 500;
int y = 500;

void setup() {
  size(500,500);
  background(128);
}

void draw() {
  background(128);
  ellipse(x--,y--,50,50);
  println(x);
}