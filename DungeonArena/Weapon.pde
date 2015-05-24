
class Weapon{
  
  protected String name;
  protected PImage W;
  protected float x,y,tileRadius;
  
  Weapon(int x,int y,int tileSize){
    name="Axe of Test Cases";
    this.x=x;
    this.y=y;
    tileRadius=tileSize/2;
  }
  
  void draw(){
    imageMode(CENTER);
    W=loadImage("mace.png");
    image(W,x+tileRadius,y+tileRadius,tileRadius,tileRadius);
  }
  
}
