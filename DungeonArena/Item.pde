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

  void use(Adventurer b) {
    if (type == 0) {
      b.setHP(b.getHP() + (int)(Math.random() * (b.getMaxHP() - b.getHP())));
      if (Math.random() * 2 == 0) {
        b.setSTR(b.getSTR() + 1);
      }
      if (Math.random() * 2 == 0) {
        b.setDEX(b.getDEX() + 1);
      }
      if (Math.random() * 2 == 0) {
        b.setINT(b.getINT() + 1);
      }
    }
  }

  void draw() {
    if (!stored) {
      super.draw();
    }
  }
}

