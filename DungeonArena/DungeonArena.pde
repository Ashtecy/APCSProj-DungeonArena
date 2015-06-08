import java.util.Random;
protected Dungeon arena;
protected int MODE;
protected long seed;
protected Random r =  new Random();
protected int tileSize=80;
protected int trackInventory;
protected PImage Title, P1, P2, L, S;

void setup() {
  size(960, 800);
  background(255);
  MODE=0;
  Title = loadImage("Title.png");
  P1 = loadImage("play1.png");
  P2 = loadImage("play2.png");
  L = loadImage("loading.png");
  S = loadImage("side.png");
  arena = new Dungeon(30, 30, seed, tileSize);
  trackInventory = 0;
}

void draw() {
  if (MODE==0) {
    background(0);
    imageMode(CENTER);
    image(Title, 480, 150, 850, 120);
    Button play = new Button(P1, P2, 480, 350);
    play.draw();
    if (mousePressed) {
      if (play.getIsOver()) {
        loadingScreen();
        MODE=1;
      }
    }
  } else if (MODE==1) {
    arena.draw();
    sideScreen();
  } else if (MODE==2) {
    scoreScreen();
  }
}

void keyPressed() {
  Adventurer guy = arena.getGuy();
  if (keyCode==8 && MODE==1) {
    seed=System.currentTimeMillis();
    MODE=0;
  }
  if (keyCode==32) {
    int x = guy.getX();
    int y = guy.getY();
    Item topDrop = arena.getTile(x, y).removeDrop();
    if (topDrop != null) {
      guy.pickUp(topDrop);
    }
  }
  if (keyCode == 81 && trackInventory > 0) {//scrolling through inventory < q
    trackInventory --;
  }
  if (keyCode == 87 && trackInventory < guy.inv.size() - 1) {//scrolling through inventory > w
    trackInventory ++;
  }
  if (keyCode == 69 && guy.inv.get(trackInventory) != null) {//e to use/equipt
    guy.use(trackInventory);
  }
  if (keyCode == 68) { //d to drop
    guy.drop(trackInventory, arena.getTile(guy.getX(), guy.getY()));
  }
  if (keyCode==97) {
    if (!arena.getMap()[guy.getX()-1][guy.getY()+1].isWall()) {
      guy.setXY(guy.getX()-1, guy.getY()+1);
    }
  } else if (keyCode==98) {
    if (arena.getMap()[guy.getX()][guy.getY()+1].isWall()==false) {
      guy.setY(guy.getY()+1);
    }
  } else if (keyCode==99) {
    if (arena.getMap()[guy.getX()+1][guy.getY()+1].isWall()==false) {
      guy.setXY(guy.getX()+1, guy.getY()+1);
    }
  } else if (keyCode==100) {
    if (arena.getMap()[guy.getX()-1][guy.getY()].isWall()==false) {
      guy.setX(guy.getX()-1);
    }
  } else if (keyCode==102) {
    if (arena.getMap()[guy.getX()+1][guy.getY()].isWall()==false) {
      guy.setX(guy.getX()+1);
    }
  } else if (keyCode==103) {
    if (arena.getMap()[guy.getX()-1][guy.getY()-1].isWall()==false) {
      guy.setXY(guy.getX()-1, guy.getY()-1);
    }
  } else if (keyCode==104) {
    if (arena.getMap()[guy.getX()][guy.getY()-1].isWall()==false) {
      guy.setY(guy.getY()-1);
    }
  } else if (keyCode==105) {
    if (arena.getMap()[guy.getX()+1][guy.getY()-1].isWall()==false) {
      guy.setXY(guy.getX()+1, guy.getY()-1);
    }
  }
}

void loadingScreen() {
  background(0);
  imageMode(CORNER);
  image(L, 625, 690, 300, 60);
}

void sideScreen() {
  Adventurer guy = arena.getGuy();
  imageMode(CORNER);
  for (int i=0; i<800; i+=128) {
    for (int j=560; j<960; j+=128) {
      image(S, j, i, 128, 128);
    }
  }
  for (int i = 0; i < guy.inv.size (); i++) {
    if (i == trackInventory) {
      fill(120, 120, 120, 120);
      rect(560 + (i % 4) * 100, height / 4 + 100 + (i / 4) * 100, 100, 100);
    }
    if (guy.inv.get(i).isEquipped) {
      fill(200, 200, 100, 120);
      rect(560 + (i % 4) * 100, height / 4 + 100 + (i / 4) * 100, 100, 100);
    }
    image(guy.inv.get(i).getImage(), 560 + (i % 4) * 100, height / 4 + 100 + (i / 4) * 100, 100, 100);
  }
  fill(255);
  textSize(18);
  image(guy.getImage(), 560, height / 4, 100, 100);
  text(guy.getName() + " the Adventurer", 660, height / 4); 
  text(guy.getHP() + " / " + guy.getMaxHP() + " HP", 660, height / 4 + 20); 
  text(guy.getSTR() + "STR", 660, height / 4 + 40);  
  text(guy.getDEX() + "DEX", 660, height / 4 + 60);  
  text(guy.getINT() + "INT", 660, height / 4 + 80);  
  imageMode(CENTER);
  image(Title, 760, 100, 250, 80);
}

void scoreScreen() {
  fill(100, 100, 100, 20);
  rect(10, 10, width - 20, height - 20);
  imageMode(CENTER);
  image(arena.getGuy().getImage(), width / 2, height / 4);
  textSize(20);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(arena.getGuy().getStats(), width / 2, height / 2);
}

