import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class screensaver_app extends PApplet {

Lines[] myLines = new Lines[20];

public void setup() {
  
  background(0);
  frameRate(20);
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(3,4), random(20,40));
  }
}

public void draw() {
  for(int i=0; i<myLines.length; i++) {
    myLines[i].display();
    if(frameCount>100) {
      background(0);
      //myLines[i].display();
    }
  }
}
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
  public void display() {
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

  public void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      x = startX + i;
    }
  }

  public void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      x = startX - i;
    }
  }

  public void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      y = startY - i;
    }
  }

  public void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      y = startY + i;
    }
  }

  public void moveUpAndRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      x = startX + i;
      y = startY - i;
    }
  }

  public void moveUpAndLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY-i);
      x = startX - i;
      y = startY - i;
    }
  }

  public void moveDownAndRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY+i);
      x = startX + i;
      y = startY + i;
    }
  }

  public void moveDownAndLeft(float startX, float startY, float moveCount) {
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
  public void settings() {  size(displayWidth,displayHeight); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "screensaver_app" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
