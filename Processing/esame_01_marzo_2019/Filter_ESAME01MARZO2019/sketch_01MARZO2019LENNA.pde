PImage Im;

void setup() {
  Im = loadImage("lenna.png");
  size(768, 256);
  Im.filter(GRAY);
  Im.resize(256, 256);
  image(Im, 0, 0);
  image(logOp(Im), 256, 0);
  image(logOp(Im, round(random(10, 70)), round(random(10, 70))), 512, 0);
}

void draw() {
}

PImage logOp(PImage I) {
  PImage out = I.copy();
  out.loadPixels();
  float c = 255/log(256);
  for (int i=0; i<out.pixels.length; i++) {
    out.pixels[i] = color(log(green(out.pixels[i])+1)*c);
  }
  out.updatePixels();
  return out;
}

PImage logOp(PImage I, int h, int k) {
  PImage out = I.copy();
  out.loadPixels();
  int x = round(random(0, out.width-h));
  int y = round(random(0, out.height-k));
  
  for (int i = 0; i<k; i++) {
    for (int j = 0; j<h; j++) {
      out.pixels[(j+x)+(i+y)*out.width] = color(0);
    }
  }

  out.updatePixels();
  out = logOp(out);
  return out;
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    setup();
  }
}
