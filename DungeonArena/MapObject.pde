class MapObject {


  protected int rows=12,cols=15;
  protected int x,y,tileSize;
  protected String name;
  protected PImage W = loadImage("mace.png");

  MapObject(String name, int x, int y, int tileSize) {
    setXY(x, y);
    this.name = name;
    this.tileSize=tileSize;
  }

  int getX () {
    return x;
  }

  int getY () {
    return y;
  }

  void setX (int newX) {
    if(newX!=0 && newX!=cols*tileSize){
      x = newX;
    }
  }

  void setY (int newY) {
    if(newY!=0 && newY!=rows*tileSize){
      y = newY;
    }
  }

  void setXY (int newX, int newY) {
    setX(newX);
    setY(newY);
  }

  void draw() {
    imageMode(CENTER);
    image(W,x+(tileSize/2),y+(tileSize/2),0.75*tileSize,0.75*tileSize);
  }

  //abstract void stamp();
}

