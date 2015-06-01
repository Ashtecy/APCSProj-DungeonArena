abstract class Being extends MapObject {

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

  void act(Dungeon d) {
  /*  if (adventurer is in range) {
    } else if (adventuer is in sight) {
      //move towards adventurer
    }*/
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

