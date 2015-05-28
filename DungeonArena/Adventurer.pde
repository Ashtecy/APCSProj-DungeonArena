class Adventurer extends Being {

  private int LVL, EXP, PTS;
  private Inventory in;
  private Stats stats, equiptment;

  Adventurer(String name, int h, int x, int y) {
    this(name, h, x, y, 10, 10, 10);
    in = new Inventory(20);
    equiptment = new Stats(0, 0, 0);
  }

  Adventurer(String name, int h, int x, int y, int str, int dex, int in) {
    super(name, h, x, y);
    stats = new Stats(str, dex, in);
    setEXP(0);
  }

  int getSTR() {
    return stats.getSTR() + equiptment.getSTR();
  }

  int getDEX() {
    return stats.getDEX() + equiptment.getDEX();
  }

  int getINT() {
    return stats.getINT() + equiptment.getINT();
  }

  int getEXP() {
    return EXP;
  }

  int getPTS() {
    return PTS;
  }

  void setSTR(int s) {
    stats.setSTR(s);
  }

  void setDEX(int d) {
    stats.setDEX(d);
  }

  void setINT(int i) {
    stats.setINT(i);
  }

  void setLVL(int l) {
    LVL = l;
  }

  void setEXP(int e) {
    EXP = e;
  }

  void setPTS(int p) {
    PTS = p;
  }

  void attack(Being other) {
    other.setHP(other.getHP() - getSTR());
  }

  void pickUp(Item it) {
    if (in.add(it)) {
      it.pickUp();
    }
  }

  void updateEquiptment() {
    equiptment.setSTR(in.getHelm().getSTR() + in.getArms().getSTR() + in.getLegs().getSTR() + in.getChest().getSTR() + in.getWeapon().getSTR());
    equiptment.setDEX(in.getHelm().getDEX() + in.getArms().getDEX() + in.getLegs().getDEX() + in.getChest().getDEX() + in.getWeapon().getDEX());
    equiptment.setINT(in.getHelm().getINT() + in.getArms().getINT() + in.getLegs().getINT() + in.getChest().getINT() + in.getWeapon().getINT());
  }

  void drop(int inInd) {
    in.drop(inInd);
  }

  String getStats() {
    return getName() + " " + getHP() + " HP\n " + " STR: " + getSTR()  + " DEX: " + getDEX() + " INT: " + getINT();
  }
}

