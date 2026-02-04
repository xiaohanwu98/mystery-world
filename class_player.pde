class Player{
  float posx;
  float posy;
  float sposx;
  float sposy;
  int state;
  int animate;
  int reach;
  int stretch;
  int doing;
  int sizex;
  int sizey;
  int rad;
  boolean die;
  boolean hurt;
  
  Player(float x, float y){
    posx = x;
    posy = y;
    sposx = x;
    sposy = y;
    state = 0;
    animate = -1;
    reach = 0;
    stretch = 0;
    doing = 0;
    sizex = 150;
    sizey = 100;
    rad = 60;
    die = false;
    hurt = false;
  }
  
  void reset(){
    posx = sposx;
    posy = sposy;
    state = 0;
    animate = -1;
    reach = 0;
    stretch = 0;
    doing = 0;
    sizex = 150;
    sizey = 100;
    rad = 60;
    die = false;
    hurt = false;
  }
  
  void display(){
    if (status == 2){
    if (die == true){
      if (animate<5){
        animate+=1;
        image(pdie[animate], posx, posy, sizex ,sizey);
      }else{
        image(pdie[5], posx, 230, sizex ,sizey);
        status=5;
        win = false;
      }
    }else if(hurt == true){
      if (animate<7){
        animate+=1;
        posx-=10;
        posy=260;
        image(hurtt[animate], posx, posy, sizex ,sizey);
      }else{
        hurt = false;
        posy=230;
      }
    }else{
    
    if (doing == 3 && animate!=6){ //jump
        if (animate<1){
            animate+=1;      
          }else if(animate<4){
            animate+=1;
            posy -= 20;
          }else if(animate<6){
            animate+=1;
            posy += 30;
          }else{
            animate=6;
          }
          image(jump[animate], posx, posy, sizex ,sizey);
    }else if (doing == 33){ // fall down
      if (posy<230){
        posy+=20;
        image(jump[3], posx, posy, sizex ,sizey);
      }else{
        posy=230;
        image(jump[3], posx, posy, sizex ,sizey);
        doing = 0;
      }
    }else if (doing == 6 && animate<7){   // finish attack
          animate+=1;      
          image(attack[animate], posx, posy, sizex ,sizey);
    }else if (keyPressed){
      if(key == 'a'){
        if(doing==10 && posy<300){  // fall fown from climb
          doing = 33;
          posx-=10;
        }else if (doing != 1){
          animate = 0;
          doing = 1;
          posx -= 20;
          
          if (animate<5){
            animate+=1;
          }else{
            animate=0;
          }
          image(runLeft[animate], posx, posy+22, sizex*0.4 ,sizey*0.75);
        }else{
          posx -= 20;
          if (animate<5){
            animate+=1;
          }else{
            animate=0;
          }
          image(runLeft[animate], posx, posy+20, sizex*0.4 ,sizey*0.75);
        }
      }else if(key == 'd'){
        if(doing==10 && posy<230){ //is climbing
          doing = 33;
          posx+=20;
        }else if (doing != 2){
          animate = 0;
          doing = 2;
          posx += 20;
          if (animate<5){
            animate+=1;
          }else{
            animate=0;
          }
          image(run[animate], posx, posy, sizex ,sizey);
        }else{
          posx += 20;
          if (animate<5){
            animate+=1;
          }else{
            animate=0;
          }
          image(run[animate], posx, posy, sizex ,sizey);
        }
      }else if(key == 'w'){
        if (doing != 3){ //jump
          animate = 0;
        }
        doing = 3;
        if (posx>600 && posx<640){ //climb tree
          doing=10;
          if (posy>160){
            if (animate<3){
              animate+=1;
            }else{
              animate=0;
            }
            posy-=6;
            image(climb[animate], posx, posy, sizex ,sizey);
          }else{
            image(climb[0], posx, posy, sizex ,sizey);
          }
        }else{ //jump
          if (animate<1){
            animate+=1;      
          }else if(animate<4){
            animate+=1;
            posy -= 20;
          }else if(animate<6){
            animate+=1;
            posy += 30;
          }else{
            animate=0;
          }
          image(jump[animate], posx, posy, sizex ,sizey);
        
        }
      }else if(key == 's'){
        if (posx>600 && posx<640 && posy<230){
          doing=10;
            if (animate<3){
              animate+=1;
            }else{
              animate=0;
            }
            posy+=6;
            if (posy>230){
              posy=230;
            }
            image(climb[animate], posx, posy, sizex ,sizey);  
        }else{                                                   //down           
          if (doing != 4){
            animate = 0;
          }
          doing = 4;
          if (animate<3){
            animate+=1;
          }else{
            animate=0;
          }
          image(down[animate], posx, posy, sizex ,sizey);   
        }
      }else if(key==' '){
        if(doing==10 && posy<230){ //is climbing
          image(climb[0], posx, posy, sizex ,sizey);
        }else if (doing != 6){ // attack
          animate = 0;
          doing = 6;
          if (animate<6){
            animate+=1;
          }else{
            animate=0;
          }
          image(attack[animate], posx, posy, sizex ,sizey);  
        }else{
          if (animate<6){
            animate+=1;
          }else{
            animate=0;
          }
          image(attack[animate], posx, posy, sizex ,sizey);  
        }
      }else{                                             //other key pressed            
        if (doing == 10 && posy<230){
          image(climb[0], posx, posy, sizex ,sizey);
        }else{
          if (doing != 0){
            animate = 0;
          }
          doing = 0;
          if (animate<3){
            animate+=1;
          }else{
            animate=0;
          }
          image(idle[animate], posx, posy, sizex ,sizey);
        }
      }
    }else{                                             //no key pressed
      if (doing == 10 && posy<230){
        image(climb[0], posx, posy, sizex ,sizey);
      }else{
        if (doing != 0){
          animate = 0;
        }
        doing = 0;
        if (animate<3){
          animate+=1;
        }else{
          animate=0;
        }
        image(idle[animate], posx, posy, sizex ,sizey);
      }
    }
    } 
    }else{ // palyer2
      //print(posy);
      if (die == true){
      if (animate<5){
        animate+=1;
        image(pdie[animate], posx, posy, sizex ,sizey);
      }else{
        image(pdie[5], posx, posy, sizex ,sizey);
        win = false;
        status=5;
      }
    }else if(hurt == true){
      
      if (posx>600 && posx<1090){           // in highground
      if (doing!= 123){         //hurt
        doing = 123;
        animate = 0;
      }
      if (animate==0){
        animate+=1;
        posx-=10;
        posy=270;
        image(hurtt[animate], posx, posy, sizex ,sizey);
      }else if (animate<7){
        animate+=1;
        posx-=10;
        image(hurtt[animate], posx, posy, sizex ,sizey);
      }else{
        hurt = false;
        animate = 0;
        posy=240;
        doing = 2;
      }
      }else{                              //not in highground
      if (doing!= 123){         //hurt
        doing = 123;
        animate = 0;
      }
      if (animate==0){
        animate+=1;
        posx-=10;
        posy=375;
        image(hurtt[animate], posx, posy, sizex ,sizey);
      }else if (animate<7){
        animate+=1;
        posx-=10;
        image(hurtt[animate], posx, posy, sizex ,sizey);
      }else{
        hurt = false;
        animate = 0;
        posy=345;
        doing = 2;
      }
      }
      
    }else{
    
    if (doing == 3 && animate!=6){ //jump
        if (animate<1){
            animate+=1;      
          }else if(animate<4){
            animate+=1;
            posy -= 20;
          }else if(animate<6){
            animate+=1;
            posy += 30;
          }else{
            animate=6;
          }
          image(jump[animate], posx, posy, sizex ,sizey);
    }else if (doing == 33){
      if (posy<365){
        posy+=20;
        image(jump[3], posx, posy, sizex ,sizey);
      }else{
        posy=385;
        image(jump[3], posx, posy, sizex ,sizey);
        doing = 0;
      }
    }else if (doing == 6 && animate<7){
          animate+=1;      
          image(attack[animate], posx, posy, sizex ,sizey);
    }else if (keyPressed){
      if(key == 'a'){
        if(doing==10 && posy<385 && posy>240){
          doing = 33;
          posx-=10;
        }else if (doing != 1){
          animate = 0;
          doing = 1;
          if (posy<=240){
            if (posx>705){posx -= 20;}
          }else{
            posx -= 20;
          }
          
          if (posx > 120 && posx <260){
            if (posy<287){
              posy = 277;
            }else{
              posy -= 15;
            }
          }
          if (posx > 540 && posx <660){
            posy -= 9;
            if (posy<345){posy=345;}
          }
          if (posx > 1070 && posx <1130){
            posy += 15;
            if (posy>385){posy=385;}
          }
          if (posx > 1280 && posx <1400){
            if (posy>340){
              posy = 355;
            }else{
              posy += 15;
            }
          }
          
          image(runLeft[animate], posx, posy+22, sizex*0.4 ,sizey*0.75);
        }else{
          if (posy<=240){
            if (posx>705){posx -= 20;}
          }else{
            posx -= 20;
          }
          if (posx > 120 && posx <260){
            if (posy<287){
              posy = 277;
            }else{
              posy -= 15;
            }
          }
          if (posx > 540 && posx <660){
            posy -= 9;
            if (posy<345){posy=345;}
          }
          if (posx > 1070 && posx <1130){
            posy += 15;
            if (posy>385){posy=385;}
          }
          if (posx > 1280 && posx <1400){
            if (posy>340){
              posy = 355;
            }else{
              posy += 15;
            }
          }
          if (animate<5){
            animate+=1;
          }else{
            animate=0;
          }
          image(runLeft[animate], posx, posy+20, sizex*0.4 ,sizey*0.75);
        }
      }else if(key == 'd'){
        if(doing==10 && posy<385 && posy>240){ //is climbing
          doing = 33;
          posx+=10;
        }else if (doing != 2){
          animate = 0;
          doing = 2;
          if (posy<=240){
            if (posx<1049){
              posx += 20;
            }
          }else{
            posx += 20;
          }
          if (posx > 120 && posx <260){
            if (posy>345){
              posy = 355;
            }else{
              posy += 15;
            }
          }
          if (posx > 540 && posx <660){
            posy += 9;
            if (posy>385){posy=385;}
          }
          if (posx > 1070 && posx <1130){
            posy -= 15;
            if (posy<345){posy=345;}
          }
          if (posx > 1280 && posx <1400){
            if (posy<290){
              posy = 275;
            }else{
              posy -= 15;
            }
          }
          if (animate<5){
            animate+=1;
          }else{
            animate=0;
          }
          image(run[animate], posx, posy, sizex ,sizey);
        }else{
          if (posy<=240){
            if (posx<1049){
              posx += 20;
            }
          }else{
            posx += 20;
          }
          if (posx > 120 && posx <260){
            if (posy>345){
              posy = 355;
            }else{
              posy += 15;
            }
          }
          if (posx > 540 && posx <660){
            posy += 9;
            if (posy>385){posy=385;}
          }
          if (posx > 1070 && posx <1130){
            posy -= 15;
            if (posy<345){posy=345;}
          }
          if (posx > 1280 && posx <1400){
            if (posy<290){
              posy = 275;
            }else{
              posy -= 15;
            }
          }
          if (animate<5){
            animate+=1;
          }else{
            animate=0;
          }
          image(run[animate], posx, posy, sizex ,sizey);
        }
      }else if(key == 'w'){
        if (doing != 3){ //jump
          animate = 0;
        }
        doing = 3;
        if (posx>750 && posx<1020 && posy<=240){
          if (animate<1){
            animate+=1;      
          }else if(animate<4){
            animate+=1;
            posy -= 20;
          }else if(animate<6){
            animate+=1;
            posy += 30;
          }else{
            animate=0;
          }
          image(jump[animate], posx, posy, sizex ,sizey);
        }else if (posx>750 && posx<1020){ //climb tree
          doing=10;
          if (posy>240){
            if (animate<3){
              animate+=1;
            }else{
              animate=0;
            }
            posy-=6;
            if (posy<240){
              posy = 240;
            }
            image(climb[animate], posx, posy, sizex ,sizey);
          }else{
            animate = 0;
            doing = 2;
          }
        }else{ //jump
          if (animate<1){
            animate+=1;      
          }else if(animate<4){
            animate+=1;
            posy -= 20;
          }else if(animate<6){
            animate+=1;
            posy += 30;
          }else{
            animate=0;
          }
          image(jump[animate], posx, posy, sizex ,sizey);
        
        }
      }else if(key == 's'){
        if (posx>750 && posx<1020 && posy<385){
          doing=10;
            if (animate<3){
              animate+=1;
            }else{
              animate=0;
            }
            posy+=6;
            if (posy>385){
              posy=385;
            }
            image(climb[animate], posx, posy, sizex ,sizey);  
        }else{                                                   //down           
          if (doing != 4){
            animate = 0;
          }
          doing = 4;
          if (animate<3){
            animate+=1;
          }else{
            animate=0;
          }
          image(down[animate], posx, posy, sizex ,sizey);   
        }
      }else if(key==' '){
        if(doing==10 && posy<385 && posy>250){ //is climbing
          image(climb[0], posx, posy, sizex ,sizey);
        }else if (doing != 6){ // attack
          animate = 0;
          doing = 6;
          if (animate<6){
            animate+=1;
          }else{
            animate=0;
          }
          image(attack[animate], posx, posy, sizex ,sizey);  
        }else{
          if (animate<6){
            animate+=1;
          }else{
            animate=0;
          }
          image(attack[animate], posx, posy, sizex ,sizey);  
        }
      }else{                                             //other key pressed            
        if (doing == 10 && posy<385 && posy>250){
          image(climb[0], posx, posy, sizex ,sizey);
        }else{
          if (doing != 0){
            animate = 0;
          }
          doing = 0;
          if (animate<3){
            animate+=1;
          }else{
            animate=0;
          }
          image(idle[animate], posx, posy, sizex ,sizey);
        }
      }
    }else{                                             //no key pressed
      if (doing == 10 && posy<385 && posy>240 ){
        image(climb[0], posx, posy, sizex ,sizey);
      }else{
        if (doing != 0){
          animate = 0;
        }
        doing = 0;
        if (animate<3){
          animate+=1;
        }else{
          animate=0;
        }
        image(idle[animate], posx, posy, sizex ,sizey);
      }
    }
    }       
    }
  }
}
  
