

class Enemy {
  float x;
  float y;
  float xspeed;
  float yspeed;
  float flip;
  Player p;

  Enemy() {
    p = new Player();
    //float x=1;
    //float y=1;
    //float xspeed;
    //float yspeed;
    //float flip;
  }

  void move() {
    xspeed = random(4, 8) + p.speed;
    if (x < 0) {
      flip = 1;
    } else if (x > width) {
      flip = -1;
    }
    x += xspeed * flip;
  }

  void display() {
    fill(255, 0, 0);
    stroke(random(100, 250), 0, 0); 
    triangle(x, y, x-5, y-10, x+5, y-10);
  }
}
