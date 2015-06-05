class Minotaur extends Being {

  protected Stats stats;
  //protected Item drop = new Item("Axe of Test Cases");

  Minotaur(String name, int x, int y, int str, int dex, int in) {
    super(name, x, y);
    stats = new Stats(str, dex, in);
    W = loadImage("man.png");
  }
  
  Minotaur(String name,int x,int y){
     this(name,x,y,10,10,10);
  }

  void draw(){
    imageMode(CENTER);
    image(W,tileSize*(3.5),tileSize*(3.5),0.8*tileSize,0.8*tileSize);
  }

  int getSTR() {
    return stats.getSTR();
  }

  int getDEX() {
    return stats.getDEX();
  }

  int getINT() {
    return stats.getINT();
  }

  void setSTR(int s) {
    stats.setSTR(s);
  }

  void setDEX(int d) {
    stats.setDEX(d);
  }

  void setINT(int i) {
    stats.setINT(i);
  }

  void attack(Being other) {
    other.setHP(other.getHP() - getSTR());
    if (other.getHP() <= 0) {
      other.die();
    }
  }

  
}

