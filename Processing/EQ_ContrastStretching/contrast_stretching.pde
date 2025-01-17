PImage im, imCs, imEQ;
void setup() {
  size(512*3, 512);
  im = loadImage("lenna.png");
  im.filter(GRAY);
  image(im, 0, 0);
  imCs = contrastStr(im);
  image(imCs, 512, 0);
  imEQ = EQ(im);
  image(imEQ, 512*2, 0);
}

PImage contrastStr(PImage In) {
  PImage I = In.copy();
  I.loadPixels();

  float min = red(I.pixels[0]);
  float max = red(I.pixels[0]);
  for (int i=0; i<I.pixels.length; i++) {

    if (min>red(I.pixels[i])) {
      min = red(I.pixels[i]);
    }

    if (max<red(I.pixels[i])) {
      max = red(I.pixels[i]);
    }
  }

  for (int i = 0; i<I.pixels.length; i++) {
    I.pixels[i] = color((255*red(I.pixels[i])-min)/(max-min));
  }
  I.updatePixels();

  return I;
}

float [] istogramma(PImage I) {
  float [] H = new float[256];

  for (int i = 0; i<256; i++) {
    H[i] = 0;
  }

  I.loadPixels();

  for (int i = 0; i<I.pixels.length; i++) {
    H[int(red(I.pixels[i]))]++;
  }

  for (int i = 0; i<256; i++) {
    H[i] = H[i]/I.pixels.length;
  }

  return H;
}

PImage EQ(PImage I) {
  PImage R = I.copy();

  float [] H = istogramma(I);

  // ISTOGRAMMA CUMULATIVO:
  for (int i=1; i<256; i++) {
    H[i] = H[i-1] + H[i];
  }

  R.loadPixels();

  for (int i=0; i<R.pixels.length; i++) {
    R.pixels[i] = color(255*H[int(red(R.pixels[i]))]);
  }
  R.updatePixels();

  return R;
}
