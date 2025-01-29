class Votone extends Voto {
  Votone() {
    super();
  }

  void display() {
    stroke(255);
    strokeWeight(4);
    textSize(28);
    if (mark>=24) {
      text(mark + "\n LODE", posX-15, posY+10);
    }
    else{
      text(mark, posX-15, posY+10);
    }
    noFill();
    rectMode(CENTER);
    rect(posX, posY, 30, 30);
  }
  
  void update(){
  
  }
  
}
