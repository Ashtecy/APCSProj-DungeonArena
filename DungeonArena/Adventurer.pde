class Adventurer extends Being {

  private int LVL, MP, maxMP, EXP, maxEXP, PTS, steps;
  protected Inventory inv;// = new Inventory(20);
  private Stats stats, equiptment;
  protected boolean furySwipes, magicalStrike, shield, sweepingStrike;
  protected PImage[] slash;

  Adventurer(String name, int x, int y, int level) {
    super(name, x, y);
    stats = new Stats(10 + level, 10 + level, 10 + level);
    equiptment = new Stats(0, 0, 0);
    inv = new Inventory(16);
    setLVL(level);
    setEXP(0);
    setHP(45 + 5 * level);
    setMP(18 + 2 * level);
    setEXP(0);
    setMaxHP(getHP());
    setMaxMP(getMP());
    setMaxEXP(40);
    setImage("man.png");
    steps = 0;
    /*
    slash = new PImage[4];
     slash[0] = loadImage("slashQ1.png");
     slash[1] = loadImage("slashQ2.png");
     slash[2] = loadImage("slashQ3.png");
     slash[3] = loadImage("slashQ4.png");*/
    magicalStrike = false;
    shield = false;
    sweepingStrike = false;
  }

  Adventurer(String name, int x, int y) {
    this(name, x, y, 1);
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

  int getMaxEXP() {
    return maxEXP;
  }

  int getPTS() {
    return PTS;
  }

  int getMP() {
    return MP;
  }

  int getMaxMP() {
    return maxMP;
  }

  int getLVL() {
    return LVL;
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

  void setMaxMP(int m) {
    maxMP = m;
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

  void setMaxEXP(int e) {
    maxEXP =  e;
  }

  void setPTS(int p) {
    PTS = p;
  }

  void levelUp() {
    LVL++;
    setSTR(getSTR() + 2);
    setDEX(getDEX() + 2);
    setINT(getINT() + 2);
    setMaxHP(getMaxHP() + 5);
    setHP(getMaxHP());
    setMaxMP(getMaxMP());
    setMP(getMaxMP());
    setEXP(getEXP() % getMaxEXP());
    setMaxEXP((int)((float)getMaxEXP() * 1.4));
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
      //  imageMode(CENTER);
    }
    if (other.getHP() <= 0) {
      other.die(d);
      setEXP(getEXP() + 20);
      if (getEXP() >= getMaxEXP()){
       levelUp(); 
      }
    }
  }

  void queueShield() {
    if (getMP() >= 10) {
      shield = true;
      setMP(getMP() - 10);
    }
  }

  void furySwipes(Dungeon d, Being other) {
    do {
      furySwipes = false;
      attack(d, other);
    } 
    while (Math.random () < getINT() / 50.0);
  }

  void queueFurySwipes() {
    if (getMP() >= 10  && !(sweepingStrike || magicalStrike)) {
      furySwipes = true;
      setMP(getMP() - 10);
    }
  }

  void magicalStrike(Dungeon d, Being other) {
    magicalStrike = false;
    setSTR(getSTR() + getINT());
    attack(d, other);
    setSTR(getSTR() - getINT());
  }

  void queueMagicalStrike() {
    if (getMP() >= 10 && !(furySwipes || sweepingStrike)) {
      magicalStrike = true;
      setMP(getMP() - 10);
    }
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
    if (getMP() >= 15 && !(furySwipes || magicalStrike)) {
      sweepingStrike = true;
      setMP(getMP() - 15);
    }
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

  void setXY(int x, int y) {
    super.setXY(x, y);
    steps++;
    if (steps % 5 == 0) {
      if (getHP() < getMaxHP()) {
        setHP(getHP() + 1);
      }
      if (getMP() < getMaxMP()) {
        setMP(getMP() + 1);
      }
    }
  }
}

