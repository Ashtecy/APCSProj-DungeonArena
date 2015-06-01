class Adventurer extends Being {

  private int LVL, EXP, PTS;
  Inventory in;
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

  void levelUp() {
    LVL++;
    EXP = 0;
    PTS = 3;
  }

  void attack(Being other) {
    other.setHP(other.getHP() - getSTR());
    if (other.getHP() <= 0) {
      other.die();
    }
  }

  void pickUp(Item it) {
    if (in.add(it)) {
      it.pickUp();
    }
  }

  void updateStats() {
    equiptment.setSTR(0);
    equiptment.setINT(0);
    equiptment.setDEX(0);
    in.getHelm().applyBuffs(equiptment);
    in.getLegs().applyBuffs(equiptment);
    in.getArms().applyBuffs(equiptment);
    in.getChest().applyBuffs(equiptment);
    in.getWeapon().applyBuffs(equiptment);
  }

  void drop(int inInd) {
    in.drop(inInd);
  }

  String getStats() {
    return getName() + " " + getHP() + " HP\n " + " STR: " + getSTR()  + " DEX: " + getDEX() + " INT: " + getINT();
  }
}

