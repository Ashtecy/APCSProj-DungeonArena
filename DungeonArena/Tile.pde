class Tile {

  protected boolean isWall;
  protected int x, y;
  protected Random r = new Random();
  protected int tileSize;
  protected ArrayList<Item> drops = new ArrayList<Item>();
  PImage W;

  Tile(int n, int tileSize, PImage W1, PImage W2) {
    this.tileSize=tileSize;
    isWall=(n==0);
    if (Math.random() < 0.05) {
      addDrop(new Consumable(x, y));
    }
    if (Math.random() < 0.1) {
      addDrop(new Equiptment("ASD", (int)(Math.random() * 6), x, y));
    }
    if (isWall()) {
      setImage(W1);
    } else {
      setImage(W2);
    }
  }

  void setImage(PImage src){
    W=src;
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
    image(W, x*tileSize, y*tileSize, tileSize, tileSize);
    if (!isWall() && drops.size() > 0) {
      drops.get(drops.size() - 1).setXY(x, y);
      drops.get(drops.size() - 1).draw();
    }
  }
}

