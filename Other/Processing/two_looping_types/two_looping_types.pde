//draw horizontal lines
for (int i=0; i<100; i+=10) {
  line(0, i, width, i);
}

//draw vertical lines
int i=0;
while (i<100) {
  stroke(0);
  line(i, 0, i, height);
  stroke(0, 0, 255);
  line(i, 0, height, i);
  line(0, i, i, width);
  i+=10;
}