class Nemesis extends Adventurer{
  
  private int sight;
  private int build;  // Builds: 0(Str), 1(Dex), 2(Int)
  
  Nemesis(int m, int x, int y, PImage i, PImage[] imgs){
    super("Nemesis",x,y,i,imgs);
    setSTR(30);
    setDEX(30);
    setINT(30);
    setHP(150);
    build = m;
    sight = 10;
  }
  
 void draw() {
    imageMode(CENTER);
    image(W, tileSize*x+tileSize/2, tileSize*y+tileSize/2, 0.75*tileSize, 0.75*tileSize);
  }
 
  void attack(Being other) {
    if (Math.random() < 0.6) {
      other.setHP((int)(other.getHP() - getSTR() / 3));
    }
    setHP(getHP()+getSTR()/2);
  }
  
}
