class Player {
  float x;
  float y;
  float health;
  float grav;
  float speed;
  float floor=10;
  Player() {
     float x;
  float y;
  float health;
  float grav;
  float speed;
  float floor=50;
  } 

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(255-health, health, 0);
    rectMode(CENTER);
    rect(x, y,30, 30);
  }

  void move() {

    if (y < height - floor) {
      grav += 0.1;
    } else {
      grav = 0;
    }
    y += grav;
  }

  void control() {
    if (keyPressed) {
      if (key == 'a') {
        if (x > 0 + speed/2) {
          x -= speed;
        }
      }
      if (key== 'd') {
        if (x < width - speed/2) {
          x += speed;
        }
      }
      if (key == 'w') {
        if (grav == 0) {
          y = y - 1;
          grav = -3;
        }
      }
    }
  }
}
