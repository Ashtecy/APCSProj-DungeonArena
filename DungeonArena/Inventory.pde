class Inventory {

  //Equiptment helm, arms, legs, chest, weapon;
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
}

