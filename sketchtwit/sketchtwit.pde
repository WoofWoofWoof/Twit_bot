void setup(){
size(600,300);
background(255);
blendMode(MULTIPLY);

for (int i=0; i<200; i++) {
  float x = random(width);
  float y = random(height);
  
  float r = random(255);
  float g = random(255);
  float b = random(255);
  
  float s = random(50);
  noStroke();
  fill(r,g,b);
  ellipse (x,y,s,s);
  }
  
  save("output.png");
  exit();
}