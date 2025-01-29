class Block {
  int posX, posY;
  int w, h;
  int sx;

  Block(int w, int h, int posX, int posY) {
    this.w = w;
    this.h = h;
    this.posX = posX;
    this.posY = posY;
    sx = 4;
  }

  void update() {
    if (posX<0 || posX>width) {
      sx*=-1;
    }
    posX = posX + sx;
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    fill(0, 255, 0);
    rect(posX, posY, w, h);
  }

  void run() {
    display();
    update();
  }
}
