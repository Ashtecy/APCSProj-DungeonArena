import java.util.*;

class Dungeon{
  
  protected Tile[][] map;
  protected Adventurer guy;
  protected int rows,cols;
        
  Dungeon(int rows,int cols,long seed,int tileSize){
    this.rows=rows;this.cols=cols;
    map = new Tile[rows][cols];
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
    if(!map[r.nextInt(rows-1)+1][r.nextInt(cols-1)+1].isWall())
    guy = new Adventurer("Guy",row,col);
  }

  void draw(){
    for(Tile[] e:map){
      for(Tile f:e){
        f.draw();
      } 
    }
    guy.draw();
  }
}
