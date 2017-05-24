class Button {
  // Class variables
  color b1, b2, b3, t1, t2;
  boolean isNumber;
  boolean isSpecial;
  boolean isOperator;
  int numButtonVal;
  String opButtonVal;
  String spButtonVal;
  float x, y;
  //int boxSize = 60;
  int w = 60, h = 60;
  boolean over = false;
/*  boolean asShapeZero= false;
  boolean asShapeOne= false;
  boolean asShapeTwo= false;
  boolean asShapeThree= false;
  boolean asShapeFour= false;
  boolean asShapeFive= false;
  boolean asShapeSix= false;
  boolean asShapeSeven= false;
  boolean asShapeEight= false;
  boolean asShapeNine= false;*/

  // Constructor
  Button(float x, float y) {
    this.x = x;
    this.y = y;
  }

  // Constructor for number buttons
  Button asNumber( int numButtonVal, int w, int h, color b2) {
    this.numButtonVal = numButtonVal;
    this.w = w;
    this.h = h;
    this.b2 = b2;
    return this;
  }

  // Constructor for operator buttons
  Button asOperator(String opButtonVal, int w, int h, color b1) {
    this.opButtonVal = opButtonVal;
    this.w = w;
    this.h = h;
    this.b1 = b1;
    isOperator = true;
    return this;
  }

  // Constructor for special buttons
  Button asSpecial(String spButtonVal, int w, int h) {
    this.spButtonVal = spButtonVal;
    this.w = w;
    this.h = h;
    isSpecial = true;
    return this;
  }

  // Draw the button on the canvas
  void display() {
    if (isSpecial) {
      fill(b3);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h, 10);
      fill(b3);
      rect(x-2, y+2, w, h, 10);
      fill(255);
      textSize(15);
      text(spButtonVal, x+20, y+40);
    } else if (isOperator) {
      fill(b3);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h, 10);
      fill(b3);
      rect(x-2, y+2, w, h, 10);
      fill(255);
      textSize(24);
      text(opButtonVal, x+15, y+40);
    } else if (numButtonVal == 0) {
      numberZero();
    } else if (numButtonVal == 1) {
      numberOne();
    } else if (numButtonVal == 2) {
      numberTwo();
    } else if (numButtonVal == 3) {
      numberThree();
    } else if (numButtonVal == 4) {
      numberFour();
    } else if (numButtonVal == 5) {
      numberFive();
    } else if (numButtonVal == 6) {
      numberSix();
    } else if (numButtonVal == 7) {
      numberSeven();
    } else if (numButtonVal == 8) {
      numberEight();
    } else if (numButtonVal == 9) {
      numberNine();
    }
  }

  void numberZero() {
    noStroke();
    fill(0, 0, 255);
    ellipse(x, y, w, h);
    noFill();
    stroke(0, 0, 255);
    strokeWeight(8.5);
    arc(x, y+23, w+34, h+54, -PI, PI);
  }

  void numberOne() {
    noStroke();
    fill(0, 0, 255);
    ellipse(x, y, w, h);
    rect(x-3.5, y, w-3, h+35);
    ellipse(x-20, y+15, w-3, h-3);
    quad(x-6, y-4, x-26, y+15, x-19, y+20, x+6, y-4);
    ellipse(x-20, y+50, w-4, h-4);
    ellipse(x+20, y+50, w-4, h-4);
    rect(x-20, y+46, w+30, h-4);
  }

  void numberEight() {
    noFill();
    stroke(0, 0, 255);
    strokeWeight(6.5);
    arc(x, y, w, h, -PI, PI);
    arc(x, y+28, w+5, h+10, -PI, PI);
  } 

  void numberSeven() {
    fill(0, 0, 255);
    noStroke();
    ellipse(x-35, y, w, h);
    ellipse(x, y, w, h);
    rect(x-35, y-5, w+25, h);
    ellipse(x-25, y+50, w, h);
    quad(x-28, y+45, x-2, y-5, x+3, y+4, x-22, y+53);
  } 

  void numberNine() {
    noStroke();
    fill(0, 0, 255);
    ellipse(x, y, w, h);
    ellipse(x, y+48, w, h);
    rect(x-4, y, w-2, h+35);
    noFill();
    stroke(0, 0, 255);
    strokeWeight(7);
    arc(x-15, y+10, w+15, h+15, -PI, PI);
  }

  void numberFour() {
    noStroke();
    fill(0, 0, 255);
    ellipse(x, y, w, h);
    ellipse(x, y+50, w-2, h-2);
    rect(x-4, y, w-3, h+35);
    ellipse(x-30, y+25, w-4, h-4);
    quad(x-5, y-4, x-32, y+20, x-26, y+27, x+4, y);
    ellipse(x+5, y+25, w-2, h-2);
    rect(x-30, y+21, w+27, h-3);
  }

  void numberThree() {
    smooth();
    noStroke();
    noFill();
    rect(x, y, w, h);
    stroke(0, 0, 255);
    strokeWeight(9);
    arc(x-3, y-12, w-29, h-38, -PI/2, PI/2);
    arc(x-3, y+10, w-29, h-38, -PI/2, PI/2);
  } 

  void numberTwo() {
    noStroke();
    noFill();
    rect(x, y, w, h);
    stroke(0, 0, 255);
    strokeWeight(8);
    arc(x, y, w-30, h-35, -PI, PI/3.5);
    noStroke();
    fill(0, 0, 255);
    ellipse(x-15, y+38, w-51, h-51);
    ellipse(x+15, y+38, w-51, h-51);
    rect(x-15, y+34, w-30, h-52);
    quad(x+7, y+7, x-17, y+35, x-8, y+35, x+12, y+12);
  }

  void numberFive() {
    noStroke();
    noFill();
    rect(x, y, w, h);
    stroke(0, 0, 255);
    strokeWeight(8);
    arc(x-3, y+15, w-22, h-32, -PI/2, PI/2);
    noStroke();
    fill(0, 0, 255);
    ellipse(x-3, y-20, w-51, h-51);
    ellipse(x+18, y-20, w-51, h-51);
    rect(x-7, y-22, w-52, h-37);
    rect(x-7, y-24, w-35, h-52);
  }

  void numberSix() {
    noStroke();
    noFill();
    rect(100, 100, 60, 60);
    stroke(0, 0, 255);
    strokeWeight(8);
    arc(x+5, y, w-40, h-10, PI/2, 5*PI/2.9);
    arc(x+9, y+15, w-40, h-38, -PI, PI);
  }

  // Handle mouse actions
  void click() {
    over = mouseX > x-25 && mouseX < x+45 && mouseY > y-5 && mouseY < y+60;
  }
}