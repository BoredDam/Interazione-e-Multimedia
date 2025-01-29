PImage lenna;
float f;
void setup() {
  lenna = loadImage("lenna.png");
  size(512,512);
  image(wow(lenna), 0, 0);
  f = random(0.0000001, 2);
}

void draw() {
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    setup();
  }
}

PImage wow(PImage I){
  PImage out = I.copy();
  PImage right = out.get(2*width/3, 0, width/3, height);
  PImage left = out.get(0, 0, width/3, height);
  
  right.loadPixels();
  for(int i=0; i<right.pixels.length; i++){
    right.pixels[i] = color(red(right.pixels[i])/f, green(right.pixels[i]), blue(right.pixels[i]));
  }
  
  left.loadPixels();
  for(int i=0; i<left.pixels.length; i++){
    left.pixels[i] = color(red(left.pixels[i])*f, green(left.pixels[i]), blue(left.pixels[i]));
  }
  
  out.set(0,0, right);
  out.set(2*width/3+1,0, left);
  return out;
}
