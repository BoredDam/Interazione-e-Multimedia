class SuperBowl extends Bowl {
    color cCircle;
    int dimCircle;

    SuperBowl(float posX, float posY) {
        super(posX, posY);
        c = color(255, 0, 0);
        cCircle = color(255, 255, 0);
        dimCircle = 30;
    }

    void display() {
        stroke(255);
        fill(c);
        ellipseMode(CENTER);
        ellipse(posX, posY, dim, dim);
        noStroke();
        fill(cCircle);
        ellipse(posX, posY, dimCircle, dimCircle);
    }

    void update(float posBowlX, float posBowlY) {
        if (is_left_click) {
            posX = lerp(posX, posBowlX, 0.1);
            posY = lerp(posY, posBowlY, 0.1);
        } else {
            posX = lerp(posX, originalX, 0.1);
            posY = lerp(posY, originalY, 0.1);
        }
    }

    void run(float posBowlX, float posBowlY) {
        update(posBowlX, posBowlY);
        display();
    }
}
