class Adventurer extends Being {

  private int STR, DEX, INT, LVL, EXP, PTS;

  Adventurer(String name, int h, int x, int y) {
    this(name, h, x, y, 10, 10, 10);
  }

  Adventurer(String name, int h, int x, int y, int str, int dex, int in) {
    super(name, h, x, y);
    setSTR(str);
    setDEX(dex);
    setINT(in);
    setEXP(0);
  }

  int getSTR() {
    return STR;
  }

  int getDEX() {
    return DEX;
  }

  int getINT() {
    return INT;
  }

  int getEXP() {
    return EXP;
  }

  int getPTS() {
    return PTS;
  }

  void setSTR(int s) {
    STR = s;
  }

  void setDEX(int d) {
    DEX = d;
  }

  void setINT(int i) {
    INT = i;
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

  String getStats() {
    return getName() + " " + getHP() + " HP\n " + " STR: " + getSTR()  + " DEX: " + getDEX() + " INT: " + getINT();
  }
}

