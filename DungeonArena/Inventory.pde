class Inventory {

  protected Equiptment helm, arms, legs, chest, weapon;
  protected ArrayList<Item> items;
  protected int cap;

  Inventory (int size) {
    helm = arms = legs = chest = weapon = null;
    cap = size;
  }

  boolean add (Item i) {
    if (cap > items.size()) {
      items.add(i);
      return true;
    }    
    return false;
  }

  void drop (int inInd) {
    items.remove(inInd).drop();
  }

  Equiptment getHelm() {
    return helm;
  }

  Equiptment getArms() {
    return arms;
  }

  Equiptment getLegs() {
    return legs;
  }

  Equiptment getChest() {
    return chest;
  }

  Equiptment getWeapon() {
    return weapon;
  }
}

