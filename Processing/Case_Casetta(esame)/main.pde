ArrayList<Casa> casa_list;
void setup() {
  size(500, 500);
  casa_list = new ArrayList<Casa>();
}

void draw() {
  background(0);
  for (Casa thisCasa : casa_list) {
    thisCasa.run();
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    casa_list.add(new Casa());
  }
  if (mouseButton == RIGHT) {
    casa_list.add(new Casetta());
  }
}


void keyPressed() {
  if (key=='r') {
    setup();
  }
}
