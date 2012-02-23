class Health{
  float x;
  float y;
  int lifeforce;
  int totallife;
  float diameter = 5;
  Health(float _x, float _y, int _lifeforce){
    x = _x;
    y = _y;
    lifeforce = _lifeforce;
    totallife = _lifeforce;
  }
  void display(){
    if(lifeforce <= 0){
      lose();
    }
    textAlign(LEFT);
    text("Health",x, y,100, 20);
    for (int i = 0; i < totallife; i++){
      strokeWeight(2);
      stroke(255);
      noFill();
      ellipse(x + ((i+1)* (diameter+3)) -5, y+20 , diameter, diameter); 
    }
    
    for (int i = 0; i < lifeforce; i++){
      strokeWeight(2);
      fill(255);
      noStroke();
      ellipse(x + ((i+1)* (diameter+3))-5, y+20 , diameter, diameter); 
    }
  }
  void wounded(){
    h.lifeforce --;
    bg.xPos -= sin(radians(car.rotation))* 30;
    bg.yPos += cos(radians(car.rotation))* 30;
    for(int i = 0; i < men.length; i++){
      men[i].display();
    }
    fill(200,0,0,50);
    rect(0,0,width,height);
    mouseReleased();
  }
}
