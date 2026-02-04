class Gem {
  float xpos;    //x position
  float ypos;    //y position
  float sxpos;    //x position
  float sypos;
  float yspd;    //y speed
  int animate;
  boolean hit;

  Gem(float x, float y) {
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
    if (animate<3){
      animate+=1;
    }else{
      animate=0;
    }
    
    if (dist(xpos, ypos, p1.posx+55, p1.posy+48) < (p1.rad + 5)){
      if (hit==false){
        score +=10;
      }
      hit = true;
    }
    
    
    
    if (hit == false){
      image(gem[animate], xpos, ypos, 30 ,30);
    }
  }
}
