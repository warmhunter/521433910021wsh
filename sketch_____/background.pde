void drawBackground(float eX,float eY){
float rr=random(0,width/2);
int division=100;
float ang=TWO_PI/division;
for(int i=0;i<division;i++){
  float x=rr*cos(ang*i);
  float y=rr*sin(ang*i);
  float dd=random(50,100);
  fill(map(rr,0,width/2,-47,252),113,-25,110);
 noStroke();
 ellipse(eX+x,eY+y,dd,dd);
  }
}
