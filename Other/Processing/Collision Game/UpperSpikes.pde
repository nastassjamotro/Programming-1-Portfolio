class UpperSpikes {
  int x, y, speed,w;
  boolean upperSpike;
  boolean vis;
  float u;
  color c;

  UpperSpikes(int x, int y, int speed, int w) {
    float u = random(10);
    this.x = x;
    this.y = y;
    if (u>7) {
      upperSpike = true;
      c = color(255, 0, 0);
    } else {
      upperSpike = false;
      noStroke();
      c = color(0, 0, 255);
    }

    this.speed = speed;
    this.w = w;

    vis = true;
  }

  void display() {
    if (vis) {
      stroke(0);
      fill(c);
      triangle(x, y, x+60, y, x+30, y+60);
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
      x = +500;
      y = +500;
    }
    return collide;
  }
}