class Button {
  // member variables
  color b1, b2, t1, t2; // colors for button
  int x, y, w, h;
  String val;
  Boolean over;
  //constructor
  Button(color b1, int x, int y, int w, int h, String val) {
    this.b1 = b1;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    over = false;
  }
  //display method
  void display() {
    if (over) {
      fill(128);
      rect(x, y, w, h, 4);
      fill(255, 0, 0);
      rect(x-4, y+4, w, h, 4);
      fill(t1);
      text(val, x+5, y+15);
    } else {
      fill(128);
      rect(x, y, w, h, 4);
      fill(b1);
      rect(x-4, y+4, w, h, 4);
      fill(t1);
      text(val, x+5, y+15);
    }
  }
  //hover method
  void hover(int xpos, int ypos) {
    over = xpos>x && xpos<x+w && ypos>y && ypos<y+h;
  }
}