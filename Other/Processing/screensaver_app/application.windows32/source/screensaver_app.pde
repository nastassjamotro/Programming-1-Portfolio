Lines[] myLines = new Lines[20];

void setup() {
  size(displayWidth,displayHeight);
  background(0);
  frameRate(20);
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(3,4), random(20,40));
  }
}

void draw() {
  for(int i=0; i<myLines.length; i++) {
    myLines[i].display();
    if(frameCount>100) {
      background(0);
      //myLines[i].display();
    }
  }
}