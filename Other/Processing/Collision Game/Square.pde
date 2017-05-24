class Square {
  String name;
  int x, y, w, h, x2, y2;
  int speed;

  Square(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    //this.speed=speed;
    x2 = 0;
    y2 = 0;
  }

  void display() {
    stroke(0);
    fill(255);
    rect(x, y, w, h);
  }

  /*void fire() {
   noStroke();
   for(int i=0; i<150; i++) {
   x2=x;
   y2=y;
   fill(255,0,0);
   ellipse(x+i,y,2,2);
   x2+=i;
   y2+=i;
   }
   }*/

  void jumpUP(int rep) {
    for (int i=0; i<rep*200; i++) {
      rect(x, y-i, w, h);
    }
    y=y-(200*rep);
    //if(millis()>200000 && millis()<300000) {
  }

  void jumpDown(int rep) {
    for (int i=0; i<rep*200; i++) {
      rect(x, y+i, w, h);
    }
    y=y+(200*rep);
  }
}