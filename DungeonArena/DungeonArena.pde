
protected Dungeon arena;
protected int MODE;
protected long seed;
protected Random r =  new Random();

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
}

void draw() {
  if (MODE==0) {
    background(0);
    arena = new Dungeon(12,15,seed,tileSize);
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
    //sideScreen();
  }
}

void keyPressed() {
  if (keyCode==8 && MODE==1) {
    seed=System.currentTimeMillis();
    MODE=0;
  }
   if(keyCode==97){
      arena.getGuy().setXY(arena.getGuy().getX()-tileSize,arena.getGuy().getY()+tileSize);  
    }else if(keyCode==98){
      arena.getGuy().setY(arena.getGuy().getY()+tileSize);  
    }else if(keyCode==99){
      arena.getGuy().setXY(arena.getGuy().getX()+tileSize,arena.getGuy().getY()+tileSize);  
    }else if(keyCode==100){
      arena.getGuy().setX(arena.getGuy().getX()-tileSize);  
    }else if(keyCode==102){
      arena.getGuy().setX(arena.getGuy().getX()+tileSize);  
    }else if(keyCode==103){
      arena.getGuy().setXY(arena.getGuy().getX()-tileSize,arena.getGuy().getY()-tileSize);  
    }else if(keyCode==104){
      arena.getGuy().setY(arena.getGuy().getY()-tileSize);  
    }else if(keyCode==105){
      arena.getGuy().setXY(arena.getGuy().getX()+tileSize,arena.getGuy().getY()-tileSize);  
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
  image(Title,768,100,300,100);
  
}

