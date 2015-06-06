class Adventurer extends Being {

  private int LVL, EXP, PTS;
  protected Inventory inv;// = new Inventory(20);
  private Stats stats, equiptment;

  Adventurer(String name, int x, int y, int str, int dex, int in) {
    super(name, x, y);
    stats = new Stats(str, dex, in);
    equiptment = new Stats(0, 0, 0);
    inv = new Inventory(20);
    setLVL(1);
    setEXP(0);
    setImage("man.png");
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
    if (isInRange(other, 1)) {
      other.setHP(other.getHP() - getSTR());
      if (other.getHP() <= 0) {
        other.die();
      }
    }
  }

  void pickUp(Item it) {
    inv.add(it);
  }

  void useConsumable(int ind) {
    if (inv.use(ind) != null) {
      inv.use(ind).use(this);
    }
    
    System.out.println("AB");
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

  void drop(int inInd) {
    inv.drop(inInd);
  }
}

