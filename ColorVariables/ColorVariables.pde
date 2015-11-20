float h, s, b, Bvar, Svar, hue;
float h1,h2,h3,h4,h5,h6,h7;
color c1, c2, c3, c4, c5, c6, c7;
color s1, s2, s3, s4, s5, s6, s7;
color q1,q2,q3,q4,q5,q6,q7;
float rCoef = 0.299, gCoef = 0.587, bCoef = 0.114;
PFont font;

void preload(){
}

void setup () {
  size(700, 340);
  noStroke();
  colorMode(HSB,360, 100, 100);
  background(0,0,100);
  noLoop();
  font = createFont("ProximaNova-Reg.otf",14);
  getColors();
}

void getColors (){
  
  text ("Search...", 25,25 );
  h = random(360);
  s = random(30,100);
  b = random(60,100);
  
  Bvar = random(-10,40);
  Svar = random(-40,40);
  hue = random(-40,40);
  
  h1 = h+(3*hue);
  h2 = h+(2*hue);
  h3 = h+hue;
  //h4 = h
  h5 = h-hue;
  h6 = h-(2*hue);
  h7 = h-(3*hue);
  
   //interpretaation hue
 if (h1>360){h1 = h1 - 360;}
 if (h2>360){h2 = h2 - 360;}
 if (h3>360){h3 = h3 - 360;}
 if (h5>360){h5 = h5 - 360;}
 if (h6>360){h6 = h6 - 360;}
 if (h7>360){h7 = h7 - 360;}
 if (h1<0){h1 = 360 + h1;}
 if (h2<0){h2 = 360 + h2;}
 if (h3<0){h3 = 360 + h3;}
 if (h5<0){h5 = 360 + h5;}
 if (h6<0){h6 = 360 + h6;}
 if (h7<0){h7 = 360 + h7;}
  
 // color for check
  colorMode(HSB,360, 100, 100);
  c1 = color(h1, s-(3*Svar), 100); 
  c2 = color(h2, s-(2*Svar), 100); 
  c3 = color(h3, s-(Svar), 100); 
  c4 = color(h, s, 100); 
  c5 = color(h5, s+(Svar), 100); 
  c6 = color(h6, s+(2*Svar), 100); 
  c7 = color(h7, s+(3*Svar), 100); 
  
  //true color
  s1 = color(h1, s-(3*Svar), b+(3*Bvar)); 
  s2 = color(h2, s-(2*Svar), b+(2*Bvar)); 
  s3 = color(h3, s-(Svar), b+(Bvar)); 
  s4 = color(h, s, b); 
  s5 = color(h5, s+(Svar), b-(Bvar)); 
  s6 = color(h6, s+(2*Svar), b-(2*Bvar)); 
  s7 = color(h7, s+(3*Svar), b-(3*Bvar));   
  
  checkColors();
}

void checkColors(){
  //brightness
 if (b+(3*Bvar)>100 || b-(3*Bvar)<0) {getColors ();}
 //if (((b+(3*Bvar))- (b-(3*Bvar)))<20) {getColors (); println(((b+(3*Bvar))- (b-(3*Bvar))));}

 //saturation
 if (s+(3*Svar)>100 || s-(3*Svar)<0) {getColors ();}
  
  colorMode (RGB, 255);
  if (red(c1)*rCoef+green(c1)*gCoef+blue(c1)*bCoef < red(c2)*rCoef+green(c2)*gCoef+blue(c2)*bCoef) { getColors ();}
  if (red(c2)*rCoef+green(c2)*gCoef+blue(c2)*bCoef < red(c3)*rCoef+green(c3)*gCoef+blue(c3)*bCoef) { getColors ();}
  if (red(c3)*rCoef+green(c3)*gCoef+blue(c3)*bCoef < red(c4)*rCoef+green(c4)*gCoef+blue(c4)*bCoef) { getColors ();}
  if (red(c4)*rCoef+green(c4)*gCoef+blue(c4)*bCoef < red(c5)*rCoef+green(c5)*gCoef+blue(c5)*bCoef) { getColors ();}
  if (red(c5)*rCoef+green(c5)*gCoef+blue(c5)*bCoef < red(c6)*rCoef+green(c6)*gCoef+blue(c6)*bCoef) { getColors ();}
  if (red(c6)*rCoef+green(c6)*gCoef+blue(c6)*bCoef < red(c7)*rCoef+green(c7)*gCoef+blue(c7)*bCoef) { getColors ();}
   
  if (((red(s1)*rCoef+green(s1)*gCoef+blue(s1)*bCoef) - (red(s7)*rCoef+green(s7)*gCoef+blue(s7)*bCoef))<90) { getColors ();}
  

}

void draw () {

  colorMode(HSB,360, 100, 100);
  background(0,0,100);
  
  fill(s1);
  rect(0, 0, 100, 300);
  
  fill(s2);
  rect(100, 0, 100, 300);
  
  fill(s3);
  rect(200, 0, 100, 300);
  
  fill(s4);
  rect(300, 0, 100, 300);
  
  fill(s5);
  rect(400, 0, 100, 300);
  
  fill(s6);
  rect(500, 0, 100, 300);
  
  fill(s7);
  rect(600, 0, 100, 300); 
  setGradient();
  printHEX();
  
  save("output.png");
  exit();
}

void printHEX(){
  toggleHEX();
  textFont(font);
  fill(q1);
  text ("#"+hex(s1, 6), 20,280 );
  fill(q2);
  text ("#"+hex(s2, 6), 120,280 );
  fill(q3);
  text ("#"+hex(s3, 6), 220,280 );
  fill(q4);
  text ("#"+hex(s4, 6), 320,280 );
  fill(q5);
  text ("#"+hex(s5, 6), 420,280 );
  fill(q6);
  text ("#"+hex(s6, 6), 520,280 );
  fill(q7);
  text ("#"+hex(s7, 6), 620,280 );
  fill(s4);
  text ("@PaletteCLR", 15,323 );
  
}

void toggleHEX(){
  colorMode (RGB, 255);
  if (red(c1)*rCoef+green(c1)*gCoef+blue(c1)*bCoef < 180) { q1=color(255,200);} else {q1=color(0,200);}
  if (red(c2)*rCoef+green(c2)*gCoef+blue(c2)*bCoef < 180) { q2=color(255,200);} else {q2=color(0,200);}
  if (red(c3)*rCoef+green(c3)*gCoef+blue(c3)*bCoef < 180) { q3=color(255,200);} else {q3=color(0,200);}
  if (red(c4)*rCoef+green(c4)*gCoef+blue(c4)*bCoef < 180) { q4=color(255,200);} else {q4=color(0,200);}
  if (red(c5)*rCoef+green(c5)*gCoef+blue(c5)*bCoef < 180) { q5=color(255,200);} else {q5=color(0,200);}
  if (red(c6)*rCoef+green(c6)*gCoef+blue(c6)*bCoef < 180) { q6=color(255,200);} else {q6=color(0,200);}
  if (red(c7)*rCoef+green(c7)*gCoef+blue(c7)*bCoef < 180) { q7=color(255,200);} else {q7=color(0,200);}
  
    println("Contrast " + ((red(s1)*rCoef+green(s1)*gCoef+blue(s1)*bCoef) - (red(s7)*rCoef+green(s7)*gCoef+blue(s7)*bCoef)));
  }

void mousePressed(){
  println("Click");
  getColors();
  redraw();
}
void setGradient(){
  for (int i=0; i<700;i++){
    line(i,300,i,320);
  }
}