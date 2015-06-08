abstract class Being extends MapObject {

  private Dungeon dun;
  private int maxHP, HP;
  private boolean isAlive;
  private int range, sight;

  Being() {
    this("", 10, 10);
  }

  Being(String n, int x, int y) {
    super(n, x, y);
    setMaxHP(20);
    setHP(20);
    isAlive = true;
    range = 1;
    sight = 3;
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

  void attack(Being other) {
    other.setHP((int)(other.getHP() - 1  - Math.random() * 3));
  }

  void act(Dungeon d) {
    Adventurer a = d.getGuy();
    int xf = getX();
    int yf = getY();    
    d.getTile(getX(), getY()).setOccupant(null);
    if (isInRange(a, sight)) {
      if (isInRange(a, range)) {
        attack(a);
      } else {
        if (a.getX() > getX()) {
          xf = getX() + 1;
        } else if (a.getX() < getX()) {
          xf = getX() - 1;
        }
        if (xf < 0 || xf >= d.getWidth() || d.getTile(xf, yf).isWall() || d.getTile(xf, yf).occupant() != null) {
          xf = getX();
        }
        if (a.getY() > getY()) {
          yf = getY() + 1;
        } else if (a.getY() < getY()) {
          yf = getY() - 1;
        }
        if (yf < 0 || yf >= d.getHeight() || d.getTile(xf, yf).isWall() || d.getTile(xf, yf).occupant() != null) {
          yf = getY();
        }
        setXY(xf, yf);
      }
    }
    d.getTile(getX(), getY()).setOccupant(this);
  }

  boolean isInRange (Being b, int rad) {
    if (Math.abs(b.getX() - getX()) <= rad && Math.abs(b.getY() - getY()) <= rad) {
      return true;
    } else {
      return false;
    }
  }

  void die(Dungeon d) {
    if (Math.random() < 0.25) {
      d.getTile(getX(), getY()).addDrop(new Consumable(getX(), getY()));
    }
    if (Math.random() < 0.05) {
      d.getTile(getX(), getY()).addDrop(new Equiptment("Stolen Armor", (int)(1 + Math.random() * 5), getX(), getY()));
    }
    d.getTile(getX(), getY()).setOccupant(null);
    for (int i = 0; i < d.getMonsters().size(); i++) {
      if (d.getMonsters().get(i).equals(this)) {
        d.getMonsters().remove(i);
      }
    }
  }

  void drop(Dungeon d, Item drop) {
    getTile(d, getX(), getY()).addDrop(drop);
  }

  Tile getTile(Dungeon d, int x, int y) {
    return d.getTile(x, y);
  }
}     

