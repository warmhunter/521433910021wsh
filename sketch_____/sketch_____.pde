PFont myfont;
boolean p1=true, p2=false, p3=false;
int flag=0;
float a=0;
boolean start = false;
int gameState;
int n=20;
int k;
float p;
float w=100;
int l=100;
float q;
float e;
float q2;
float e2;
float[]x=new float[n];
float[]y=new float[n];
float[]speed= new float[n];
float[]speed2=new float[n];
ArrayList<Particle> pts;


//food
boolean foodKey =true;
boolean foodKey1 =false;

int foodX;
int foodY;
int i;

int[] xpos = new int[50];
int[] ypos = new int[50];




float r;
float g;
float b;
float z;
int j;
float B;
float speeda=15;
float [] x2 =new float[500];
float [] y2=new float[500];
void ballmove() {
  if (frameCount%200==0) {
    if (k<n-1) {
      k=k+1;
    }
  }
  if (p<45) {
    for (int i = 0; i < k; i++) {

      x[i]+= -speed[i];
      y[i]+= -speed2[i];

      fill(255, 0, 0);
      ellipse(x[i], y[i], 20, 20);
      if (x[i]>=1255)
      {
        speed[i]=-speed[i];
      }
      if (x[i]<=25) {
        speed[i]=-speed[i];
      }

      if (y[i]>=935)
      {
        speed2[i]=-speed2[i];
      }
      if (y[i]<25)
      {
        speed2[i]=-speed2[i];
      }

      move(i);
    }
  }
  if (p>=45) {
    for (int i = 0; i < k; i++) {

      x[i]+= -speed[i];
      y[i]+= -speed2[i];

      fill(r, b, g);
      ellipse(x[i], y[i], 20, 20);
      if (x[i]>=1255)
      {
        speed[i]=-speed[i];
      }
      if (x[i]<=25) {
        speed[i]=-speed[i];
      }

      if (y[i]>=935)
      {
        speed2[i]=-speed2[i];
      }
      if (y[i]<25)
      {
        speed2[i]=-speed2[i];
      }

      move(i);
    }
  }
}


//数据显示
void date() {
  if (p<32) {
    background(#ffffff);
    textSize(32);
    strokeWeight(1);
    stroke(0);
    rect(780, 40, 450, 40);
    rect(780, 40, 320, 40);
    rect(50, 50, 400, 20);
    fill(255, 0, 0);
    rect(50, 50, l*4, 20);
    fill(0, 202, 203);
    //text("Point"+p,50,40 );
    //text("life"+l,250,40);
    rect(780, 40, p*10, 40);
  }
  if (p>=32) {
    background(#ffffff);
    textSize(32);
    strokeWeight(1);
    stroke(0);
    rect(780, 40, 450, 40);
    rect(780, 40, 320, 40);
    rect(50, 50, 400, 20);
    fill(255, 0, 0);
    rect(50, 50, l*4, 20);
    fill(250, 250, 4);
    // text("Point"+p,50,40 );
    //text("life"+l,250,40);
    rect(780, 40, p*10, 40);
  }
  if (p>=45) {
    background(#ffffff);
    textSize(32);
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(780, 40, 450, 40);
    rect(780, 40, 320, 40);
    rect(50, 50, 400, 20);
    rect(1130, 90, 100, 30);
    fill(255, 0, 0);
    rect(50, 50, l*4, 20);//玩家血量
    rect(1130, 90, w, 30);//BOSS血量
    fill(250, 250, 4);
    // text("Point"+p,50,40 );
    //text("life"+l,250,40);
    rect(780, 40, p*10, 40);
  }
}

//鼠标部分
void player() {
  if (p<32) {
    // 按规律移动所有元素xpos[0] = xpos[1], xpos[1] = xpos   [2]，再倒数第二个结束，也就是倒数第二个是倒数第一个的值
    for (int i = 0; i < xpos.length-1; i ++ ) {

      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
    }

    // 更新倒数第一个为鼠标当前位置
    xpos[xpos.length-1] = mouseX;
    ypos[ypos.length-1] = mouseY;

    // 为数组中每一个值绘制图形，颜色和大小都基于i
    for (int i = 0; i < xpos.length; i ++ ) {

      noStroke();
      if (foodKey1==true) {
        fill(100+i*5, 249, 0);
        if (frameCount%70==0) {
          foodKey1=false;
        }
      } else {
        fill(255-i*5, 200, 200);
      }
      ellipse(xpos[i], ypos[i], i, i);
    }
  }

  if (p>=32) {
    for (int i = 0; i < xpos.length-1; i ++ ) {

      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
    }

    // 更新倒数第一个为鼠标当前位置
    xpos[xpos.length-1] = mouseX;
    ypos[ypos.length-1] = mouseY;

    // 为数组中每一个值绘制图形，颜色和大小都基于i
    for (int i = 0; i < xpos.length; i ++ ) {

      noStroke();
      if (foodKey1==true) {
        fill(100+i*5, 249, 0);
        if (frameCount%50==0) {
          foodKey1=false;
        }
      } else {
        fill(255-i*5, 0, 0);
      }
      ellipse(xpos[i], ypos[i], i*2, i*2);
    }
  }
}

//食物判断条件
void food() {
  if (p<32) {
    if (k>1) {
      drawFood(width, height);
      if (dist(mouseX, mouseY, foodX, foodY)<50) {
        p=p+1;
        foodKey = true;
        foodKey1 = true;
      }
    }
  }
}
//扣血判断
void move(int index) {
  if (p<32) {
    for (int i=0; i<k; i++) {
      if (i!=index) {
        float d;
        d=dist(mouseX, mouseY, x[i], y[i]);
        if (d<50) {
          x[index]=x[index]-speed[index];
          y[index]=y[index]-speed2[index];
          l=l-1;
          background(255, 0, 0);
        }
      }
    }
  }

  if (p>=32 && p<45) {

    x[index]=x[index]-speed[index];
    y[index]=y[index]-speed2[index];

    if (x[index]>width-25) {
      speed[index]=-speed[index];
    }
    if (x[index]<25) {
      speed[index]=-speed[index];
    }

    if (y[index]>height-25) {
      speed2[index]=-speed2[index];
    }
    if (y[index]<25) {
      speed2[index]=-speed2[index];
    }

    for (int i=0; i<k; i++) {
      if (i!=index) {
        float d;
        d=dist(mouseX, mouseY, x[index], y[index]);

        if (d<=60) {
          x[index]=9999;
          y[index]=9999;
          speed[index]=-speed[index];
          speed2[index]=-speed2[index];
          p=p+1;
          foodKey1 = true;
        }
      }
    }
  }
  if (p>=45) {
    for (int i=0; i<k; i++) {
      if (i!=index) {
        float d;
        d=dist(mouseX, mouseY, x[i], y[i]);
        if (d<80) {
          x[index]=x[index]-speed[index];
          y[index]=y[index]-speed2[index];
          l=l-1;
          background(255, 0, 0);
        }
      }
    }
  }
}


//绘制食物
void drawFood(int maxWidth, int maxHeight) {
  fill(238, 160, 60);
  if (foodKey) {

    foodX = int( random(0, maxWidth) ) ;
    foodY = int( random(0, maxHeight)) ;
  }
  // rect(foodX, foodY, 20, 20);
  //星星形状
  pushMatrix();
  translate(foodX, foodY);
  rotate(a);
  fill(255);
  fill(#F9F900);
  noStroke();
  strokeWeight(2);
  beginShape();
  vertex(0, -50/2);
  vertex(14/2, -20/2);
  vertex(47/2, -15/2);
  vertex(23/2, 7/2);
  vertex(29/2, 40/2);
  vertex(0, 25/2);
  vertex(-29/2, 40/2);
  vertex(-23/2, 7/2);
  vertex(-47/2, -15/2);
  vertex(-14/2, -20/2);
  endShape(CLOSE);
  a=a+0.05;
  popMatrix();
  foodKey = false;
}
//加载BOSS
void boss() {
  if (p>=45) {
    drawBoss(width, height);
    for (int j=0; j<i; j++) {
      if (dist(mouseX, mouseY, foodX, foodY)<30) {
        l=l-1;
        background(255, 0, 0);
      }
      if (dist(x2[j], y2[j], foodX, foodY)<30) {

        x2[j]=9999;
        y2[j]=9999;
        z=0;
        w=w-10;
        foodKey = false;
      }
      if (frameCount%100==0) {
        foodKey = true;
      }
    }
  }
}

//炮弹2
void attack() {
  for (int j=0; j<i; j++)
  {
    x2[j]=x2[j]+speeda;
    fill(0);
    ellipse(x2[j], y2[j], 20, 20);
  }
}

//BOSS
void drawBoss(int maxWidth, int maxHeight) {
  if (p>=45) {
    fill(238, 160, 60);
    if (foodKey) {

      foodX = int( random(800, 1100) ) ;
      foodY = int( random(20, maxHeight-20)) ;
    }

    //BOSS形状
    pushMatrix();
    translate(foodX, foodY);

    fill(150);
    rect(-15, 0, 5, 40);
    rect(-6.5, 0, 5, 40);
    rect(2.5, 0, 5, 40);
    rect(10, 0, 5, 40);

    fill(z);
    ellipse(0, 0, 60, 60);

    r=random(255);
    g=random(255);
    b=random(255);
    fill(r, g, b);
    ellipse(-17.5, 0, 20, 30);
    ellipse(17.5, 0, 20, 30);
    popMatrix();
    foodKey = false;
    z=255;
  }
}
void text() {
  if (k>=0 && k<4) {
    textSize(32);
    fill(0, 202, 203, 120-20*k);
    text("“eat the star and dodge the red ball”", 360, 320);
  }
  if (p>=32 && p<43) {
    textSize(32);
    fill(139, 0, 0, 180-2*p);
    text("“now your soul is strong enough”", 360, 320);
  }
  if (p>=45 && w>80) {
    textSize(32);
    fill(139, 0, 0, 200-2*p);
    text("“Click the mouse to fire the bullet”", 360, 320);
  }
}


void gameOver() {
  if (w<0) {
    gameState=1;
    background(0);
    textSize(80);
    fill(255);
    textAlign(CENTER);
    text("YOU WIN", width/2, height/2);
    fill(200);
    textSize(20);
    text("Your soul is complete", width/2, height/2 + 50);
  }
  if (l<0 && w>0) {
    gameState=1;
    background(0);
    textSize(80);
    fill(255, 0, 0);
    textAlign(CENTER);
    text("YOU LOST", width/2, height/2);
    fill(200);
    textSize(20);
    text("Your soul is broken", width/2, height/2 + 50);
  }
}

void setup() {
  size(1280, 960);
  myfont=loadFont("Bauhaus93-48.vlw");
  textFont(myfont);
  smooth();
  colorMode(RGB);
  rectMode(CENTER);
  pts = new ArrayList<Particle>();
  noStroke();
  fill(#82ADE5); //blue
  rect(45, 30, 60, 60); 
  fill(#C09FDE);//li zi hua bi
  rect(45, 110, 60, 60);
  fill(255);//white
  rect(45, 190, 60, 60); 
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
  //小球部分
  for (int i = 0; i < x.length; i++) {

    x[i] = random(25, 1255);
    y[i] = random(25, 935);
    speed[i]=10;
    speed2[i]=5;
  }
}
void draw() {
  if (p1) {
    page1();
    drawBackground(width/2, height/2);
  }
  if (p2) {
    page2();
    date();
    attack();
    player();
    ballmove();
    food();
    text();
    boss();
    gameOver();    keyPressed();
  }
  if (p3) {
    page3();
    keyPressed();
  } saveFrame("frames/####.png");
}
class Particle
{
  PVector loc, vel, acc;
  int lifeSpan, passedLife;
  boolean dead;
  float alpha, weight, weightRange, decay, xOfst, yOfst;
  color c;
  
  Particle(float x, float y, float xOfst, float yOfst)
  {
    loc = new PVector(x, y);
    
    float randDegrees = random(360);
    vel = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    vel.mult(random(5));
    
    acc = new PVector(0,0);
    lifeSpan = int(random(30, 90));
    decay = random(0.75, 0.9);
    float q=0;
    
    c = color(random(255),random(255),q);
    weightRange = random(3,50);
    
    this.xOfst = xOfst;
    this.yOfst = yOfst;
  }
  
  void update()
  {
    if(passedLife>=lifeSpan)
    {
      dead = true;
    }else{
      passedLife++;
    }
    
    alpha = float(lifeSpan-passedLife)/lifeSpan * 70+50;
    weight = float(lifeSpan-passedLife)/lifeSpan * weightRange;
    
    acc.set(0,0);
    
    float rn = (noise((loc.x+frameCount+xOfst)*.01, (loc.y+frameCount+yOfst)*.01)-.5)*TWO_PI*4;
    float mag = noise((loc.y-frameCount)*.01, (loc.x-frameCount)*.01);
    PVector dir = new PVector(cos(rn),sin(rn));
    acc.add(dir);
    acc.mult(mag);
    
    float randRn = random(TWO_PI);
    PVector randV = new PVector(cos(randRn), sin(randRn));
    randV.mult(.25);
    acc.add(randV);
    
    vel.add(acc);
    vel.mult(decay);
    vel.limit(3);
    loc.add(vel);
  }
  
  void display()
  {
    strokeWeight(weight+1.5);
    stroke(0, alpha);
    point(loc.x, loc.y);
    
    strokeWeight(weight);
    stroke(c);
    point(loc.x, loc.y);
  }
}
void keyPressed() {
  if(key=='w'){ for (int i=0;i<10;i++)
    {
      Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size());
      pts.add(newP);
    }for (int i=pts.size()-1; i>-1; i--)
  {
    Particle p = pts.get(i);
    if (p.dead)
    {
      pts.remove(i);
    }
    else
    {
      p.update();
       p.display();
    }}
}}
void mousePressed() {
  //if (p1){p1=false;p2=true;}
  //else if (p2){p2=false;p1=true;}
  if (p1) {
    if (mouseX>0 && mouseX<100 && mouseY>0 &&mouseY<100)//p2
    {
      p1=false;
      p2=true;
    }
    if (mouseX>100 && mouseX<200 && mouseY>0 &&mouseY<100)//p2
    {
      p1=false;
      p3=true;
    }
  }//
  else if (p2) {
    if (mouseX>0 && mouseX<100 && mouseY>0 &&mouseY<100)//p2
    {
      p2=false;
      p1=true;
    }
    if (mouseX>100 && mouseX<200 && mouseY>0 &&mouseY<100)//p2
    {
      p2=false;
      p3=true;
    }
  }//
  else if (p3) {
    if (mouseX>0 && mouseX<100 && mouseY>0 &&mouseY<100)//p2
    {
      p3=false;
      p1=true;
    }
    if (mouseX>100 && mouseX<200 && mouseY>0 &&mouseY<100)//p2
    {
      p3=false;
      p2=true;
    }
  }
}
