class Consumable extends Item {

  Consumable(int xi, int yi, PImage[] i) {
    super("Potion", 0, xi, yi, i);
  }
  
  void use(Adventurer b) {
    if (b.getHP() < b.getMaxHP()) {
      b.setHP(b.getHP() + 1 + (int)(Math.random() * (b.getMaxHP() - 1 - b.getHP())));
    }
    if (b.getMP() < b.getMaxMP()){
      b.setMP(b.getMP() + 1 + (int)(Math.random() * (b.getMaxMP() - 1 - b.getMP())));
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

