class Dungeon {

  protected Tile[][] camera = new Tile[7][7];
  protected Tile[][] map;
  protected Adventurer guy;
  protected int rows, cols;
  protected int tileSize;

  Dungeon(int rows, int cols, long seed, int tileSize) {
    this.rows=rows;
    this.cols=cols;
    this.tileSize=tileSize;
    generateMap();  
    spawnGuy();
  }       

  void generateMap() {
    map = new Tile[rows][cols];
    Random r = new Random(seed);
    for (int i=0; i<map[0].length; i++) {
      for (int j=0; j<map.length; j++) {
        if (i==0||j==0||i==map[0].length-1||j==map.length-1) {
          map[j][i]=new Tile(0, tileSize);
          //map[j][i].setXY(j,i);
        } else {
          map[j][i]=new Tile(r.nextInt(3), tileSize);
          //map[j][i].setXY(j,i);
        }
      }
    }
  }

  void spawnGuy() {
    while (guy==null) {
      int x=r.nextInt(rows-1)+1;
      int y=r.nextInt(cols-1)+1;
      if (!map[x][y].isWall()) {
        guy = new Adventurer("Guy", x, y);
      }
    }
  }

  void setupCamera() {
    int cX = guy.getX()-3;
    int cY = guy.getY()-3;
    for (int i=cX; i<cX+7; i++) {
      for (int j=cY; j<cY+7; j++) {
        if (i<0||j<0||i>rows-1||j>cols-1) {
          camera[i-cX][j-cY]=new Tile(0, tileSize);
          camera[i-cX][j-cY].setXY(i-cX, j-cY);
        } else {
          camera[i-cX][j-cY]=map[i][j];
          camera[i-cX][j-cY].setXY(i-cX, j-cY);
        }
      }
    }
  }

  void draw() {
    setupCamera();
    for (Tile[] e : camera) {
      for (Tile f : e) {
        f.draw();
      }
    }
    guy.draw();
  }

  Adventurer getGuy() {
    return guy;
  }

  Tile[][] getMap() {
    return map;
  }

  Tile getTile(int xpos, int ypos) {
    return map[xpos / tileSize][ypos / tileSize];
  }
}

