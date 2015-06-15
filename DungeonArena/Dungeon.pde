class Dungeon {

  protected Tile[][] camera = new Tile[7][7];
  protected Tile[][] map;
  protected Adventurer guy;
  protected Nemesis Al;
  protected ArrayList<Creature> monsters;
  protected int rows, cols;
  protected int tileSize;
  protected PImage W1 = loadImage("wall.png");
  protected PImage W2 = loadImage("floor.png");
  protected PImage man = loadImage("man.png");
  protected PImage creature = loadImage("creature.png");
  protected PImage[] items;

  Dungeon(int rows, int cols, long seed, int tileSize) {
    this.rows=rows;
    this.cols=cols;
    this.tileSize=tileSize;
    monsters = new ArrayList<Creature>();
    generateMap();  
    items = new PImage[7];
    items[0] = loadImage("potion.png");
    items[1] = loadImage("helm.png");
    items[2] = loadImage("chest.png");
    items[3] = loadImage("arms.png");
    items[4] = loadImage("legs.png");
    items[5] = loadImage("weapon.png");
    items[6] = loadImage("blank.png");
    for (int x = 1; x < rows; x++) {
      for (int y = 1; y < cols; y++) {
        if (!map[x][y].isWall() && map[x][y].occupant == null) {
          if (Math.random() < 0.1) {
            map[x][y].setOccupant(new Creature("Creature", 1, x, y, creature, items));
            monsters.add((Creature)map[x][y].occupant());
          }
          if (Math.random() < 0.1) {
            map[x][y].addDrop(new Consumable(x, y, items));
          }
          if (Math.random() < 0.02) {
            map[x][y].addDrop(new Equiptment("ASD", 1 + (int)(Math.random() * 5), x, y, items));
          }
        }
      }
    }
    spawn();
  }

  void generateMap() {
    map = new Tile[rows][cols];
    Random r = new Random(seed);
    for (int i=0; i<map[0].length; i++) {
      for (int j=0; j<map.length; j++) {
        if (i==0||j==0||i==map[0].length-1||j==map.length-1) {
          map[j][i]=new Tile(0, tileSize, W1);
          //     map[j][i].setXY(j,i);
        } else {
          if (r.nextInt(3)==0) {
            map[j][i]=new Tile(0, tileSize, W1);
          } else {
            map[j][i]=new Tile(1, tileSize, W2);
            // map[j][i].setXY(j,i);
          }
        }
      }
    }
  }

  void spawn() {
    while (guy==null) {
      int x=r.nextInt(rows-1)+1;
      int y=r.nextInt(cols-1)+1;
      if (!map[x][y].isWall() && !isTrapped(x,y)) {
        guy = new Adventurer("Guy", x, y,man,items);
      }
    }
    while (Al==null) {
      int x=r.nextInt(rows-1)+1;
      int y=r.nextInt(cols-1)+1;
      if (!map[x][y].isWall() && !isTrapped(x,y)) {
        Al = new Nemesis(0, x, y,man,items);
      }
    }
  }
  
  boolean isTrapped(int x, int y){
    int count = 8;
    for(int i=x-1;i<=x+1;i++){
      for(int j=y-1;j<=j+1;j++){
        if(map[x][y].isWall()){
          count--;
        }
      }
    }
    return count==0;
  }
          
        

  void setupCamera() {
    Tile temp = new Tile(0, tileSize, W1);
    int cX = guy.getX()-3;
    int cY = guy.getY()-3;
    for (int i=cX; i<cX+7; i++) {
      for (int j=cY; j<cY+7; j++) {

        if (i<0||j<0||i>rows-1||j>cols-1) {
          camera[i-cX][j-cY]=temp;
        } else {
          camera[i-cX][j-cY]=map[i][j];
        }
        camera[i-cX][j-cY].setXY(i-cX, j-cY);
        camera[i-cX][j-cY].draw();
      }
    }
  }

  void draw() {
    setupCamera();
    /* 
     for (Tile[] e : camera) {
     for (Tile f : e) {
     f.draw();
     }
     }*/
    guy.draw();
  }

  Adventurer getGuy() {
    return guy;
  }
  
  Adventurer getNemesis() {
    return Al;
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
    Al.act(this);
  }

  ArrayList<Creature> getMonsters() {
    return monsters;
  }
}

