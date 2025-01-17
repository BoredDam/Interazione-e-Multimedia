PImage Im;
int n = 1;

PImage extractBitPlane(PImage I, int PlaneNo)
{
  PImage R = I.copy();
  R.loadPixels();

  if (PlaneNo <= 7 && PlaneNo>1) {
    int x;
    int r;

    for (int i=0; i<R.pixels.length; i++)
    {
      x = int(blue(R.pixels[i]));
      r = (x>>PlaneNo)&1;
      R.pixels[i] = color(r*255);
    }
    
    R.updatePixels();
  }

  return R;
}

void keyPressed() {
  if (key=='+' && n<7) {
    n++;
  }
  if (key=='-' && n>1) {
    n--;
  }
}

void setup()
{
  Im = loadImage("lenna.png");
  size(512, 512);
  image(Im, 0, 0);
}

void draw() {
  image(extractBitPlane(Im, n), 0, 0);
}
