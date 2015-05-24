abstract class Being extends MapObject {
  private String name;
  private int maxHP, HP;
  private boolean isAlive;

  Being() {
    this("", 10, 10, 10);
  }

  Being(String n, int h, int x, int y) {
    super(x,y,64);
    setName(n);
    setMaxHP(h);
    setHP(h);
    isAlive = true;
  }

  String getName() {
    return name;
  }

  int getHP() {
    return HP;
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

  void setMaxHP(int h) {
    maxHP = h;
  }

  String toString() {
    return getName();
  }

  String getStats() {
    return getName() + " " + getHP() + " HP";
  }

  void move(int x, int y) {
    setXY(x, y);
  }

  abstract void attack(Being other);
}     

