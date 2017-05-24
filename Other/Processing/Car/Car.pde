class Car {

  //member variables
  color c;
  float x, y, speed;

  //constructor 
  Car() {
    c = color(random(255),random(255),random(255));
    x = width/2;
    y = random(height);
    speed = random(1,30);
  }

  void draw() {
    background(0);
    display();
    drive();
  }

  //member methods
  //how it looks
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(x, y, 20, 10);
    fill(190);    
    rect(x-5, y-5, 7, 4);
    rect(x-5, y+5, 7, 4);
    rect(x+5, y-5, 7, 4);
    rect(x+5, y+5, 7, 4);
  }

  //what it does
  void drive() {
    x = x + speed;
    if (x > width) {
      x = 0;
    }
  }
}