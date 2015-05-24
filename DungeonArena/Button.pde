
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
    if (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h){
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
