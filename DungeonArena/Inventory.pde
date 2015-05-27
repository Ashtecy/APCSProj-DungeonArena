class Inventory {

  protected Item helm, arms, legs, chest, weapon;
  protected ArrayList<Item> items;
  protected int cap;

  Inventory (int size) {
    //helm = arms = legs = chest = weapon = null;
    cap = 0;
  }

  boolean add (Item i) {
    if (cap > items.size()) {
      items.add(i);
      return true;
    }    
    return false;
  }

  void drop (int inInd) {
    items.remove(inInd);
  }

  Item getHelm() {
    return helm;
  }

  Item getArms() {
    return arms;
  }

  Item getLegs() {
    return legs;
  }

  Item getChest() {
    return chest;
  }

  Item getWeapon() {
    return weapon;
  }
}

