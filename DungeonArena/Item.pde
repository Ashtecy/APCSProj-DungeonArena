class Item extends MapObject {

  protected boolean stored;
  protected int type;

  Item(String name, int setType, int xi, int yi) {
    super(name, xi, yi);
    type = setType;
    stored = false;
  }

  void pickUp() {
    stored = true;
  }

  void drop() {
    stored = false;
  }

  int getType() {
    return type;
  }

  void draw() {
    if (!stored) {
      super.draw();
    }
  }
}

