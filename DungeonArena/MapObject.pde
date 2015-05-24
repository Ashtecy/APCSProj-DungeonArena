abstract class MapObject {

  private int xpos, ypos;

  MapObject(int x, int y) {
    setXY(x, y);
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

  abstract void stamp();
}

