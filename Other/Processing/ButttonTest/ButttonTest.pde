Button b1;

void setup() {
  size(300, 300);
  b1 = new Button(color(200), 100, 100, 50, 50, "Test");
}

void draw() {
  b1.display();
  b1.hover(mouseX, mouseY);
}