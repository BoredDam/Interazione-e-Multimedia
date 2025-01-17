class Casa {
  int posX;
  int posY;
  int velX;

  Casa() {
    posX = ceil(random(30, width-30));
    posY = ceil(random(30, height-30));
    velX = round(random(2, 10));
  }

  void update() {
    if (posX > width || posX < 0) {
      velX = -1*velX;
    }
    posX = posX + velX;
  }

  void display() {
    rectMode(CENTER);
    noFill();
    stroke(255, 255, 0);
    rect(posX, posY, 30, 30);
    triangle(posX-20, posY-15, posX+20, posY-15, posX, posY-30);
  }

  void run() {
    update();
    display();
  }
}
