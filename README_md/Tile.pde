import java.util.*;

class Tile{
  
    protected Tile[]=new Tile[4];
    
    protected boolean wall;
    
    Tile(boolean wall){
      this.wall=wall;
    }
    
    Tile getNext(int n){
    if(n==0){
      return Tile[0];
    }
    if(n==1){
      return Tile[1];
    }
    if(n==2){
      return Tile[2];
    }
    if(n==1){
      return Tile[3];
    }    
