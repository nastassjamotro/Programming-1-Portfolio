void setup() {
  size(400,400);
  background(255);
  frameRate(1);
}

void draw() {
  background(255);
  strokeWeight(8);
  fill(118,81,12);
  ellipse(200,150,random(width*0.7,width*0.88),random(height*0.85,height*0.96));
  fill(234,201,116);
  ellipse(width/2,height/2,random(width*0.6,width*0.85),random(height*0.78,height*0.989));
  fill(255);
  ellipse(width/3,height/2.75,random(40,70),random(60,80));
  ellipse(265,height/2.75,random(30,60),random(70,90));
  fill(0);
  ellipse(width/3,height/2.75,random(10,30),random(10,35));
  ellipse(265,height/2.75,random(5,20),random(20,30));
  stroke(0);
  line(random(width/3,width/3+20),random(270,320),random(265,310),random(250,280));
  line(width/2,height/2-25,width/2+35,height/2+20);
  line(width/2+35,height/2+20,width/2+10,height/2+35);
}