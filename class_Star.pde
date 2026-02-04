class Star {
  float xpos;    //x position
  float ypos;    //y position
  float yspd;    //y speed

  float maxR;    //radius of vertices
  float minR;

  float angle;    //overall orientation
  float angleSpd;    //keep rotating at angle speed
  float circlePos;  //the position of the cicle moving around the star
  float theta = random(10);

  Star() {
    maxR = 16;    //initalize
    minR = 8;

    xpos = random(width);
    ypos = -maxR;
    yspd = random(4, 7);

    angle=0;
    angleSpd=random(-.1, .1);
  }

  void reset() {      //reset the location of star
    xpos = random(width);
    ypos = -maxR;
  }

  void update() {    //the star is falling and rotating
    ypos+=yspd;
    angle+=angleSpd;
  }
  
  void changeSpeed(float varSpeed){
    yspd*= varSpeed;
  }

  void display() {    //draw the star
    pushMatrix();
    translate(xpos, ypos);
    rotate(angle);
    fill(187, 250, 73);
    strokeWeight (1);
    beginShape();
    for (int i=0; i<10; i++) {    
      if (i%2==0) {
        vertex(cos(i*TWO_PI/10)*maxR, sin(i*TWO_PI/10)*maxR);    //convex vertex
      } else {
        vertex(cos(i*TWO_PI/10)*minR, sin(i*TWO_PI/10)*minR);    //concave vertex
      }
    }
    endShape(CLOSE);
    popMatrix();
    fill(235,10,10);
    ellipse(circlePos, ypos, (maxR-minR), (maxR-minR));
  }
  void move(){
    circlePos = xpos + sin(theta) * (maxR-minR) * 3;
    theta += .2;
  }
  
  boolean hitPlayer(Player p1) {    //collide with player or not
    if (dist(xpos, ypos, p1.posx+55, p1.posy+50) < p1.rad + 5) {
      return true;
    } else {
      return false;
    }
  }

  boolean dead() {    //if star falls out of the canvas edge, it is dead
    if (ypos > height + maxR) {
      return true;
    } else {
      return false;
    }
  }
}
