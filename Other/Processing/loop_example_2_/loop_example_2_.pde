size(200,200);
background(255);
for(float w=200; w>0; w-=20) {
  stroke(0);
  fill(0+w);
  ellipse(width/2,height/2,w,w);
}