class Lines {
  // class variables
  float x;
  float y;
  float strokeW;
  float pointCount;

  //constructor
  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    x = tempX;
    y = tempY;
    strokeW = tempStroke;
    pointCount = tempLength;
  }

  // display
  void display() {
//    strokeW = random(1, 4);
//    pointCount = random(1,10);
    stroke(random(130,200),random(130,200),random(130,200));
    if (x > width || x < 0 || y > height || y < 0) {
      x = random(width);
      y = random(height);
    } else {
      if (random(100)>80) {
        strokeWeight(strokeW);
        moveRight(x, y, pointCount);
      } else if (random(100)>70) {
        strokeWeight(strokeW);
        moveUp(x, y, pointCount);
      } else if (random(100)>50) {
        strokeWeight(strokeW);
        moveDown(x, y, pointCount);
      } else if (random(100)>40) {
        strokeWeight(strokeW);
        moveLeft(x, y, pointCount);
      } else if (random(100)>75) {
        strokeWeight(strokeW);
        moveUpAndRight(x,y,pointCount);
      } else if (random(100)>40) {
        strokeWeight(strokeW);
        moveUpAndLeft(x,y,pointCount);
      } else if (random(100)>50) {
        strokeWeight(strokeW);
        moveDownAndLeft(x,y,pointCount);
      } else {
        strokeWeight(strokeW);
        moveDownAndRight(x,y,pointCount);
      }
    }
  }

  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      x = startX + i;
    }
  }

  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      x = startX - i;
    }
  }

  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      y = startY - i;
    }
  }

  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      y = startY + i;
    }
  }

  void moveUpAndRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      x = startX + i;
      y = startY - i;
    }
  }

  void moveUpAndLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY-i);
      x = startX - i;
      y = startY - i;
    }
  }

  void moveDownAndRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY+i);
      x = startX + i;
      y = startY + i;
    }
  }

  void moveDownAndLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY+i);
      x = startX - i;
      y = startY + i;
    }
  }
}



//cool pattern
/*  strokeWeight(strokeW);
 moveRight(x, y, pointCount);
 moveUp(x,y,pointCount);
 moveLeft(x, y, pointCount);
 moveLeft(x,y,pointCount);
 moveUp(x,y,pointCount);
 moveRight(x,y,pointCount);
 moveDown(x,y,pointCount);*/