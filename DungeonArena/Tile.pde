import java.util.*;

class Tile{
  
  protected boolean isWall;
  protected float x,y;
  protected Random r;
  protected int tileSize;
  
  protected ArrayList<Item> drops;
  
  Tile(int x,int y,int n,int tileSize){
    this.x=x;
    this.y=y;
    this.tileSize=tileSize;
    if(n!=0){
      isWall=false;
      r = new Random();
      drops=new ArrayList<Item>();
      if(r.nextInt(15)==0){
        Item drop = new Item("Axe of the Test Cases",x,y,tileSize);
        drops.add(drop);
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
      image(wall,x,y,tileSize,tileSize);
    }else{
      PImage floor=loadImage("floor.png");
      image(floor,x,y,tileSize,tileSize);
      for(Item o:drops){
        o.draw();
      }
    } 
  }
}


