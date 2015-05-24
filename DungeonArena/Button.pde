
class Button{
  
  protected float x,y,w,h;
  protected PImage text1,text2;
  protected boolean isOver;
  
  Button(PImage text1,PImage text2,int x,int y){
    this.text1=text1;this.text2=text2;
    this.x=x;this.y=y; 
    w=256;h=128;
   }
  
  void draw(){
    imageMode(CENTER);
    if (mouseX>x-(w/2) && mouseX<x+(w/2) && mouseY>y-(h/2) && mouseY<y+(h/2)){
      isOver=true;
      image(text2,x,y,w,h);
    }else{
      isOver = false;    
      image(text1,x,y,w,h);
    }  
  }
  
  boolean getIsOver(){
    return isOver;
  }
    
}
