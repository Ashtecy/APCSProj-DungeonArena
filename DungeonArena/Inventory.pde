class Inventory {

  private final int CONSUMABLE = 0;
  private final int HELM = 1;
  private final int CHEST = 2;
  private final int ARMS = 3;
  private final int LEGS = 4;
  private final int WEAPON = 5;
  private final int NAKED = 6;
  protected Equiptment helm, arms, legs, chest, weapon;
  protected Stats equiptment;
  protected ArrayList<Item> items;
  protected int cap;

  Inventory (int size) {
    helm = arms = legs = chest = weapon = new Equiptment("Nothing", NAKED, 6, 0, 0);
    cap = size;
    items = new ArrayList<Item>();
    equiptment = new Stats();
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

  void equipt (int ind) {
    if (items.get(ind) != null && ind < cap) {
      int temp = ((Equiptment)items.get(ind)).getType();
      switch (temp) {
      case HELM:
        helm = (Equiptment)items.get(ind);
        break;
      case CHEST:
        chest = (Equiptment)items.get(ind);
        break;
      case ARMS:
        arms = (Equiptment)items.get(ind);
        break;
      case LEGS:
        legs = (Equiptment)items.get(ind);
        break;
      case WEAPON:
        weapon = (Equiptment)items.get(ind);
        break;
      default:
        break;
      }
    }
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

