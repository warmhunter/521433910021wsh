void setup(){
size(600,600);
background(0);

}
 
void draw(){
  background(0);
  drawFont();
drawBackground(width/2,height/2);




}

void drawBackground(float eX,float eY){
float rr=random(0,width/2);
int division=100;
float ang=TWO_PI/division;
for(int i=0;i<division;i++){
  float x=rr*cos(ang*i);
  float y=rr*sin(ang*i);
  float dd=random(50,100);
  fill(map(rr,0,width/2,100,255),190,204,102);
 noStroke();
 ellipse(eX+x,eY+y,dd,dd);
  }
}
void drawFont(){
  PFont font;
  font=loadFont("BodoniMTBlack-Italic-48.vlw");
  textFont(font);
  fill(255,100,100);
  textSize(120);
 // text("WARM",150,300);
  //for(int i=0;i<10;i++){
   //String zitis[]={"w","a","r","m","h","u","n","t","e","r"};
        
        fill(187,149,random(255));text("LOVE",100,320);
        //text(zitis[i],250,320);
 // }
 textSize(50);
  text("peace",random(width),random(height));
  

}
