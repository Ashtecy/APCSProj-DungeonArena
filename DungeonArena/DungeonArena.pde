
protected Dungeon arena;
protected int MODE;
protected long seed;

protected int tileSize=64;

protected PImage Title;
protected PImage P1;
protected PImage P2;
protected PImage L;
protected PImage S;

void setup() {
  size(960, 768);
  background(255);
  MODE=0;
  Title = loadImage("Title.png");
  P1 = loadImage("play1.png");
  P2 = loadImage("play2.png");
  L = loadImage("loading.png");
  S = loadImage("side.png");
  arena = new Dungeon(seed, tileSize);
  arena.addAdventurer(new Adventurer("joe", 1, 1, 1));
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
    MODE = 2;
  } else if (MODE==2) {
    scoreScreen();
  }
}

void keyPressed() {
  if (keyCode==8 && MODE==1) {
    seed=System.currentTimeMillis();
    MODE=0;
  }
}

void loadingScreen() {
  background(0);
  imageMode(CORNER);
  image(L, 625, 690, 300, 60);
}

void sideScreen() {
  for (int i=0; i<768; i+=128) {
    for (int j=576; j<960; j+=128) {
      imageMode(CORNER);
      image(S, j, i, 128, 128);
    }
  }      
  if (arena.getAdventurer() != null) {
    Inventory in = arena.getAdventurer().in;
    for (int i = 0; i < in.size (); i++) {
      image(in.use(i).getImage(), 580 + (i % 4) * 50, height / 4 + (i / 5) * 50);
    }
  }
  imageMode(CENTER);
  image(Title, 768, 100, 250, 100);
}

void scoreScreen() {
  fill(100, 100, 100, 20);
  rect(10, 10, width - 20, height - 20);
  imageMode(CENTER);
  image(arena.getAdventurer().getImage(), width / 2, height / 4);
  textSize(20);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(arena.getAdventurer().getStats(), width / 2, height / 2);
}

