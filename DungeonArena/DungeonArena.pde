
protected Dungeon arena = new Dungeon();
protected int MODE;

void setup(){
  size(960,768);
  background(255);
  MODE=0;
}

void keyPressed(){
  if(keyCode==32){
    MODE==1
  }
}
  
    

void draw(){
  if(MODE==0){
    background(0);
    textSize(48);
    text("DUNGEON ARENA",300,100);
    fill(255,0,0);
  }
  else if(MODE==1){
  arena.draw();
  }
}
