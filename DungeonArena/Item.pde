class Item extends MapObject {

  protected boolean stored;
  protected int type;
  boolean isEquipped;

  Item(String name, int setType, int xi, int yi, PImage[] itemImage) {
    super(name, xi, yi, itemImage[setType]);
    type = setType;
    stored = false;
    isEquipped = false;
  }

  void pickUp() {
    stored = true;
  }

  void drop(Tile t) {
    t.addDrop(this);
    stored = false;
  }

  int getType() {
    return type;
  }
}

