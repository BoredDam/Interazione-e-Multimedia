PImage lenna;
float[][] kernel = {{0, -1, 0}, {-1, 5, -1}, {0, -1, 0}};

void setup() {
  size(256*6, 512);
  lenna = loadImage("lenna.png");
  lenna.filter(GRAY);
  lenna.resize(256, 256);
  image(lenna, 256*0, 0);
  image(gamma(lenna, 2), 256*1, 0);
  image(logaritmico(lenna), 256*2, 0);
  image(negativo(lenna), 256*3, 0);
  image(massimo(lenna, 5), 256*4, 0);
  image(minimo(lenna, 5), 256*5, 0);
  image(mediano(lenna, 5), 256*0, 256);
  image(convoluzione(lenna, kernel), 256*1, 256);
  image(cutY(lenna), 256*2, 256);
  image(cutX(lenna), 256*3, 256);
  image(contrastStr(lenna), 256*4, 256);
  image(EQ(lenna), 256*5, 256);
}

void draw() {
}

// FILTRO DI GAMMA
// FORMULA : gamma(x,y) = c*f(x,y)^gm ;
// CON c COSTANTE DI NORMALIZZAZIONE

PImage gamma(PImage I, float gamma) {

  PImage out = I.copy();
  out.loadPixels();
  float nuColor;

  float c = 255/pow(255, gamma);
  for (int i=0; i<out.pixels.length; i++) {
    nuColor = pow(green(out.pixels[i]), gamma);
    out.pixels[i] = color(nuColor*c);
  }

  out.updatePixels();
  return out;
}


// FILTRO LOGARITMICO
// FORMULA : logaritmico(x,y) = c*log(f(x,y)) ;
// CON c COSTANTE DI NORMALIZZAZIONE

PImage logaritmico(PImage I) {

  PImage out = I.copy();
  out.loadPixels();
  float nuColor;

  float c = 255/log(255);
  for (int i=0; i<out.pixels.length; i++) {
    nuColor = log(green(out.pixels[i]));
    out.pixels[i] = color(nuColor*c);
  }

  out.updatePixels();
  return out;
}


// FILTRO NEGATIVO
// FORMULA : neg(x,y) = 255 - f(x,y);
//

PImage negativo(PImage I) {

  PImage out = I.copy();
  out.loadPixels();
  float nuColor;

  for (int i=0; i<out.pixels.length; i++) {
    nuColor = 255 - green(out.pixels[i]);
    out.pixels[i] = color(nuColor);
  }

  out.updatePixels();
  return out;
}

// FILTRO DI MASSIMO
// è un filtro locale basato sul rango
// non è applicabile la convoluzione

PImage massimo(PImage I, int n) {

  PImage out = I.copy();
  float[] arr = new float[n*n];
  color massimo;
  PImage subOut;

  for (int x=0; x<out.width; x++) {
    for (int y = 0; y<out.height; y++) {

      subOut = I.get(x-n/2, y-n/2, n, n);
      subOut.loadPixels();

      for (int i=0; i<subOut.pixels.length; i++) {
        arr[i] = green(subOut.pixels[i]);
      }

      massimo = color(max(arr));
      out.set(x, y, massimo);
    }
  }
  return out;
}

// FILTRO DI MINIMO
// è un filtro locale basato sul rango
// non è applicabile la convoluzione

PImage minimo(PImage I, int n) {

  PImage out = I.copy();
  float[] arr = new float[n*n];
  color minimo;
  PImage subOut;
  int xs, ys;

  for (int x=0; x<out.width; x++) {
    for (int y = 0; y<out.height; y++) {

      xs = x-n/2;
      ys = y-n/2;
      subOut = I.get(max(0, xs), max(0, ys), min(n, min(n+xs, I.width-xs)), min(n, min(n+ys, I.height-ys)));
      subOut.loadPixels();

      arr = new float[subOut.pixels.length];
      for (int i=0; i<subOut.pixels.length; i++) {
        arr[i] = green(subOut.pixels[i]);
      }

      minimo = color(min(arr));
      out.set(x, y, minimo);
    }
  }
  return out;
}

// FILTRO MEDIANO
// è un filtro locale basato sul rango
// non è applicabile la convoluzione

PImage mediano(PImage I, int n) {

  PImage out = I.copy();
  float[] arr = new float[n*n];
  color mediano;
  PImage subOut;
  int xs, ys;

  for (int x=0; x<out.width; x++) {
    for (int y = 0; y<out.height; y++) {

      xs = x-n/2;
      ys = y-n/2;
      subOut = I.get(max(0, xs), max(0, ys), min(n, min(n+xs, I.width-xs)), min(n, min(n+ys, I.height-ys)));
      subOut.loadPixels();

      arr = new float[subOut.pixels.length];

      for (int i=0; i<subOut.pixels.length; i++) {
        arr[i] = green(subOut.pixels[i]);
      }

      arr = sort(arr);

      if (arr.length%2==0) {
        mediano = color( (arr[floor(arr.length/2)]+arr[ceil(arr.length/2)])/2);
      } else {
        mediano = color(arr[arr.length/2]);
      }

      out.set(x, y, mediano);
    }
  }
  return out;
}


// CONVOLUZIONE
//
//

PImage convoluzione(PImage I, float[][] ker) {

  PImage out = I.copy();
  PImage subOut;
  float nuValue;
  int n = ker.length;
  int m = ker[0].length;
  for (int x=0; x<out.width; x++) {
    for (int y = 0; y<out.height; y++) {

      subOut = I.get(x-n/2, y-m/2, n, m);
      nuValue = 0;
      for (int h=0; h<ker[0].length; h++) {
        for (int i=0; i<ker.length; i++) {
          nuValue = green(subOut.get(h, i))*ker[i][h]+nuValue;
        }
      }
      nuValue = constrain(nuValue, 0, 255);
      out.set(x, y, color(nuValue));
    }
  }
  return out;
}


// INVERSIONE DI DUE PARTI DI UN IMMAGINE IN VERTICALE
//
//

PImage cutY(PImage I) {

  PImage out = I.copy();
  PImage left;
  PImage right;
  left = out.get(0, 0, out.width/2, out.height);
  right = out.get(out.width/2, 0, out.width, out.height);
  out.set(0, 0, right);
  out.set(out.width/2, 0, left);

  return out;
}


// INVERSIONE DI DUE PARTI DI UN IMMAGINE IN ORIZZONTALE
//
//

PImage cutX(PImage I) {

  PImage out = I.copy();
  PImage top;
  PImage bot;
  top = out.get(0, 0, out.width, out.height/2);
  bot = out.get(0, out.height/2, out.width, out.height);
  out.set(0, 0, bot);
  out.set(0, out.width/2, top);

  return out;
}


// ESPANSIONE DEL CONTRASTO
//
//

PImage contrastStr(PImage I) {

  PImage out = I.copy();
  out.loadPixels();
  float min = red(out.pixels[0]);
  float max = red(out.pixels[0]);
  for(int i=0; i<out.pixels.length; i++){
    
    if (min>red(out.pixels[i])) {
      min = red(out.pixels[i]);
    }

    if (max<red(out.pixels[i])) {
      max = red(out.pixels[i]);
    }
  
  }
  
  for(int i=0; i<out.pixels.length; i++){
    out.pixels[i] = color(map(red(out.pixels[i]), min, max, 0, 255));
  }
  out.updatePixels();
  
  return out;
}



// ISTOGRAMMA E EQUALIZZAZIONE
//
//

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
  PImage out = I.copy();

  float [] H = istogramma(I);

  // ISTOGRAMMA CUMULATIVO:
  for (int i=1; i<256; i++) {
    H[i] = H[i-1] + H[i];
  }

  out.loadPixels();

  for (int i=0; i<out.pixels.length; i++) {
    out.pixels[i] = color(255*H[int(red(out.pixels[i]))]);
  }
  out.updatePixels();

  return out;
}
