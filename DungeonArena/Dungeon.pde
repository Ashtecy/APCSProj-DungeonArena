import java.util.*;

class Dungeon{
  
  protected Tile[][] map;
  protected Adventurer guy;
  protected int rows,cols;
  protected int tileSize;
        
  Dungeon(int rows,int cols,long seed,int tileSize){
    this.rows=rows;this.cols=cols;this.tileSize=tileSize;
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
    while(guy==null){
      int xPos=r.nextInt(rows-1)+1;
      int yPos=r.nextInt(cols-1)+1;
      if(!map[xPos][yPos].isWall()){
        guy = new Adventurer("Guy",64*xPos,64*yPos);
      }
    }
  }

  void draw(){
    for(Tile[] e:map){
      for(Tile f:e){
        f.draw();
      } 
    }
    guy.draw();
  }
  
  Adventurer getGuy(){
    return guy;
  }
  
  
}
