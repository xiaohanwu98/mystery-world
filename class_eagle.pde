class Eagle {
  float xpos;    //x position
  float ypos;    //y position
  float sxpos;    //x position
  float sypos; 
  float yspd;    //y speed
  int animate;
  int hit;
  int dirc;
  boolean die;
  boolean high;

  Eagle(float x, float y) {
    xpos = x;
    ypos = y;
    sxpos = x;
    sypos = y;
    animate = 0;
    hit = 0;
    dirc = 1;
    die = false;
    high = true;
  }
  
  void reset(){
    xpos = sxpos;
    ypos = sypos;
    animate = 0;
    hit = 0;
    dirc = 1;
    die = false;
  }

  void display() {    //draw the star
   if(die == false){
    if (animate<3){
      animate+=1;
    }else{
      animate=0;
    }
    
    if (high == true){
      if (ypos>230){
        dirc = -1;
      }else if(ypos<40){
        dirc = 1;
      }
    }else{
      if (ypos>330){
        dirc = -1;
      }else if(ypos<180){
        dirc = 1;
      }
    }
    
    
    
    ypos += 10 * dirc;
    
    if (dist(xpos, ypos, p1.posx+55, p1.posy+25) < (p1.rad) && p1.hurt==false){   //hurt by eagle
      if (hp>40){
        hp-=40;
        p1.hurt=true;
        s4.play();
        s4.rewind();
      }else{
        hp=0;
        p1.die=true;
        p1.animate=0;
        s5.play();
        s5.rewind();
      }
    }
    
    if (dist(xpos, ypos, p1.posx+90, p1.posy+25) < (p1.rad + 5) && p1.doing==6){ //kill eagle
        score +=30;
        die=true;
        animate=0;
    }
    image(eagle[animate], xpos, ypos, 80 , 80);
  }else{ //eagle died
    if (animate<5){
      animate+=1;
      image(edie[animate], xpos, ypos, 80 , 80);
      s6.play();
      s6.rewind();
    }
  }
 }
}
