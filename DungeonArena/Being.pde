abstract class Being {
  private String name;
  private int maxHP, HP, STR, DEX, INT;

  Being() {
    this("", 10, 10, 10, 10);
  }

  Being(String n, int h, int str, int dex, int man) {
    setName(n);
    setMaxHP(h);
    setHP(h);
    setSTR(10);
    setDEX(10);
    setINT(10);
  }

  String getName() {
    return name;
  }

  int getHP() {
    return HP;
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

  int getMaxHP() {
    return maxHP;
  }

  void setName(String newName) {
    name = newName;
  }

  void setHP(int newHP) {
    HP = newHP;
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

  void setMaxHP(int h) {
    maxHP = h;
  }

  String toString() {
    return getName();
  }

  String getStats() {
    return getName() + " " + getHP() + " HP\n " + " STR: " + getSTR()  + " DEX: " + getDEX() + " INT: " + getINT();
  }
  
  abstract void stamp();

  abstract void reset();

  abstract void rest();

  abstract void attack(Being other);
}     

