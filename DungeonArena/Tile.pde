class Tile {

  protected boolean isWall;
  protected int x, y;
  protected Random r = new Random();
  protected int tileSize;
  protected ArrayList<Item> drops = new ArrayList<Item>();
  PImage W;

  Tile(int n, int tileSize) {
    this.tileSize=tileSize;
    isWall=(n==0);
    addDrop(new Consumable(x,y));
    if (isWall()) {
      setImage("wall.png");
    } else {
      setImage("floor.png");
    }
  }

  void setImage(String src) {
    W = loadImage(src);
  }

  PImage getImage() {
    return W;
  }

  void setX (int newX) {
    x = newX;
  }

  void setY (int newY) {
    y = newY;
  }

  void setXY (int newX, int newY) {
    setX(newX);
    setY(newY);
  }

  boolean isWall() {
    return isWall;
  }

  void addDrop(Item i) {
    drops.add(i);
  }

  Item removeDrop() {
    if (drops.size() > 0) {
      return drops.remove(drops.size() - 1);
    }
    return null;
  }

  void draw() {
    imageMode(CORNER);
    image(getImage(), x*tileSize, y*tileSize, tileSize, tileSize);
    if (!isWall()) {
      for (Item o : drops) {
        o.draw();
      }
    }
  }
}

