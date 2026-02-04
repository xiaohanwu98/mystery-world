class Cherry {
  float xpos;    //x position
  float ypos;    //y position
  float sxpos;    //x position
  float sypos;
  int animate;
  boolean hit;

  Cherry(float x, float y) {
    xpos = x;
    ypos = y;
    sxpos = x;
    sypos = y;
    animate = 0;
    hit = false;
  }
  
  void reset(){
    xpos = sxpos;
    ypos = sypos;
    animate = 0;
    hit = false;
  }

  void display() {    //draw the star
    if (animate<6){
      animate+=1;
    }else{
      animate=0;
    }
    if (dist(xpos, ypos, p1.posx+55, p1.posy+48) < (p1.rad + 5)){
      if (hit==false){
        if ((hp+50)<fullhp){
          hp+=50;
        }else{
          hp=fullhp;
        }
      }
      if (hit==false){
        s3.play();
        s3.rewind();
      }
      hit = true;
    }
    if (hit == false){
      image(cherry[animate], xpos, ypos, 45 ,45);
    }
  }
}
