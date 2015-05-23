import java.util.*;

class Tile{
  
  protected boolean wall;
  protected float x,y;
  protected color c;
  
  Tile(int x,int y,int n){
    this.x=x;
    this.y=y;
    if(n!=0){
      wall=false;
    }else{
      wall=true;
    }
    if(wall){  
      c=color(0,0,255);
    }
  }
  
  void draw(){
    if(wall){
      stroke(c);
      fill(c);
    }else{
      stroke(0);
      fill(255);
    }
    rect(x,y,32,32);
  }
}
