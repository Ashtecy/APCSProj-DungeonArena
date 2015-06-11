class Consumable extends Item {

  Consumable(int xi, int yi) {
    super("Potion", 0, xi, yi);
    setImage("potion.png");
  }

  void use(Adventurer b) {
    if (b.getHP() < b.getMaxHP()) {
      b.setHP(b.getHP() + 1 + (int)(Math.random() * (b.getMaxHP() - 1 - b.getHP())));
    }
    if (Math.random() < 0.1) {
      b.setSTR(b.getSTR() + 1);
    }
    if (Math.random() < 0.1) {
      b.setDEX(b.getDEX() + 1);
    }
    if (Math.random() < 0.1) {
      b.setINT(b.getINT() + 1);
    }
  }
}

