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
    helm = arms = legs = chest = weapon = new Equiptment("Nothing", NAKED, 6, 0);
    cap = size;
    items = new ArrayList<Item>();
    equiptment = new Stats();
  }

  void add (Item i) {
    if (items.size() < cap) {
      items.add(i);
    }
  }

  void drop (int inInd, Tile t, int x, int y) {
    if (inInd >= 0 && inInd < items.size()) {
      Item removed = items.remove(inInd);
      removed.setXY(x, y);
      removed.drop(t);
      if (removed.equals(helm)) {
        helm = new Equiptment("Nothing", NAKED, 6, 0);
      } else if (removed.equals(chest)) {
        chest =new Equiptment("Nothing", NAKED, 6, 0);
      } else if (removed.equals(arms)) {
        arms = new Equiptment("Nothing", NAKED, 6, 0);
      } else if (removed.equals(legs)) {
        legs = new Equiptment("Nothing", NAKED, 6, 0);
      } else if (removed.equals(weapon)) {
        weapon = new Equiptment("Nothing", NAKED, 6, 0);
      }
    }
  }

  void equipt (int ind) {
    if (items.get(ind) != null) {
      int temp = items.get(ind).getType();
      switch (temp) {
      case HELM:
        helm.isEquipped = false;
        helm = (Equiptment)items.get(ind);
        break;
      case CHEST:
        chest.isEquipped = false;
        chest = (Equiptment)items.get(ind);
        break;
      case ARMS:
        arms.isEquipped = false;
        arms = (Equiptment)items.get(ind);
        break;
      case LEGS:
        legs.isEquipped = false;
        legs = (Equiptment)items.get(ind);
        break;
      case WEAPON:
        weapon.isEquipped = false;
        weapon = (Equiptment)items.get(ind);
        break;
      default:
        break;
      }
      items.get(ind).isEquipped = true;
    }
  }

  void use(int ind, Adventurer a) {
    if (ind >= 0 && ind < items.size()) {
      if (items.get(ind).getType() == CONSUMABLE) {
        ((Consumable)(items.remove(ind))).use(a);
      } else {
        equipt(ind);
        a.updateStats();
      }
    }
  }

  Item get(int ind) {
    if (ind >= 0 && ind < items.size() ) {//&& items.get(ind).getType() == CONSUMABLE) {
      //return (Consumable)(items.get(ind));
      return (items.get(ind));
    }
    return null;
  }

  int size() {
    return items.size();
  }

  int getCap() {
    return cap;
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

