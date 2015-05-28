class MapObject {

  protected int rows=12,cols=15;
  protected int xpos,ypos,tileSize;
  protected String name;
  protected PImage W = loadImage("mace.png");

  MapObject(int x, int y,int tileSize) {
    setXY(x, y);
    name="Axe of Test Cases";
    this.tileSize=tileSize;
  }

  int getX () {
    return xpos;
  }

  int getY () {
    return ypos;
  }

  void setX (int newX) {
    if(newX!=0 && newX!=cols*tileSize){
      xpos = newX;
    }
  }

  void setY (int newY) {
    if(newY!=0 && newY!=rows*tileSize){
      ypos = newY;
    }
  }

  void setXY (int newX, int newY) {
    setX(newX);
    setY(newY);
  }
  
  void draw(){
    imageMode(CENTER);
    image(W,xpos+(tileSize/2),ypos+(tileSize/2),0.75*tileSize,0.75*tileSize);
  }

  //abstract void stamp();
}

