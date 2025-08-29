Bowl b;
SuperBowl sb;

// thanks to @saturnxj who wrote this code with me :)

void setup() {
    size(512, 512);
    background(0);
    frameRate(60);
    b = new Bowl(random(width/2), random(height/2));
    sb = new SuperBowl(random(width/2,width), random(height/2, height));
}

void draw() {
    noStroke();
    fill(0,0,0,127);
    rectMode(CORNER);
    rect(0,0,512,512);
    b.run();
    sb.run(b.posX, b.posY);
}

void keyPressed() {
    if (key == 'r' || key == 'R') {
        setup();
    }
}

void mousePressed() {
    if (mouseButton == LEFT) {
        b.set_flag(true);
        sb.set_flag(true);
    } else if (mouseButton == RIGHT) {
        b.set_flag(false);
        sb.set_flag(false);
    }
}
