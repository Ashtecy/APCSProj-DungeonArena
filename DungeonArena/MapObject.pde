class MapObject {

  private int xpos, ypos,tileRadius;
  protected String name;
  protected PImage W;

  MapObject(int x, int y,int tileSize) {
    setXY(x, y);
    name="Axe of Test Cases";
    tileRadius=tileSize/2;
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
  
  void draw(){
    imageMode(CENTER);
    W=loadImage("mace.png");
    image(W,xpos+tileRadius,ypos+tileRadius,tileRadius,tileRadius);
  }

  //abstract void stamp();
}

