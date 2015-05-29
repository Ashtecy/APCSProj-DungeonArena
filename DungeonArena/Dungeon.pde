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
        guy = new Adventurer("Guy",tileSize*xPos,tileSize*yPos);
      }
    }
    camera = new Tile[5][5];
    int cX=(guy.getX()/64)-2;
    int cY=(guy.getY()/64)-2;
    for(int i=cX;i<=cX+4;i++){
      for(int j=cY;j<=cY+4;j++){
        camera[j-cY][i-cX]=map[j][i];
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
