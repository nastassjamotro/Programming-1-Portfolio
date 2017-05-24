// Still working on it. doesn't work

Square sl;
UpperSpikes[] u = new UpperSpikes[1000];
LowerSpikes[] l = new LowerSpikes[1000];
int score;
float hit;
float jump;
int x, y, w, h;

void setup() {
  size(480, 400);
  background(255);
  noCursor();

  score = 0;
  hit = 0;
  jump = 0;
  sl = new Square(40, 260, 80, 80);

  // Populate UpperSpikes
  for (int i=0; i<u.length; i++) {
    u[i] = new UpperSpikes(int(random(-1000, 1000000)), 60, 4, 100);
  }

  // Populate LowerSpikes
  for (int i=0; i<l.length; i++) {
    l[i] = new LowerSpikes(int(random(-1000, 1000000)), 340, 4, 100);
  }
}

void draw() {
  background(255);
  stroke(255);
  fill(0);
  rect(0, 0, 380, 60);
  rect(0, 340, 380, 60);

  // Render UpperSpikes
  for (int i=0; i<u.length; i++) {
    u[i].display();
    u[i].x -= u[i].speed;

    // collision
    //if(u[i].collide(sl.x,sl.w)) {
    //gameOver();
    //}
  }

  // Render LowerSpikes
  for (int i=0; i<l.length; i++) {
    l[i].display();
    l[i].x -= l[i].speed;

    // collision
    if (l[i].collide(sl.x, sl.w)) {
      gameOver();
    }
  }

  sl.display();
  display();
}

void display() {
  fill(0, 255, 0);
  stroke(255);
  strokeWeight(2);
  rect(380, 0, 100, 400);
  fill(0);
  textSize(20);
  text("Jumps:", 390, 20);
  text(jump, 390, 40);
  text("Score:", 390, 100);
  text(score, 390, 120);
}

void gameOver() {
  background(0);
  fill(0);
  rect(0, 0, width, height);
  fill(255);
  textSize(60);
  text("GAME", 20, 60);
  text("OVER", 60, 140);
  textSize(40);
  //text("DEATH BY:", 20, 260);
  //textSize(30);
  //text("spikes", 40, 310);
  textSize(50);
  text("SCORE:"+jump, 20, 330);
  noLoop();
}


void updateScore() {
  jump++;
  score+=random(1, 4);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      sl.jumpUP(1);
    }
    if (keyCode == DOWN) {
      sl.jumpDown(1);
    }
  }
}