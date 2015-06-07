class Tile {

  protected boolean isWall;
  protected Being occupant;
  protected int x, y;
  protected Random r = new Random();
  protected int tileSize;
  protected ArrayList<Item> drops = new ArrayList<Item>();
  PImage W;

  Tile(int n, int tileSize) {
    this.tileSize=tileSize;
    isWall=(n==0);
    if (Math.random() < 0.05) {
      addDrop(new Consumable(x, y));
    }
    if (Math.random() < 0.02) {
      addDrop(new Equiptment("ASD", 1 + (int)(Math.random() * 5), x, y));
    }
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

  Being occupant() {
    return occupant;
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

  void setOccupant(Being b) {
    occupant = b;
  }

  void draw() {
    imageMode(CORNER);
    image(getImage(), x*tileSize, y*tileSize, tileSize, tileSize);
    if (!isWall() && drops.size() > 0) {
      drops.get(drops.size() - 1).setXY(x, y);
      drops.get(drops.size() - 1).draw();
    }
    if (occupant != null) {
      occupant.setXY(x, y);
      occupant.draw();
    }
  }
}

