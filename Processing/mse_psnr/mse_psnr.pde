float mse(PImage I1, PImage I2) {
  I1.loadPixels();
  I2.loadPixels();
  
  int n = min(I1.pixels.length, I2.pixels.length);
  float res = 0;
  
  for(int i = 0; i < n; i++) {
    float v1 = brightness(I1.pixels[i]);
    float v2 = brightness(I2.pixels[i]);
    res += sq(v1 - v2);
  }
  
  return res / n;
}

float psnr(PImage I1, PImage I2) {
  float m = mse(I1, I2);
  if(m == 0) 
    return Float.POSITIVE_INFINITY;
  
  float maxI = 255.0;
  return 10.0 * log((maxI * maxI) / m) / log(10); 
}

PImage img1;
PImage img2;

void setup() {
  img1 = loadImage("lena.png");
  img2 = loadImage("lena_gamma.png");
  
  img1.resize(256, 256);
  img2.resize(256, 256);

  
  size(512, 256);
}

void draw() {
  background(0);
  image(img1, 0, 0);
  image(img2, 256, 0);
  
  float m = mse(img1, img2);
  float p = psnr(img1, img2);
  
  fill(255);
  text("MSE  = " + nf(m, 1, 2), 10, height - 25);
  text("PSNR = " + nf(p, 1, 2) + " dB", 10, height - 8);
}
