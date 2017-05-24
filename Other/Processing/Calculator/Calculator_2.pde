// Instantiate each of the classification of buttons
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[14];
Button[] spButtons = new Button[1];

String displayVal = "0";
String valToCompute = ""; // string value left of operator
String valToCompute2 = ""; // string value right of operator
float valToComputeI = 0; // float value left of operator
float valToComputeI2 = 0; // float value right of operator
float result = 0;
char opVal;
boolean firstNum;
color b2, b1, b3;
color d1, d2;
int y_axis = 1;
int x_axis = 2;
String opValue;
boolean on1, on2;

void setup() {
  size(420, 560);
  background(255);
  frameRate(10);
  noFill();
  strokeWeight(3);
  stroke(200);
  rect(0, 0, 420, 560);
  b2 = color(0, 0, 255);
  b1 = color(0);
  b3 = color(23, 209, 255);
  d1 = color(62, 241, 255);
  d2 = color(103, 104, 255);

  // Populate number buttons
  numButtons[0] = new Button(130, 485).asNumber(0, 1, 1, b2);
  numButtons[1] = new Button(130, 405).asNumber(1, 12, 12, b2);
  numButtons[2] = new Button(210, 418).asNumber(2, 60, 60, b2);
  numButtons[3] = new Button(290, 430).asNumber(3, 60, 60, b2);
  numButtons[4] = new Button(140, 325).asNumber(4, 12, 12, b2);
  numButtons[5] = new Button(205, 347).asNumber(5, 60, 60, b2);
  numButtons[6] = new Button(285, 350).asNumber(6, 60, 60, b2);
  numButtons[7] = new Button(150, 245).asNumber(7, 10, 10, b2);
  numButtons[8] = new Button(210, 253).asNumber(8, 20, 20, b2);
  numButtons[9] = new Button(300, 248).asNumber(9, 10, 10, b2);

  // Populate operators
  opButtons[0] = new Button(340, 480).asOperator(" =", 60, 60, b1);
  opButtons[1] = new Button(340, 400).asOperator(" +", 60, 60, b1);
  opButtons[2] = new Button(340, 320).asOperator(" -", 60, 60, b1);
  opButtons[3] = new Button(340, 240).asOperator(" x", 60, 60, b1);
  opButtons[4] = new Button(340, 160).asOperator(" ÷", 60, 60, b1);
  opButtons[5] = new Button(20, 160).asOperator(" C", 60, 60, b1);
  opButtons[6] = new Button(260, 480).asOperator("(-)", 60, 60, b1);
  opButtons[7] = new Button(20, 240).asOperator("x²", 60, 60, b1);
  opButtons[8] = new Button(20, 320).asOperator("√x", 60, 60, b1);
  opButtons[9] = new Button(260, 160).asOperator("tan", 60, 60, b1);
  opButtons[10] = new Button(20, 480).asOperator("log", 60, 60, b1);
  opButtons[11] = new Button(100, 160).asOperator("sin", 60, 60, b1);
  opButtons[12] = new Button(20, 400).asOperator(" ^", 60, 60, b1);
  opButtons[13] = new Button(180, 160).asOperator("cos", 60, 60, b1);


  // Populate special buttons
  spButtons[0] = new Button(180, 480).asSpecial(" .", 60, 60);

  // Set the initial value of first num to true
  firstNum = true;
}

void draw() {
  //Calculator Gradient
  setGradient(0, 0, 420, 560, d1, d2, x_axis);

  //Draw number buttons
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].click();
  }

  //Draw Operator Buttons
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].click();
  }

  // Draw Special Buttons
  for (int i=0; i<spButtons.length; i++) {
    spButtons[i].display();
    spButtons[i].click();
  }
  updateDisplay();
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].click();
    if (numButtons[i].over) {
      if (firstNum) {
        println(i + " " + numButtons[i].numButtonVal);
        valToCompute += int(numButtons[i].numButtonVal);
        displayVal = valToCompute;
      } else {
        valToCompute2 += int(numButtons[i].numButtonVal);
        displayVal = valToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].click();
    if (opButtons[i].over) {
      if (opButtons[i].opButtonVal == " +") {
        if ( result !=0) {
          opVal = '+';
          opValue = "+";
          valToCompute2 = "";
          firstNum = false;
          displayVal = "+";
        } else {
          opVal = '+';
          opValue = "+";
          firstNum = false;
          displayVal = "+";
        }
      } else if (opButtons[i].opButtonVal == " =") {
        // Perform calculation
        firstNum = true;
        performCalc();
      } else if (opButtons[i].opButtonVal == " -") {
        if (result !=0) {
          opVal = '-';
          opValue = "-";
          valToCompute2 = "-";
          firstNum = false;
          displayVal = "-";
        } else {
          opVal = '-';
          opValue = "-";
          firstNum = false;
          displayVal = "-";
        }
      } else if (opButtons[i].opButtonVal == " x") {
        if (result !=0) {
          opVal = 'x';
          opValue = "x";
          valToCompute2 = "x";
          firstNum = false;
          displayVal = "x";
        } else {
          opVal = 'x';
          opValue = "x";
          firstNum = false;
          displayVal = "x";
        }
      } else if (opButtons[i].opButtonVal == " ÷") {
        if (result !=0) {
          opVal = '÷';
          opValue = "÷";
          valToCompute2 = "÷";
          firstNum = false;
          displayVal = "÷";
        } else {
          opVal = '÷';
          opValue = "÷";
          firstNum = false;
          displayVal = "÷";
        }
      } else if (opButtons[i].opButtonVal == " C") {
        displayVal = "0";
        opVal = 'C';
        opValue = "C";
        valToCompute = "";
        valToCompute2 = "";
        valToComputeI = 0;
        valToComputeI2 = 0;
        result = 0;
        firstNum = true;
      } else if (opButtons[i].opButtonVal == "(-)") {
        opVal = 'n';
        performCalc();
      } else if (opButtons[i].opButtonVal == "x²") {
        if (result !=0) {
          opVal = '²';
          opValue = "²";
          valToCompute2 = " ²";
          firstNum = false;
          displayVal = " ²";
        } else {
          opVal = '²';
          opValue = "²";
          firstNum = false;
          displayVal = " ²";
        }
      } else if (opButtons[i].opButtonVal == "√x") {
        if (result !=0) {
          opVal = '√';
          opValue = "√";
          valToCompute = "√"; 
          firstNum = false;
          displayVal = "√";
        } else {
          opVal = '√';
          opValue = "√";
          firstNum = false;
          displayVal = "√";
        }
      } else if (opButtons[i].opButtonVal == "log") {
        if (result !=0) {
          opVal = 'l';
          opValue = "log";
          valToCompute2 = "log";
          firstNum = false;
          displayVal = "log";
        } else {
          opVal = 'l';
          opValue = "log";
          firstNum = false;
          displayVal = "log";
        }
      } else if (opButtons[i].opButtonVal == " ^") {
        if (result !=0) {
          opVal = '^';
          opValue = "^";
          valToCompute2 = "^";
          firstNum = false;
          displayVal = "^";
        } else {
          opVal = '^';
          opValue = "^";
          firstNum = false;
          displayVal = "^";
        }
      } else if (opButtons[i].opButtonVal == "tan") {
        if (result !=0) {
          opVal = 't';
          opValue = "tan";
          valToCompute = "tan";
          firstNum = false;
          displayVal = "tan";
        } else {
          opVal = 't';
          opValue = "tan";
          firstNum = false;
          displayVal = "tan";
        }
      } else if (opButtons[i].opButtonVal == "sin") {
        if (result !=0) {
          opVal = 's';
          opValue = "sin";
          valToCompute = "sin";
          firstNum = false;
          displayVal = "sin";
        } else {
          opVal = 's';
          opValue = "sin";
          firstNum = false;
          displayVal = "sin";
        }
      } else if (opButtons[i].opButtonVal == "cos") {
        if (result !=0) {
          opVal = 'c';
          opValue = "cos";
          valToCompute = "cos";
          firstNum = false;
          displayVal = "cos";
        } else {
          opVal = 'c';
          opValue = "cos";
          firstNum = false;
          displayVal = "cos";
        }
      }
    }
  }
  for (int i=0; i<spButtons.length; i++) {
    spButtons[i].click();
    if (spButtons[i].over) {
      if (spButtons[i].spButtonVal == " .") {
        // concantenate the values clicked on
        if (spButtons[i].over && firstNum == true) {
          valToCompute += spButtons[i].spButtonVal;
          displayVal = valToCompute;
        } else if (spButtons[i].over && firstNum == false) {
          valToCompute2 += spButtons[i].spButtonVal;
          displayVal = valToCompute2;
        }
      }
    }
  }
}


void performCalc() {
  // set string values to integers
  valToComputeI = float(valToCompute);
  valToComputeI2 = float(valToCompute2);

  //perform calculation based on the appropriate operator
  if (opVal == '+') {
    result = valToComputeI + valToComputeI2;
    displayVal = str(result);
  } else if (opVal == '-') {
    result = valToComputeI - valToComputeI2;
    displayVal = str(result);
  } else if (opVal == 'x') {
    result = valToComputeI * valToComputeI2;
    displayVal = str(result);
  } else if (opVal == '÷') {
    result = valToComputeI / valToComputeI2;
    displayVal = str(result);
  } else if (opVal == 'n') {
    if (firstNum) {
      valToComputeI = valToComputeI*-1;
      displayVal = str(valToComputeI);
    } else {
      valToComputeI2 = valToComputeI2*-1;
      displayVal = str(valToComputeI);
    }
  } else if (opVal == '²') {
    result = valToComputeI * valToComputeI;
    displayVal = str(result);
  } else if (opVal =='√') {
    result = sqrt(valToComputeI2);
    displayVal = str(result);
  } else if (opVal == 'l') {
    result = log(valToComputeI2);
    displayVal = str(result);
  } else if (opVal == '^') {
    result = pow(valToComputeI, valToComputeI2);
    displayVal = str(result);
  } else if (opVal == 't') {
    result = tan(radians(valToComputeI2));
    displayVal = str(result);
  } else if (opVal == 's') {
    result = sin(radians(valToComputeI2));
    displayVal = str(result);
  } else if (opVal == 'c') {
    result = cos(radians(valToComputeI2));
    displayVal = str(result);
  }

  //let = work multiple times
  if (firstNum) {
    valToCompute = displayVal;
  } else {
    valToCompute = displayVal;
    valToCompute2 = "";
  }
}

void updateDisplay() {
  fill(255, 255, 255);
  rect(20, 20, 380, 120, 5);
  fill(0);
  textSize(25);
  if (firstNum) {
    text(displayVal, 40, 30, 360, 120);
  } else {
    text(valToCompute + "" + opValue + "" + valToCompute2, 40, 30, 360, 120);
  }
}

void setGradient(int x, int y, float w, float h, color d1, color d2, int axis) {
  noFill();
  if (axis == y_axis) {
    for (int i = y; i<=y+h; i++) {
      float inter = map(i, y, h, 0, 1);
      color c = lerpColor(d1, d2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  } else if (axis == x_axis) {
    for (int i=x; i<=x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(d1, d2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}