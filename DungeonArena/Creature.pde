class Creature extends Being {

  Creature(String name, int level, int x, int y, PImage i, PImage[] imgs) {
    super(name, x, y, i, imgs);
  }

  void attack(Being other) {
    if (Math.random() < 0.75) {
      other.setHP((int)(other.getHP() - 1  - Math.random() * 3));
    }
  }
  
}

