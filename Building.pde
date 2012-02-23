class Building{
  float xPos;
  float yPos;
  float Width;
  float Height;
  float internalW = random(50)+50;
  float internalH = random(50)+50;
  float internalX;
  float internalY;
  float parentX;
  float parentY;
  color C;
  Building(float _xPos, float _yPos, float _Width, float _Height, float _parentX, float _parentY){
    xPos = _xPos;
    yPos = _yPos;
    parentX = _parentX;
    parentY = _parentY;    
    Width = _Width;
    Height = _Height;
    internalX = random(Width - internalW);
    internalY = random(Height - internalH) ;
    C = color(random(25) + 25);
    for(int i = 0; i < men.length; i++){
      if((men[i].xPos > parentX + xPos)&&(men[i].xPos < parentX + xPos + Width)&&(men[i].yPos > parentY + yPos)&&(men[i].yPos < parentY + yPos + Height)){
        men[i].xPos = parentX + xPos + Width + 1;
      }
    }
  }
  void display1(float _parentX, float _parentY){
    parentX = _parentX;
    parentY = _parentY;
    noStroke();
    fill(100,190,100);
    rectMode(CORNER);
    rect(parentX + xPos, parentY + yPos,Width,Height);
  }
  void display2(){
    stroke(0);
    strokeWeight(3);
    fill(C);
    rectMode(CORNER);
    rect(parentX + xPos + internalX, parentY + yPos + internalY,internalW,internalH);
    maths();
  }
  void maths(){
    if((car.xPos > parentX + xPos + internalX)&&(car.xPos < parentX + xPos + internalX + internalW)&&(car.yPos > parentY + yPos + internalY)&&(car.yPos < parentY + yPos + internalY + internalH)){
     h.wounded();
    }
    for(int i = 0; i < men.length; i++){
      if((men[i].xPos > parentX + xPos + internalX)&&(men[i].xPos < parentX + xPos + internalX + internalW)&&(men[i].yPos > parentY + yPos + internalY)&&(men[i].yPos < parentY + yPos + internalY + internalH)){
        men[i].rotation += 180;
      }
    }
  }
}
