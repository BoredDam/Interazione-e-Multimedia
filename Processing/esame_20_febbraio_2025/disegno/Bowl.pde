class Bowl {
  float posX, posY;
  int dim;
  color c;
  boolean is_left_click; // changes the update behaviour
  float originalX, originalY;

  Bowl(float posX, float posY ) {
    this.posX = posX;
    this.posY = posY;
    dim = 60;
    c = color(127);
    is_left_click = false;
    originalX = posX;
    originalY = posY;
  }

  void set_flag(boolean f) {
    is_left_click = f;
  }

  void display() {
    stroke(255);
    fill(c);
    ellipseMode(CENTER);
    ellipse(posX, posY, dim, dim);
  }

  void update() {
    if (is_left_click) {
      posX = lerp(posX, width, 0.1); // linear interpolation 
      posY = lerp(posY, 0, 0.1); 
    } else {
      posX = lerp(posX, originalX, 0.1);
      posY = lerp(posY,originalY, 0.1);
    }
  }

  void run() {
    update();
    display();
  }
}
