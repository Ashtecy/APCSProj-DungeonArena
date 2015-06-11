class Adventurer extends Being {

  private int LVL, MP, EXP, PTS;
  protected Inventory inv;// = new Inventory(20);
  private Stats stats, equiptment;
  protected boolean furySwipes, magicalStrike, shield, sweepingStrike;

  Adventurer(String name, int x, int y, int str, int dex, int in) {
    super(name, x, y);
    stats = new Stats(str, dex, in);
    equiptment = new Stats(0, 0, 0);
    inv = new Inventory(16);
    setLVL(1);
    setEXP(0);
    setHP(500);
    setMaxHP(500);
    setImage("man.png");
    furySwipes = false;
    magicalStrike = false;
    shield = false;
    sweepingStrike = false;
  }

  Adventurer(String name, int x, int y) {
    this(name, x, y, 10, 10, 10);
  }

  void draw() {
    imageMode(CENTER);
    image(W, tileSize*(3.5), tileSize*(3.5), 0.8*tileSize, 0.8*tileSize);
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

  int getMP() {
    return MP;
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

  void setMP(int m) {
    MP = m;
  }

  void setLVL(int l) {
    LVL = l;
  }

  void setHP(int newHP) {
    if (!shield) {
      super.setHP(newHP);
    } else {
      shield = false;
    }
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

  void attack(Dungeon d, Being other) {
    if (furySwipes) {
      furySwipes(d, other);
    } else if (magicalStrike) {
      magicalStrike(d, other);
    } else if (sweepingStrike) {
      sweepingStrike(d);
    } else if (isInRange(other, 1) && Math.random() < Math.pow((double)getDEX() / (double)(getDEX() + 2), 2)) {
      other.setHP(other.getHP() - getSTR());
    }
    if (other.getHP() <= 0) {
      other.die(d);
    }
  }

  void queueShield() {
    shield = true;
  }

  void furySwipes(Dungeon d, Being other) {
    do {
      furySwipes = false;
      attack(d, other);
    } 
    while (Math.random () < getINT() / 50.0);
  }

  void queueFurySwipes() {
    furySwipes = true;
  }

  void magicalStrike(Dungeon d, Being other) {
    magicalStrike = false;
    setSTR(getSTR() + getINT());
    attack(d, other);
    setSTR(getSTR() - getINT());
  }

  void queueMagicalStrike() {
    magicalStrike = true;
  }

  void sweepingStrike(Dungeon d) {
    sweepingStrike = false;
    for (int r = -1; r < 2; r++) {
      if (getY() + r >= 0 && getY() + r < d.getWidth()) {
        for (int c = -1; c < 2; c++) {
          if (getX() + c >= 0 && getX() + c < d.getHeight() && d.getTile(getX() + r, getY() + c).occupant() != null) {
            attack(d, d.getTile(getX() + r, getY() + c).occupant());
          }
        }
      }
    }
  }

  void queueSweepingStrike() {
    sweepingStrike = true;
  }

  void pickUp(Item it) {
    inv.add(it);
  }

  void use(int ind) {
    if (inv.get(ind) != null) {
      inv.use(ind, this);
    }
  }

  void updateStats() {
    equiptment.setSTR(0);
    equiptment.setINT(0);
    equiptment.setDEX(0);
    inv.getHelm().applyBuffs(equiptment);
    inv.getLegs().applyBuffs(equiptment);
    inv.getArms().applyBuffs(equiptment);
    inv.getChest().applyBuffs(equiptment);
    inv.getWeapon().applyBuffs(equiptment);
  }

  void drop(int inInd, Tile t) {
    inv.drop(inInd, t, getX(), getY());
    updateStats();
  }
}

