class Creature extends Being {

  Creature(String name, int level, int x, int y) {
    super(name, x, y);
    setImage("creature.png");
  }

  void attack(Being other) {
    if (Math.random() < 0.75) {
      other.setHP((int)(other.getHP() - 1  - Math.random() * 3));
    }
  }
  
}

