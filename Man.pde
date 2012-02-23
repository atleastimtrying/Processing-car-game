class Man{
  boolean isAlive = true;
  float xPos;
  float yPos;
  float speed;
  float rotation;
  float rotationAcc;
  float pointvalue;
  
  int animcount = 0;
  int resurrection = 0;
  
  PImage sprite;
  PImage[] mananim = new PImage[13];
  color C;
  Man(float _xPos, float _yPos, float _speed, float _rotation, float _rotationAcc, String _spritesrc, float _pointvalue){
    xPos = _xPos;
    yPos = _yPos;
    speed = _speed;
    rotation = _rotation;
    rotationAcc = _rotationAcc;
    sprite = loadImage(_spritesrc);
    pointvalue = _pointvalue;
    for(int i = 0; i < mananim.length; i++){
        mananim[i] = sprite.get(i*10,0,10,10);
    }
  }
  void display(){
    pushMatrix();
      translate(xPos, yPos);
      rotate(radians(rotation + 180));
      translate(-xPos, -yPos);
      imageMode(CENTER);
      image(mananim[animcount], xPos, yPos);
    popMatrix();
    rotation += rotationAcc;
    if((rotation == 360)||(rotation == -360)){
      rotation = 0;
      rotationAcc *= -random(1)-0.5;
    }
    xPos -= sin(radians(rotation))*speed;      
    yPos += cos(radians(rotation))*speed;
    xPos += bg.xPos - bg.tempX;
    yPos += bg.yPos - bg.tempY;
    if(isAlive){
      maths();
    }else{
      deadMaths();
    }    
  }
  void maths(){
    // hit detection with THE car
    if ((xPos > car.xPos - car.Width/2)&&(yPos > car.yPos - car.Height/2)&&(xPos < car.xPos + car.Width/2)&&(yPos < car.yPos + car.Height/2)){
      speed = 0;
      rotationAcc = 0;
      animcount = 12;
      SCORE ++;
      isAlive = false;
    }else{
      if(animcount < 11){
        animcount++;
      }else{
        animcount = 0;
      }
    }
    // contains the man within bg
    if(xPos <= bg.xPos){
      xPos = bg.xPos +1;
      rotation += 180;
    }
    if(xPos >= bg.xPos + bg.Width - (width/2)){
      xPos = bg.xPos + bg.Width -(width/2);
      rotation += 180;
    }
    if(yPos <= bg.yPos){
      yPos = bg.yPos + 1;
      rotation += 180;
    }
    if(yPos >= bg.Height + bg.yPos - (height/2)){
      yPos = bg.Height + bg.yPos  - (height/2);
      rotation += 180;
    }
  }
  void deadMaths(){
    if (resurrection > 180){
      Live(xPos,yPos,random(2)+1,random(360), random(2)-1);
    }else{
      resurrection ++;
    }
  }
  void Live(float _xPos, float _yPos, float _speed, float _rotation, float _rotationAcc){
    xPos = _xPos;
    yPos = _yPos;
    speed = _speed;
    rotation = _rotation;
    rotationAcc = _rotationAcc;
    animcount = 0;
    resurrection = 0;
    isAlive = true;
  }
}
