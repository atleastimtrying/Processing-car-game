class JoyStick{
  float stickX;
  float stickY;
  float speed;
  float radius = 20;
  float centreX;
  float centreY;
  Boolean overjs = false;
  JoyStick(){
    centreX = width - radius*3;
    centreY = height - radius*3;
    stickX = centreX;
    stickY = centreY;
  }
  void display(){
    stroke(255,100);
    strokeWeight(radius/2);
    line(stickX,stickY,centreX,centreY);
    noStroke();
    fill(255,100);
    ellipseMode(CENTER);
    ellipse(stickX, stickY, radius*2,radius*2);
  }
  void maths(){
    if((mousePressed)&&(overjs)){
        stickX = mouseX;
        stickY = mouseY;
    }else{
      stickX = centreX;
      stickY = centreY;
    }
    carController();
  }  
  void carController(){
    if(overjs){
      speed = -dist(stickX,stickY, centreX,centreY)/10;
      if(speed > 10){
        speed = 10;
      }
      if (speed < -10){
        speed = -10;
      }
      car.speed = speed;
      float theX = mouseX - (centreX);
      float theY = mouseY - (centreY);
      float angle = atan2(theY,theX);
      angle = degrees(angle) - 90;
      car.rotation = angle; 
    }   
  }
  void mPressed(){
    if(notPaused){
      if(dist(mouseX,mouseY,centreX,centreY) < radius){
        overjs = true;
      }else{
        overjs = false;
      }
    }
  }
}
