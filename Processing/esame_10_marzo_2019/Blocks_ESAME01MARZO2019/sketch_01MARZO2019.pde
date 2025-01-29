Block blocco1;
Block blocco2;

void setup() {
  size(256, 512);
  blocco1 = new Block(40, 60, round(random(0, width)), round(random(0, width/2)));
  blocco2 = new AmazingBlock(40, 60, round(random(0, width)), 3*height/4);
}

void draw() {
  background(0);
  blocco1.run();
  blocco2.run();
}

void keyPressed() {
  if(key == 'r' || key == 'R'){
    setup();
  }
}
