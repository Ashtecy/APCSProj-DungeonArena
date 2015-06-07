class Consumable extends Item {

  Consumable(int xi, int yi) {
    super("Potion", 0, xi, yi);
    setImage("potion.png");
  }

  void use(Adventurer b) {
    b.setHP(b.getHP() + (int)(Math.random() * (b.getMaxHP() - b.getHP())));
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

