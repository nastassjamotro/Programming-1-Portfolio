int xspeed, yspeed;
int xpos, ypos, wdth, ht;
void setup() {
  size(400,400);
  background(255);
  xspeed = 3;
  yspeed = 10;
  wdth = 10;
  ht = 10;
  noStroke();
  xpos = width/2;
  ypos = height/2;
  frameRate(60);
}
void draw() {
  background(255);
  fill(0);
  ellipse(xpos,ypos,wdth*2,ht*2);
  xpos += xspeed/2;
  ypos += yspeed/2;
  if (xpos >= width-wdth/2 || xpos <= wdth/2){
    xspeed *= -1;
  }
  if (ypos >= height-ht/2 || ypos <= ht/2) {
    yspeed = yspeed *-1;
  }
}