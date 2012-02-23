Man[] men = new Man[30];
Car car;
BG bg;
JoyStick js;
TextDisplay td;
Health h;
int SCORE = 0;
int TIME = 2400;
int fr = 20;
float Width = 1500;
float Height = 1500;
Boolean notPaused = true;
Boolean begun = false;
void setup(){
  //orientation(PORTRAIT);
  size(240,320);
  frameRate(fr);
  noStroke();
  smooth();
  for(int i = 0; i < men.length; i++){
    if(i % 4 <= 0){
     men[i] = new Man(random(Width -20) + 10,random(Height -20)+10,random(2)+1,random(360), random(2)-1,"3.png",3);
    }else if(i % 10 <= 0){
     men[i] = new Man(random(Width -20) + 10,random(Height -20)+10,random(4)+1,random(360), random(4)-2,"4.png",4);
    }else if (i % 5 <= 0){
     men[i] = new Man(random(Width -20) + 10,random(Height -20)+10,random(1)+1,random(360), random(2)-1,"2.png",2);
    }else{
     men[i] = new Man(random(Width -20) + 10,random(Height -20)+10,random(2)+1,random(360), random(2)-1,"1.png",1);
    }
  }
  car = new Car(width/2,height/2,0,0);
  bg = new BG(20,20,Width,Height);
  js = new JoyStick();
  td = new TextDisplay(80,35,"Score = ");
  h = new Health(5,5,5);
}
void draw(){
  if(begun){
    if(notPaused){
      js.maths();
      bg.display();
      for(int i = 0; i < men.length; i++){
       men[i].display();
      }
      car.display();
      for(int i = 0; i < bg.bs.length; i++){
        bg.bs[i].display2();
      }
      js.display();
      td.display(SCORE,round(TIME/fr));
      h.display();
      if(TIME <= 0){
        win();
      }else{
        TIME --;
      }
   }
  }else{
    notPaused = false;
    fill(255);
    textAlign(CENTER);
    text("PRESS ANY KEY TO START",width/2, height/2);
    begun = true;
  }
}
void mousePressed(){
 js.mPressed();
}

void mouseReleased(){
  js.overjs = false;
  car.speed = 0;
}
void keyPressed(){
  if(notPaused){
    paused();
  }else{
    notPaused = true;
  }
}
//
void paused(){
  notPaused = false;
  fill(255);
  textAlign(CENTER);
  text("PAUSED",width/2, height/2);
}
//
void win(){
  notPaused = false;
  fill(255);
  textAlign(CENTER);
  text("YOUR SCORE IS "+SCORE,width/2, height/2);
  reset();
}
//
void lose(){
  notPaused = false;
  fill(255);
  textAlign(CENTER);
  text("GAME OVER",width/2, height/2);
  reset();
}
//
void reset(){
  for(int i = 0; i < men.length; i++){
    men[i].Live(random(width),height/2 + random(height),random(2)+1,random(360), random(2)-1);
  }
  SCORE = 0;
  bg.xPos = 20;
  bg.yPos = 20;
  h.lifeforce = 5;
  TIME = 2000;
}



