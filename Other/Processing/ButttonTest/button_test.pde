void setup() {
  size(500,500);
}

void draw() {
  button(200,200,100,30,"Numero Dos");
  button(200,250,100,30,"Numero Tres");
  button(200,150,100,30,"Numero Uno");
}

void button(int x,int y,int w, int h, String bt ) {
  // bottom rect
  noStroke();
  fill(128);
  rect(x+3,y+3,w,h,10);
  
  // top rect
  stroke(0);
  fill(220);
  rect(x,y,w,h,10);
  
  //render text
  fill(0,0,255);
  text(bt,x+10,y+20);
}