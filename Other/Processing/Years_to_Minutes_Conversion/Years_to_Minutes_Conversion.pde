void setup() {
  size(900,300);
}

void draw() {
  textSize(12.5);
  yearsToMinutes(mouseX-100);
  fill(0);
  rect(100,160,mouseX-100,20);
  drawReference(100,150);
  fill(255);
  textSize(20);
  text("Years to Minutes Conversion",width/2-140,25);
  textSize(14);
  text("By: Nastassja Motro",width/2-80,50);
  text("Slide the mouse along the screen to see how many minutes are in a certain number of years", 140,75);
}

void drawReference(int x, int y) {
  fill(255);
  line(x-150,y,900,y);
  for(int i=-50; i<800; i+=50) {
    stroke(255);
    line(x+i,y-5,x+i,y+5);
    text(i,x+i-7,y-8);
  }
}

float yearsToMinutes(float val) {
  val = val*365*24*60;
  background(0,0,255);
  fill(255);
  text("Years: " + int(mouseX-100),100,220);
  text("Minutes: " + int(val), 100,240);
  return val;
}