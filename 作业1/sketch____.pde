int num=100;
Yuan[] yuans=new Yuan[num];
void setup(){
  fullScreen();
  size(600,600);
  for(int i=0;i<num;i++)
    {yuans[i]=new Yuan(random(0,width),random(0,height),random(0,20));}
}
void draw(){
  background(0);
  for(int i=0;i<num;i++)
    {yuans[i].update();
    yuans[i].display();
  
  }
}
class Yuan
{float x,y,r;
  Yuan(float x,float y,float r)
  {this.x=x;
   this.y=y;
   this.r=r;}
 void update()
 {x+=random(-1,1);
 y+=random(-1,1);
 r+=random(-1,1);}
 void display()
 {fill(random(0,59),random(0,121),random(0,209));
 noStroke();
 ellipse(x,y,r,r);}
 }
