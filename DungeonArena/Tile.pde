import java.util.*;

class Tile{
  
  protected boolean isWall;
  protected float x,y;
  protected Random r;
  
  protected Weapon[] drops;
  
  Tile(int x,int y,int n){
    this.x=x;
    this.y=y;
    if(n!=0){
      isWall=false;
      r = new Random();
      drops=new Weapon[5];
      if(r.nextInt(15)==0){
        Weapon drop = new Weapon(x,y,64);
        drops[0]=drop;
      }
    }else{
      isWall=true;
    }
  }
  
  boolean isWall(){
    return isWall;
  }
  
  void draw(){
    imageMode(CORNER);
    if(isWall){
      PImage wall=loadImage("wall.png");
      image(wall,x,y,64,64);
    }else{
      PImage floor=loadImage("floor.png");
      image(floor,x,y,64,64);
      if(drops[0]!=null){
        drops[0].draw();
      }
    } 
  }
}


