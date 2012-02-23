class Car{
  float xPos;
  float yPos;
  float Width;
  float Height;
  float speed;
  float rotation;
  float rotationAcc = 0;
  PImage sprite;
  PImage[] sprites = new PImage[5];
  Car(float _xPos, float _yPos, float _speed, float _rotation){
    xPos = _xPos;
    yPos = _yPos;
    speed = _speed;
    rotation = _rotation;
    Width = 9;
    Height = 22;
    sprite = loadImage("car.png");
    for(int i = 0; i < sprites.length; i++){
        sprites[i] = sprite.get(i*9,0,9,22);
    }
  }
  void display(){
    pushMatrix();
      translate(xPos, yPos);
      rotate(radians(rotation));
      translate(-xPos, -yPos);
      imageMode(CENTER);
      image(sprites[5-h.lifeforce], xPos, yPos);
    popMatrix();
    rotation %= 360;
  }
}
