int xspeed, yspeed;
int xpos, ypos, wdth, ht;
void setup() {
  size(displayWidth,displayHeight);
  background(0);
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
//  background(0);
  fill(255);
  ellipse(width/2,ypos,wdth*2,ht*2);
  xpos += xspeed; //<>//
  ypos += yspeed;
  if (xpos >= width-wdth/2 || xpos <= wdth/2){
    xspeed *= -1;
  }
  if (ypos >= height-ht/2 || ypos <= ht/2) {
    yspeed = yspeed *-1;
  }
  ellipse(xpos,ypos,wdth,ht);
  xpos += xspeed;
  ypos += yspeed;
  if (xpos >= width-wdth/2 || xpos <= wdth/2) {
    xspeed *= -1;
  }
  if (ypos >=height-ht/2 || ypos <=ht/2) {
    yspeed = yspeed *-1;
  }
}