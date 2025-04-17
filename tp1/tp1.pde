PImage img;

void setup(){
  size(800, 400);
  background(113, 90, 66);
  //Fondo Puerta
  strokeWeight(5);
  stroke(77,61,45);
  line(440,50, 760,50);
  line(440,180, 760,180);
  line(440,300, 760,300);
  line(440,0, 440,400);
  line(760,0, 760,400);
  strokeWeight(1);
  fill(200);
  ellipse(740,260,10,10);
  ellipse(783,397,20,20);
  fill(100);
  ellipse(740,260,3,3);
  
  
  img = loadImage("retrato.jpeg");  
  
}

void draw(){
  image(img, -25, -100, 425, 725);
  
  //Pelo
  noStroke();
  fill(0,0,0);
  ellipse(600, 125, 127, 120);
  
  //Orejas
  fill(245,220,195);
  stroke(0);
  ellipse(550,150, 27,40);
  ellipse(650,150, 27,40);
  
  //Cabeza
  noStroke();
  fill(242,234,210);
  ellipse(600, 140, 120, 120);
  quad(540,150, 555,200, 645,200, 660,150);
  //Cuello
  rect(570,210,60,80);
  stroke(1);
  //Menton
  arc(600, 195, 96, 40, 0, PI); 
  
  //Cejas
  fill(0);
  arc(577, 115, 30, 10, PI, TWO_PI, CHORD);
  arc(623, 115, 30, 10, PI, TWO_PI, CHORD);
  //Ojos
  fill(255);
  ellipse(577, 125, 22, 11);
  ellipse(623, 125, 22, 11);
  fill(0);
  ellipse(577, 125, 10, 9);
  ellipse(623, 125, 10, 9);
  
  
  //Nariz
  fill(245,200,175);
  noStroke();
  quad(600, 125, 610,160, 600,170, 590,160);
  
  //Boca
  noStroke();
  fill(232, 169, 180);
  arc(600, 185, 40, 15, 0, PI, CHORD);
  arc(600, 185, 40, 10, PI, TWO_PI, CHORD);
  
  stroke(242,113,136);
  line(583,185, 617,185);
  
  
  //Cuerpo y Ropa
  noStroke();
  
  
  fill(116,140,160);
  rect(475,240, 250,400, 50, 50, 0, 0);
  
  fill(242,234,210);
  arc(600, 240, 75, 40, 0, PI, CHORD);
  
  stroke(0);
  line(525,300, 520,400);
  line(675,300, 680,400);
  
  fill(255);
  stroke(255,255,255);
  strokeWeight(5);
  line(600,260, 600,400);
  strokeWeight(1);
  stroke(0,0,0);
  fill(200);
  rect(598,260,4,10);
  
}
