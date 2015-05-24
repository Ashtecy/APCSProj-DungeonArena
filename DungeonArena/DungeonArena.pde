
protected Dungeon arena = new Dungeon();
protected int MODE;

void setup(){
  size(960,768);
  background(255);
  MODE=0;
}

void keyPressed(){
  if(keyCode==32){
    MODE=1;
  }
}
  
    

void draw(){
  if(MODE==0){
    background(0);
    PImage Title = loadImage("Title.png");
    image(Title,50,300,850,150);
  }
  else if(MODE==1){
    arena.draw();
  }
}
