void setup(){
size(800,800);
background(255);
}
void draw(){
  var v=random(5,20);
  if(keyPressed==true){strokeWeight(v);
  stroke(0,100);
  line(pmouseX,pmouseY,mouseX,mouseY);}
  noStroke();
 // fill(0);
 // ellipse(mouseX,mouseY,10,10);
  if (mousePressed) {fill(random(100));ellipse(mouseX,mouseY,15,15);
ellipse(mouseX-15,mouseY-15,15,15);ellipse(mouseX-30,mouseY-30,15,15);ellipse(mouseX-45,mouseY-45,15,15);}
  
}
