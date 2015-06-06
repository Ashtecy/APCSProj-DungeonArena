class MapObject {

  protected int rows=12, cols=15;
  protected int x, y, tileSize=80;
  protected String name;
  protected PImage W;

  MapObject(String name, int x, int y) {
    setXY(x, y);
    this.name = name;
    setImage("mace.png");
  }

  int getX () {
    return x;
  }

  int getY () {
    return y;
  }

  void setX (int newX) {
    if (newX > 0 && newX < cols*tileSize) {
      x = newX;
    }
  }

  void setY (int newY) {
    if (newY > 0 && newY < rows*tileSize) {
      y = newY;
    }
  }

  void setXY (int newX, int newY) {
    setX(newX);
    setY(newY);
  }

  void setImage(String src) {
    W = loadImage(src);
  }

  PImage getImage() {
    return W;
  }

  void draw() {
    imageMode(CENTER);
    image(W, tileSize*x+tileSize/2, tileSize*y+tileSize/2, 0.75*tileSize, 0.75*tileSize);
  }
}

