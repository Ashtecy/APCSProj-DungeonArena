class Inventory {

  //Equiptment head, arms, legs, chest, weapon;
  protected Item[] items;
  protected int itemCount;

  Inventory (int size) {
    head = arms = legs = chest = weapon = null;
    items = new Item[size];
    itemCount = 0;
  }

  void add (Item i) {
    if (itemCount < items.length) {
      items[itemCount] = i;
      itemCount++;
    }else{
      
    }
  }
}

