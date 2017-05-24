void setup() {
  size(950,300);
}

void draw() {
  changeToFar(mouseX-100);
  fill(255,0,0);
  rect(50,50,mouseX-50,20);
  drawReference(100,50);
}

void drawReference(int xpos, int ypos) {
  fill(255);
  stroke(200);
  line(xpos-50, ypos, 900, ypos);
  for(int i=0; i<800; i+=50) {
    line(xpos+i,ypos-5,xpos+i,ypos+5);
    text(i,xpos+i-8,ypos-8);
  }
}

float changeToFar(float val) {
  val = (val-32) * 5/9;
  background(0);
  fill(255);
  text("Farenheit value: " + int(mouseX-100),50,100);
  text("Celsius value: " + int(val),50,130);
  return val;
}