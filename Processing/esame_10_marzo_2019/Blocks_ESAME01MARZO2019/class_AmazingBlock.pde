class AmazingBlock extends Block{
  int angle;
  AmazingBlock(int w, int h, int posX, int posY){
    super(w, h, posX, posY);
    angle = round(random(0,360));
  }
  void update() {
    if (posX<0 || posX>width) {
      sx = -1*sx;
    }
    posX = posX + sx;
    angle = angle + 5;
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    fill(angle%256, 255-angle%256, 255);
    pushMatrix();
    
    translate(posX,posY);
    rotate(radians(angle));
    rect(0, 0, w, h);
    popMatrix();
  }

  void run() {
    display();
    update();
  }
}
