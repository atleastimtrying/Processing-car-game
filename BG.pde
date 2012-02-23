class BG {
  float tempX;
  float tempY;
  float xPos;
  float yPos;
  float Width;
  float Height;
  PImage bgimage;
  Building[] bs = new Building[100];
  BG(float _xPos, float _yPos, float _Width, float _Height) {
    xPos = _xPos;
    yPos = _yPos;
    Width = _Width + width/2;
    Height = _Height + height/2;
    float yCount = 0;
    float xCount = 0;
    for(int i = 0; i < bs.length; i++){
      bs[i] = new Building(xCount*150,yCount*150,150,150,xPos,yPos);
      if(xCount < 9){
        xCount++;
      }else{
        yCount++;
        xCount = 0;
      }
    }
  }
  void display(){
    background(50);
    rectMode(CORNER);
    fill(0);
    rect(xPos-20, yPos-20, Width - width/2 + 40, Height - height/2 + 40);
    maths();
    for(int i = 0; i < bs.length; i++){
      bs[i].display1(xPos,yPos);
    }
  }
  void maths(){
    tempX = xPos;
    tempY = yPos;
    xPos -= sin(radians(car.rotation))*car.speed;
    yPos += cos(radians(car.rotation))*car.speed;
    if(xPos > width/2){
      xPos = width/2;
    }
    if(yPos > height/2){
      yPos = height/2;
    }
    if(xPos < -Width + width){
       xPos = -Width + width;
    }
    if(yPos < -Height + height){
       yPos = -Height + height;
    }
  }
}
