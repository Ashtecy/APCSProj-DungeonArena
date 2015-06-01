import java.util.*;

class Dungeon{
  
  protected Tile[][] camera;
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
          map[j][i]=new Tile(0,tileSize);
        }else{
        map[j][i]=new Tile(r.nextInt(3),tileSize);
        }  
      }
    }
    while(guy==null){
      int x=r.nextInt(rows-1)+1;
      int y=r.nextInt(cols-1)+1;
      if(!map[x][y].isWall()){
        guy = new Adventurer("Guy",x,y);
      }
    }
    camera = new Tile[7][7];
    int cX=guy.getX()-3;
    int cY=guy.getY()-3;
    for(int i=cX;i<=cX+6;i++){
      for(int j=cY;j<=cY+6;j++){
        camera[j-cY][i-cX]=map[j][i];
        camera[j-cY][i-cX].setXY((j-cY)*tileSize,(i-cX)*tileSize);
      }
    }
  }

  void draw(){
    for(Tile[] e:camera){
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
