class Equiptment extends Item {

  protected Stats stats;

  Equiptment(String name, int xi, int yi, int size) {
    super("Equiptment", xi, yi, size);
    stats = new Stats();
  }
  
}

