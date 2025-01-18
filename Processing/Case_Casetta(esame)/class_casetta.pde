class Casetta extends Casa{
    void update() {
    if (posX < -15) {
      posX = width;
    }
    posX = posX - velX;
  }

  void display() {
    rectMode(CENTER);
    noFill();
    stroke(255);
    rect(posX, posY, 30, 30);
    triangle(posX-20, posY-15, posX+20, posY-15, posX, posY-30);
    fill(255);
    rect(posX, posY+10, 5, 10);
  }
}
