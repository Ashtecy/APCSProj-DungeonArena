class MapObject {

  private int xpos, ypos, tileRadius;
  protected String name;
  protected PImage W;

  MapObject(String name, int x, int y, int tileSize) {
    setXY(x, y);
    this.name = name;
    tileRadius=tileSize/2;
    W=loadImage("mace.png");
  }

  int getX () {
    return xpos;
  }

  int getY () {
    return ypos;
  }

  void setX (int newX) {
    xpos = newX;
  }

  void setY (int newY) {
    ypos = newY;
  }

  void setXY (int newX, int newY) {
    setX(newX);
    setY(newY);
  }

  PImage getImage() {
    return W;
  }

  void draw() {
    imageMode(CENTER);
    //    W=loadImage("mace.png");
    image(W, xpos+tileRadius, ypos+tileRadius, tileRadius, tileRadius);
  }
}

