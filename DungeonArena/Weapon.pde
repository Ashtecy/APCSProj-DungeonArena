
class Weapon{
  
  protected String name;
  protected PImage p;
  protected float x,y,tileRadius;
  
  Weapon(int x,int y,int tileSize){
    name="Axe of Test Cases";
    p=loadImage("mace.png");
    this.x=x;
    this.y=y;
    tileRadius=tileSize/2;
  }
  
  void draw(){
    imageMode(CENTER);
    image(p,x+tileRadius,y+tileRadius,tileRadius/2,tileRadius/2);
  }
  
}
