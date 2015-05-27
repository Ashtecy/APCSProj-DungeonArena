class Item extends MapObject {

  protected String name;
  protected boolean stored;

  Item(String name, int xi, int yi, int size) {
    super(xi, yi, size);
    name = name;
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

