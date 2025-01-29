class Voto {
  int posX;
  int posY;
  int mark;
  int velX;

  Voto() {
    posX = round(random(15, width-15));
    posY = round(random(15, height-15));
    velX = round(random(2, 10));
    mark = round(random(18, 30));
  }
  void update() {
    if (posX>=width-15 || posX<=15) {
      velX = -velX;
    }
    posX = posX + velX;
    
  }

  void display() {
    stroke(255, 255, 0);
    strokeWeight(4);
    textSize(28);
    text(mark, posX-15, posY+10);
    noFill();
    rectMode(CENTER);
    rect(posX, posY, 30, 30);
  }

  void run() {
    display();
    update();
  }
}
