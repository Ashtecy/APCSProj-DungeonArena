abstract class Being extends MapObject {

  private Dungeon dun;
  private int maxHP, HP;
  private boolean isAlive;
  private int range, sight;

  Being() {
    this("Thing", 10, 10, 10);
  }

  Being(String n, int h, int x, int y) {
    super(n, x, y, 64);
    setMaxHP(h);
    setHP(h);
    isAlive = true;
    range = 1;
    sight = 5;
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

  void attack(Being other) {
    other.setHP((int)(other.getHP() - 1  - Math.random() * 5));
  }

  void act(Dungeon d) {
    Adventurer a = d.getAdventurer();
    if (isInRange(a, sight)) {
      if (isInRange(a, range)) {
        attack(a);
      } else {
        if (a.getX() > getX()) {
          move(getX() + 1, getY());
        } else if (a.getX() < getX()) {
          move(getX() - 1, getY());
        }
        if (a.getY() > getY()) {
          move(getX(), getY() + 1);
        } else {
          move(getX(), getY() - 1);
        }
      }
    } else {
      move(getX(), getY());
    }
  }

  boolean isInRange (Being b, int rad) {
    if (b.getX() - getX() <= rad && b.getY() - getY() <= rad) {
      return true;
    } else {
      return false;
    }
  }

  void die() {
    //drop an item
      }

  void drop(Dungeon d, Item drop) {
    getTile(d, getX(), getY()).addDrop(drop);
  }

  Tile getTile(Dungeon d, int x, int y) {
    return d.getTile(x, y);
  }
}     

