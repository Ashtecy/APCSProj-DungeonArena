class Adventurer extends Being {

  private int STR, DEX, INT;

  Adventurer(String name, int h, int x, int y, int str, int dex, int in) {
    super(name, h, x, y);
    setSTR(str);
    setDEX(dex);
    setINT(in);
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

  void setSTR(int s) {
    STR = s;
  }

  void setDEX(int d) {
    DEX = d;
  }

  void setINT(int i) {
    INT = i;
  }

  void attack(Being other) {
    other.setHP(other.getHP() - getSTR());
  }

  String getStats() {
    return getName() + " " + getHP() + " HP\n " + " STR: " + getSTR()  + " DEX: " + getDEX() + " INT: " + getINT();
  }

  void stamp() {
    ellipse(getX(), getY(), 20, 20);
  }
}

