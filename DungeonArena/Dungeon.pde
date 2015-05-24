import java.util.*;

class Dungeon{
  protected Tile[][] map;
        
  Dungeon(){
    map = new Tile[12][15];
    Random r = new Random();
    for(int i=0;i<map[0].length;i++){
      for(int j=0;j<map.length;j++){
        if(i==0||j==0||i==map[0].length-1||j==map.length-1){
          map[j][i]=new Tile(64*i,64*j,0);
        }else{
        map[j][i]=new Tile(64*i,64*j,r.nextInt(3));
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
