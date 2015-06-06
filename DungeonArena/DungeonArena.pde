import java.util.Random;
protected Dungeon arena;
protected int MODE;
protected long seed;
protected Random r =  new Random();
protected int tileSize=80;
protected PImage Title;
protected PImage P1;
protected PImage P2;
protected PImage L;
protected PImage S;

void setup() {
  size(960, 800);
  background(255);
  MODE=0;
  Title = loadImage("Title.png");
  P1 = loadImage("play1.png");
  P2 = loadImage("play2.png");
  L = loadImage("loading.png");
  S = loadImage("side.png");
  arena = new Dungeon(12, 15, seed, tileSize);
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
  if (keyCode==8 && MODE==1) {
    seed=System.currentTimeMillis();
    MODE=0;
  }
  if (keyCode==32) {
    int x = arena.getGuy().getX();
    int y = arena.getGuy().getY();
    Item topDrop = arena.getTile(x, y).removeDrop();
    if (topDrop != null) {
      arena.getGuy().pickUp(topDrop);
    }
  }
  if (keyCode==97) {
    if (!arena.getMap()[arena.getGuy().getX()-1][arena.getGuy().getY()+1].isWall()) {
      arena.getGuy().setXY(arena.getGuy().getX()-1, arena.getGuy().getY()+1);
    }
  } else if (keyCode==98) {
    if (arena.getMap()[arena.getGuy().getX()][arena.getGuy().getY()+1].isWall()==false) {
      arena.getGuy().setY(arena.getGuy().getY()+1);
    }
  } else if (keyCode==99) {
    if (arena.getMap()[arena.getGuy().getX()+1][arena.getGuy().getY()+1].isWall()==false) {
      arena.getGuy().setXY(arena.getGuy().getX()+1, arena.getGuy().getY()+1);
    }
  } else if (keyCode==100) {
    if (arena.getMap()[arena.getGuy().getX()-1][arena.getGuy().getY()].isWall()==false) {
      arena.getGuy().setX(arena.getGuy().getX()-1);
    }
  } else if (keyCode==102) {
    if (arena.getMap()[arena.getGuy().getX()+1][arena.getGuy().getY()].isWall()==false) {
      arena.getGuy().setX(arena.getGuy().getX()+1);
    }
  } else if (keyCode==103) {
    if (arena.getMap()[arena.getGuy().getX()-1][arena.getGuy().getY()-1].isWall()==false) {
      arena.getGuy().setXY(arena.getGuy().getX()-1, arena.getGuy().getY()-1);
    }
  } else if (keyCode==104) {
    if (arena.getMap()[arena.getGuy().getX()][arena.getGuy().getY()-1].isWall()==false) {
      arena.getGuy().setY(arena.getGuy().getY()-1);
    }
  } else if (keyCode==105) {
    if (arena.getMap()[arena.getGuy().getX()+1][arena.getGuy().getY()-1].isWall()==false) {
      arena.getGuy().setXY(arena.getGuy().getX()+1, arena.getGuy().getY()-1);
    }
  }
}

void loadingScreen() {
  background(0);
  imageMode(CORNER);
  image(L, 625, 690, 300, 60);
}

void sideScreen() {
  for (int i=0; i<800; i+=128) {
    for (int j=560; j<960; j+=128) {
      imageMode(CORNER);
      image(S, j, i, 128, 128);
    }
  }    
  for (int i = 0; i < arena.getGuy ().inv.size(); i++) {
    image(arena.getGuy().inv.use(i).getImage(), 560 + (i % 4) * 100, height / 4 + (i / 4) * 100, 100, 100);
  }
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

