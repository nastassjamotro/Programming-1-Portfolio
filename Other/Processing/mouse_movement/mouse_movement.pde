// runs exactly one time
void setup() {
  size(500,500);
  background(200);
  frameRate(60);
}

// operates on a loop
void draw() {
  fill(0,0,255);
  ellipse(250,250,mouseX,mouseY);
}