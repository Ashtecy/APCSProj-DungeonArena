import java.util.*;

class Tile{
  
  protected boolean isWall;
  protected float x,y;
  
  Tile(int x,int y,int n){
    this.x=x;
    this.y=y;
    if(n!=0){
      isWall=false;
    }else{
      isWall=true;
    }
  }
  
  boolean isWall(){
    return isWall;
  }
  
  void draw(){
    Random r = new Random();
    imageMode(CORNER);
    if(isWall){
      PImage wall=loadImage("wall.png");
      image(wall,x,y,64,64);
      
    }else{
      PImage floor=loadImage("floor.png");
      image(floor,x,y,64,64);
      
    }
  }
}

