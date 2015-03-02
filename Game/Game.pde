import processing.sound.*;

Player p;
SpeedUp s;
Enemy e;

boolean gameover = false;
float r = 255;
float g = 255;
float b = 255;
float floor = 20;

float currentAmp = 0;
float previousAmp=0;
int xmove = 0;

SoundFile file;

Amplitude amp;

void setup() {
  size(1000, 600); 
  smooth();

  file = new SoundFile(this, "song.mp3");
  file.play();

  amp = new Amplitude(this);

  amp.input(file);

  s = new SpeedUp();
  p = new Player();
  e = new Enemy();

  p.x=width/2;
  p.y=height/2;
  p.health=255;
  p.speed = 1;
  p.floor=20;
  s.x=100;
  s.y=height-floor;
  e.x=width/2;
  e.y=height-5-floor;
  e.flip=1;
}

void draw() {
  background(r, g, b);
println(e.xspeed);
  currentAmp = amp.analyze() * 500;
  stroke(0);
  strokeWeight(3);
  line(xmove, 2.5*height/4 - currentAmp, xmove-1, 2.5*height/4-previousAmp);

  if (gameover == false) {
    p.control();
    p.move();
    p.display();
    s.show();
    e.move();
    e.display();

    p.speed -= p.speed/2500;

    xmove += 2;

if(currentAmp > 1.5*previousAmp + 50) {
 r = random(255);
 g = random(255);
 b = random(255);
}

    if (xmove > width) {
      xmove = 0;
    }

    if (p.x > s.x - 20 && p.x < s.x + 20 && p.y > s.y - 20  && p.y < s.y + 20) {
      p.speed += 5/p.speed;
      s.x = random(0, width);
      s.y = random(height - 45-floor, height-floor);
    s.fillx = random(255);
    }

    if (p.x > e.x - 20 && p.x < e.x + 20 && p.y > e.y - 20  && p.y < e.y + 20) {
      e.x=random(width);
      background(255, 0, 0);
      p.health -= 20;
      p.y=height/2-floor;
      if (p.health < 0) {
        gameover = true;
      }
    }
    fill(0);
    text(p.speed, 0, 10);
    previousAmp = amp.analyze() * 500;
  } else if (gameover == true) {

    textSize(width/10);
    background(50, 40, 30);
    fill(0);
    stroke(255);
    textAlign(CENTER);
    text("Game Over", width/2, height/2);
    p.y=height-floor;
    p.display();
    e.display();
    s.show();
    file.stop();
  }
}
