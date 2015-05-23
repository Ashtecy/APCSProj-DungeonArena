import java.util.*;

class Dungeon{
  protected Tile[][] map;
        
  Dungeon(){
    map = new Tile[25][20];
    Random r = new Random();
    for(int i=0;i<map[0].length;i++){
      for(int j=0;j<map.length;j++){
        map[j][i]=new Tile(32*i,32*j,r.nextInt(3));
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
