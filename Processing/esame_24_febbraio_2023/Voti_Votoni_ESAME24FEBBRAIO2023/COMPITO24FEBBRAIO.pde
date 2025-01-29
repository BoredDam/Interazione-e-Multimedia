ArrayList<Voto> lista_voti;

void setup() {
  size(500, 500);
  lista_voti = new ArrayList<Voto>();
}

void draw() {
  background(0);
  for (Voto mark : lista_voti) {
    mark.run();
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    lista_voti.add(new Voto());
  }

  if (mouseButton == RIGHT) {
    lista_voti.add(new Votone());
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    setup();
  }
}
