class SpeedUp {
  float x;
  float y;
  float fillx;
  SpeedUp() {
    float x = 10;
    float y = 10;
  }
  void show() {
    stroke(0);
    fill(fillx); 
    ellipse(x, y, 10, 10);
  }
}
