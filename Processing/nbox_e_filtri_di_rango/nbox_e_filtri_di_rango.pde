/*
this is an exercise about maximum (massimo), 
minimum (minimo), median (mediano) and nbox filters.

shutout to @saturnxj and @Steph04m :)
*/

PImage I1, I2, I3, I4;

void setup() {
    size(1000, 256);
    I1 = loadImage("lenna.png");
    I1.resize(256, 256);
    I1.filter(GRAY);
    image(I1, 0, 0);
    I2 = nBox(I1, 3);
    image(I2, 256, 0);
    I3 = massimo(I1, 3);
    image(I3, 512, 0);
}


PImage nBox(PImage input, int n) {
    PImage output = input.copy();
    float media = 0;
    PImage subOut;
    for (int x = 0; x < output.width; x++) {
        for (int y = 0; y < output.height; y++) {
            media = 0;
            subOut = input.get(x - n/2, y - n/2, n, n);
            subOut.loadPixels(); // linearizza matrice
            for (int k = 0; k < subOut.pixels.length; k++) {
                media = media + red(subOut.pixels[k]);
            }
            media = media / subOut.pixels.length;
            output.set(x, y, color(media));
        }
    }
    return output;
}

PImage massimo(PImage input, int n) {
    PImage output = input.copy();
    float [] array = new float [n * n];

    PImage subOut;
    for (int x = 0; x < output.width; x++) {
        for (int y = 0; y < output.height; y++) {

            subOut = input.get(x - n/2, y - n/2, n, n);
            subOut.loadPixels(); //linearizza matrice, diventa un vettore
            for (int k = 0; k < subOut.pixels.length; k++) {
                array[k] = red(subOut.pixels[k]);
            }
            output.set(x, y, color(max(array)));
        }
    }
    return output;
}
