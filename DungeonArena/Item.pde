class Item extends MapObject {

  protected boolean stored;

  Item(String name, int xi, int yi, int size) {
    super(name, xi, yi, size);
    stored = false;
  }

  void pickUp() {
    stored = true;
  }

  void drop() {
    stored = false;
  }

  void draw() {
    if (!stored) {
      super.draw();
    }
  }
}

