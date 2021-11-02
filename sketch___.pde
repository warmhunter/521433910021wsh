float t,r;
void setup(){
  size(600,600);
  noStroke();
}
void draw(){
  clear();
  t+=.03;
  for(r=0;r<50;r+=PI/2.5)
    f(mouseX,mouseY,r,100);
  saveFrame("frames/####.png");
}
void f(float x,float y,float r,float d){
  if(d>20){
    circle(x+=cos(r)*15,y+=sin(r)*15,d/9);
    f(x,y,r+d*d+t,0.1);
    f(x,y,r-d*d-t,d*.8);
  }
}
