class LowerSpikes {
  int x, y, speed, w;
  boolean lowerSpike;
  boolean vis;
  float l;
  color c;

  LowerSpikes(int x, int y, int speed, int w) {
    float l = random(10);
    this.x = x;
    this.y = y;
    if (l>7) {
      lowerSpike = true;
      c = color(255, 0, 0);
    } else {
      lowerSpike = false;
      noStroke();
      noFill();
    } 
    
    this.speed = speed;
    this.w = w;

    vis = true;
  }

  void display() {
    if (vis) {
      stroke(0);
      fill(c);
      triangle(x, y, x+60, y, x+30, y-60);
    } else {
      x = -200;
      y = -200;
      speed = 0;
    }
  }

  //Collision shtuff
  boolean collide(int lx, int lw) {
    boolean collide = false;
    if (lx-(lw/2) >= x-(w/2) && 
      lx+(lw/2) <= x+(w/2)  ) {
      vis = false;
      collide = true;
      speed = 0;
      x = -100;
      y = -100;
    }
    return collide;
  }
}