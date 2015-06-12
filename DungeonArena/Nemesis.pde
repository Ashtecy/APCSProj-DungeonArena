class Nemesis extends Adventurer{
  
  private int sight;
  private int build;  // Builds: 0(Str), 1(Dex), 2(Int)
  
  Nemesis(int m, int x, int y){
    super("Nemesis",x,y,15,15,15);
    build = m;
    sight = 10;
    setImage("man.png");
  }
  
 void draw() {
    imageMode(CENTER);
    image(W, tileSize*x+tileSize/2, tileSize*y+tileSize/2, 0.75*tileSize, 0.75*tileSize);
  }
 

  
}
