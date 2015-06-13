import java.util.Random;
protected Dungeon arena;
protected int MODE;
protected long seed;
protected Random r =  new Random();
protected int tileSize=80;
protected int trackInventory;
protected PImage Title, P1, P2, L, S, T;
protected DialogueBox dialogue;

void setup() {
  size(960, 800);
  background(255);
  MODE=0;
  Title = loadImage("Title.png");
  P1 = loadImage("play1.png");
  P2 = loadImage("play2.png");
  L = loadImage("loading.png");
  S = loadImage("side.png");
  T = loadImage("text.png");
  arena = new Dungeon(20, 20, seed, tileSize);
  trackInventory = 0;
  dialogue = new DialogueBox();
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
    textBox();
  } else if (MODE==2) {
    scoreScreen();
  }
}

void keyPressed() {
  if (MODE == 1) {
    Adventurer guy = arena.getGuy();
    if (keyCode==8 && MODE==1) {
      seed=System.currentTimeMillis();
      MODE=0;
    }
    if (keyCode==32) {//spacebar
      int x = guy.getX();
      int y = guy.getY();
      Item topDrop = arena.getTile(x, y).removeDrop();
      if (topDrop != null  && guy.inv.size() < guy.inv.getCap()) {
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
    if (keyCode == 90) {// z
      guy.queueFurySwipes();
    }
    if (keyCode == 88) {// x 
      guy.queueMagicalStrike();
    }
    if (keyCode == 67) {// c 
      guy.queueShield();
    }
    if (keyCode == 86) {// v 
      guy.queueSweepingStrike();
    }
    if (keyCode==97) {
      if (arena.getMap()[guy.getX()-1][guy.getY()+1].occupant() != null) {
        guy.attack(arena, arena.getMap()[guy.getX()-1][guy.getY()+1].occupant());
      } else if (!arena.getMap()[guy.getX()-1][guy.getY()+1].isWall()) {
        guy.setXY(guy.getX()-1, guy.getY()+1);
      }
    } else if (keyCode==98) {
      if (arena.getMap()[guy.getX()][guy.getY()+1].occupant() != null) {
        guy.attack(arena, arena.getMap()[guy.getX()][guy.getY()+1].occupant());
      } else if (!arena.getMap()[guy.getX()][guy.getY()+1].isWall()) {
        guy.setY(guy.getY()+1);
      }
    } else if (keyCode==99) {
      if (arena.getMap()[guy.getX()+1][guy.getY()+1].occupant() != null) {
        guy.attack(arena, arena.getMap()[guy.getX()+1][guy.getY()+1].occupant());
      } else if (!arena.getMap()[guy.getX()+1][guy.getY()+1].isWall()) {
        guy.setXY(guy.getX()+1, guy.getY()+1);
      }
    } else if (keyCode==100) {
      if (arena.getMap()[guy.getX()-1][guy.getY()].occupant() != null) {
        guy.attack(arena, arena.getMap()[guy.getX()-1][guy.getY()].occupant());
      } else if (!arena.getMap()[guy.getX()-1][guy.getY()].isWall()) {
        guy.setX(guy.getX()-1);
      }
    } else if (keyCode==102) {
      if (arena.getMap()[guy.getX()+1][guy.getY()].occupant() != null) {
        guy.attack(arena, arena.getMap()[guy.getX()+1][guy.getY()].occupant());
      } else if (!arena.getMap()[guy.getX()+1][guy.getY()].isWall()) {
        guy.setX(guy.getX()+1);
      }
    } else if (keyCode==103) {
      if (arena.getMap()[guy.getX()-1][guy.getY()-1].occupant() != null) {
        guy.attack(arena, arena.getMap()[guy.getX()-1][guy.getY()-1].occupant());
      } else if (!arena.getMap()[guy.getX()-1][guy.getY()-1].isWall()) {
        guy.setXY(guy.getX()-1, guy.getY()-1);
      }
    } else if (keyCode==104) {
      if (arena.getMap()[guy.getX()][guy.getY()-1].occupant() != null) {
        guy.attack(arena, arena.getMap()[guy.getX()][guy.getY()-1].occupant());
      } else if (!arena.getMap()[guy.getX()][guy.getY()-1].isWall()) {
        guy.setY(guy.getY()-1);
      }
    } else if (keyCode==105) {
      if (arena.getMap()[guy.getX()+1][guy.getY()-1].occupant() != null) {
        guy.attack(arena, arena.getMap()[guy.getX()+1][guy.getY()-1].occupant());
      } else if (!arena.getMap()[guy.getX()+1][guy.getY()-1].isWall()) {
        guy.setXY(guy.getX()+1, guy.getY()-1);
      }
    }
    arena.creatureMove();
    if (guy.getHP() <= 0) {
      MODE = 2;
    }
  } else if (MODE == 2) {
    if (keyCode == 32) {
      setup();
    }
  }
}

void loadingScreen() {
  background(0);
  imageMode(CORNER);
  image(L, 625, 720, 300, 60);
}

void sideScreen() {
  Adventurer guy = arena.getGuy();
  imageMode(CORNER);
  for (int i=0; i<800; i+=80) {
    for (int j=560; j<960; j+=80) {
      image(S, j, i, 80, 80);
    }
  }
  for (int i = 0; i < guy.inv.size (); i++) {
    if (i == trackInventory) {
      fill(120, 120, 120, 120);
      rect(560 + (i % 4) * 100, height / 4 + 200 + (i / 4) * 100, 100, 100);
    }
    if (guy.inv.get(i).isEquipped) {
      fill(200, 200, 100, 120);
      rect(560 + (i % 4) * 100, height / 4 + 200 + (i / 4) * 100, 100, 100);
    }
    image(guy.inv.get(i).getImage(), 560 + (i % 4) * 100, height / 4 + 200 + (i / 4) * 100, 100, 100);
  }
  textAlign(LEFT);
  fill(255);
  text("z \n10 MP", 560, height / 4 + 120);
  text("x \n10 MP", 660, height / 4 + 120);
  text("c \n10 MP", 760, height / 4 + 120);
  text("v \n10 MP", 860, height / 4 + 120);
  fill(50, 50, 50);
  if (guy.furySwipes) {
    rect(560, height / 4 + 100, 100, 100);
  }
  if (guy.magicalStrike) {
    rect(660, height / 4 + 100, 100, 100);
  }
  if (guy.shield) {
    rect(760, height / 4 + 100, 100, 100);
  }
  if (guy.sweepingStrike) {
    rect(860, height / 4 + 100, 100, 100);
  }
  fill(255);
  textSize(18);
  textAlign(LEFT);
  image(guy.getImage(), 560, height / 4, 100, 100);
  text(guy.getName() + " the Level " + guy.getLVL() + " Adventurer", 660, height / 4); 
  text(guy.getHP() + " / " + guy.getMaxHP() + " HP, " + guy.getMP() + " / " + guy.getMaxMP() + " MP", 660, height / 4 + 20); 
  text(guy.getSTR() + "STR, " + guy.getEXP() + " / " + guy.getMaxEXP() + " EXP" , 660, height / 4 + 40);  
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
  image(Title, 760, 100, 250, 80);
  text(arena.getGuy().getName() + " the Adventurer, may he rest in pieces", width / 2, height / 2 + 20); 
  text(arena.getGuy().getHP() + " / " + arena.getGuy().getMaxHP() + " HP", width / 2, height / 2 + 40); 
  text(arena.getGuy().getSTR() + " STR", width / 2, height / 2 + 60);  
  text(arena.getGuy().getDEX() + " DEX", width / 2, height / 2 + 80);  
  text(arena.getGuy().getINT() + " INT", width / 2, height / 2 + 100); 
  text("Press SPACEBAR to start a new game", width / 2, height / 2 + 120);
}

void textBox() {
  imageMode(CORNER);
  for (int i=560; i<800; i+=tileSize) {
    for (int j=0; j<tileSize*7; j+=tileSize) {
      image(T, j, i, tileSize, tileSize);
    }
  }
  textAlign(LEFT);
  fill(0);
  textSize(24);
  text(dialogue.toString(), 0, 600);
}  

