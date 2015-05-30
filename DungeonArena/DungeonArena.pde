
protected Dungeon arena;
protected int MODE;
protected long seed;

protected int tileSize=64;

protected PImage Title;
protected PImage P1;
protected PImage P2;
protected PImage L;
protected PImage S;

Adventurer a;
Equiptment e;

void setup() {
  size(960, 768);
  background(255);
  MODE=0;
  Title = loadImage("Title.png");
  P1 = loadImage("play1.png");
  P2 = loadImage("play2.png");
  L = loadImage("loading.png");
  S = loadImage("side.png");
  a = new Adventurer("JOE", 20, 0, 0);
  e = new Equiptment("AXE", 5, 0, 0, 0);
  e.setSTR(20);
}

void draw() {
  /*
  if(MODE==0){
   background(0);
   arena = new Dungeon(seed,tileSize);
   imageMode(CENTER);
   image(Title,480,150,850,120);
   Button play = new Button(P1,P2,480,350);
   play.draw();
   if(mousePressed){
   if(play.getIsOver()){
   loadingScreen();
   MODE=1;
   }
   }
   }
   else if(MODE==1){
   arena.draw();
   sideScreen();
   
   }*/
  System.out.println(a.getSTR());
}

void keyPressed() {
  if (keyCode==8 && MODE==1) {
    seed=System.currentTimeMillis();
    MODE=0;
  }
  if (keyCode == 32) {
    a.pickUp(e);
    a.in.equipt(0);
    a.updateStats();
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
  imageMode(CENTER);
  image(Title, 768, 100, 250, 100);
}

