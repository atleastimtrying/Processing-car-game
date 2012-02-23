class TextDisplay{
  float Width;
  float Height;
  String message;
  TextDisplay(float _Width, float _Height, String _message){
    Width = _Width;
    Height = _Height;
    message = _message;
  }
  void display(int SCORE, int TIME){
    if(notPaused){
      fill(255);
      textAlign(LEFT);
      text(message + str(SCORE),width - Width + 5, 5, Width, Height);
      text("Time = " + str(TIME), width - Width + 5, 20, Width, Height);
    }
  }
}
