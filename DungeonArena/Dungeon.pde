class Dungeon {

  protected Tile[][] camera = new Tile[7][7];
  protected Tile[][] map;
  protected Adventurer guy;
  protected ArrayList<Creature> monsters;
  protected int rows, cols;
  protected int tileSize;

  Dungeon(int rows, int cols, long seed, int tileSize) {
    this.rows=rows;
    this.cols=cols;
    this.tileSize=tileSize;
    monsters = new ArrayList<Creature>();
    generateMap();  
    spawnGuy();
    while (monsters.size () < 20) {
      int x=r.nextInt(rows-1)+1;
      int y=r.nextInt(cols-1)+1;
      if (!map[x][y].isWall() && map[x][y].occupant == null) {
        map[x][y].setOccupant(new Creature("Creature", 1, x, y));
        monsters.add((Creature)map[x][y].occupant());
      }
    }
  }       

  void generateMap() {
    map = new Tile[rows][cols];
    Random r = new Random(seed);
    for (int i=0; i<map[0].length; i++) {
      for (int j=0; j<map.length; j++) {
        if (i==0||j==0||i==map[0].length-1||j==map.length-1) {
          map[j][i]=new Tile(0, tileSize);
          //     map[j][i].setXY(j,i);
        } else {
          map[j][i]=new Tile(r.nextInt(3), tileSize);
          // map[j][i].setXY(j,i);
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
    Tile temp = new Tile(0, tileSize);
    int cX = guy.getX()-3;
    int cY = guy.getY()-3;
    for (int i=cX; i<cX+7; i++) {
      for (int j=cY; j<cY+7; j++) {
        
        if (i<0||j<0||i>rows-1||j>cols-1) {
         camera[i-cX][j-cY]=temp;
         }else {
         camera[i-cX][j-cY]=map[i][j];
         }
         camera[i-cX][j-cY].setXY(i-cX, j-cY);
         camera[i-cX][j-cY].draw();
      }
    }
  }

  void draw() {
    setupCamera();
    guy.draw();
  }

  Adventurer getGuy() {
    return guy;
  }

  Tile[][] getMap() {
    return map;
  }

  Tile[][] getCamera() {
    return camera;
  }

  Tile getTile(int xpos, int ypos) {
    return map[xpos][ypos];
  }

  int getHeight() {
    return map.length;
  }

  int getWidth() {
    return map[0].length;
  }

  void creatureMove() {
    for (Creature c : monsters) {
      c.act(this);
    }
  }

  ArrayList<Creature> getMonsters() {
    return monsters;
  }
}

