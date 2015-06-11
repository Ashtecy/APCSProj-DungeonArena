class Item extends MapObject {

  protected boolean stored;
  protected int type;
  boolean isEquipped;

  Item(String name, int setType, int xi, int yi) {
    super(name, xi, yi);
    type = setType;
    stored = false;
    switch (setType) {
    case 0:
      setImage("potion.png");
      break;
    case 1:
      setImage("helm.png");
      break;
    case 2:
      setImage("chest.png");
      break;
    case 3:
      setImage("arms.png");
      break;
    case 4:
      setImage("legs.png");
      break;
    case 5:
      setImage("weapon.png");
      break;
    default:
      break;
    }
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

