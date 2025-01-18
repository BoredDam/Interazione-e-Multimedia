float[][]  kernel_1  = {{0, -2, 0}, {-2, 9, -2}, {0, -2, 0}}; // INSERISCI QUI IL TUO KERNEL N x M
PImage imInput;

void setup() {
  size(512*3, 256*3);
  imInput = loadImage("lenna.png");
  imInput.resize(height, height);
  imInput.filter(GRAY);
  image(imInput, 0, 0);
  image(convolution(imInput, kernel_1), imInput.width, 0);
}

void draw() {
}

PImage convolution(PImage I, float[][] K) {
  PImage temp;
  int N = K.length;     //dimensioni del Kernel
  int M = K[0].length;  //dimensioni del Kernel
  
  float value;
  float[][] output = new float[I.width][I.height];           // matrice di dimensioni pari a quelle dell'output ma con valori float
  PImage actualOutput = createImage(I.width, I.height, RGB); // effettivo output della funzione

  for (int i=0; i<I.width; i++) {
    for (int j=0; j<I.height; j++) {
      temp = I.get(i-N/2, j-M/2, N, M); //sottoimmagine di dimensioni n x m
      
      value = 0;
      for (int m=0; m<M; m++) {
        for (int n=0; n<N; n++) {
          value = value + green(temp.get(m, n))*K[n][m]; //prodotto tra matrici (la funzione green() serve per lavorare con
                                                         //una variabile numerica, estraendo la componente verde)
        }
      }

      output[i][j] = constrain(value, 0, 255);
      actualOutput.set(i, j, color(output[i][j]));
    }
  }

  return actualOutput;
}
