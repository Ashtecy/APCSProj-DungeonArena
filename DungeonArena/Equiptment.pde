class Equiptment extends Item {

  protected Stats stats;

  Equiptment(String name, int xi, int yi, int size) {
    super("Equiptment", xi, yi, size);
    stats = new Stats();
  }

  int getSTR() {
    return stats.getSTR();
  }

  int getDEX() {
    return stats.getDEX();
  }

  int getINT() {
    return stats.getINT();
  }

  void applyBuffs(Stats base) {
    base.setSTR(base.getSTR() + stats.getSTR());
    base.setDEX(base.getDEX() + stats.getDEX());
    base.setINT(base.getINT() + stats.getINT());
  }
}

