
protected Dungeon arena = new Dungeon();
protected int MODE;

void setup(){
  size(960,768);
  background(255);
  MODE=0;
}

void draw(){
  if(MODE==0){
    background(0);
    PImage Title = loadImage("Title.png");
    PImage P1 = loadImage("play1.png");
    PImage P2 = loadImage("play2.png");
    image(Title,50,150,850,150);
    Button play = new Button(P1,P2,350,350);
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
  }
}
  
void keyPressed(){
  if(keyCode==8 && MODE==1){
    loadingScreen();
    MODE=0;
  }
}
  
  
void loadingScreen(){
  background(0);
  PImage L = loadImage("loading.png");
  image(L,625,675,300,60);
}

