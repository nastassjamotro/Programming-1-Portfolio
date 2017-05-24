void setup() {
  size(500,500);
  frameRate(10);
}

void draw() {
  fill(random(150,255),random(0),random(100,255));
  ellipse(random(width+1),random(height+1),random(10,50),random(10,50));
  fill(random(0),random(100,255),random(160,255));
  rect(random(width+1),random(height+1),random(10,50),random(10,50));
}