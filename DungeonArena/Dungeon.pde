import java.util.*;

class Dungeon{
  protected Tile[][] map;
        
  Dungeon(long seed,int tileSize){
    map = new Tile[12][15];
    Random r = new Random(seed);
    for(int i=0;i<map[0].length;i++){
      for(int j=0;j<map.length;j++){
        if(i==0||j==0||i==map[0].length-1||j==map.length-1){
          map[j][i]=new Tile(tileSize*i,tileSize*j,0,tileSize);
        }else{
        map[j][i]=new Tile(tileSize*i,tileSize*j,r.nextInt(3),tileSize);
        }  
      }
    }
  }

  void draw(){
    for(Tile[] e:map){
      for(Tile f:e){
        f.draw();
      } 
    }
  }
}
