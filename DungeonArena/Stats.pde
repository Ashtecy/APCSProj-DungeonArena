class Stats {

  private int STR, DEX, INT;

  Stats() {
    this(0,0,0);
  }

  Stats(int s, int d, int i) {
    setSTR(s);
    setDEX(d);
    setINT(i);
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
}

