
PImage map1;
PImage map2;
PImage house;
PImage[] idle = new PImage[4];
PImage[] idle2 = new PImage[3];
PImage[] run = new PImage[6];
PImage[] runLeft = new PImage[6];
PImage[] putswrd = new PImage[3];
PImage[] jump = new PImage[7];
PImage[] climb = new PImage[4];
PImage[] down = new PImage[4];
PImage[] gem = new PImage[4];
PImage[] cherry = new PImage[7];
PImage[] attack = new PImage[8];
PImage[] eagle = new PImage[4];
PImage[] edie = new PImage[6];
PImage[] pdie = new PImage[7];
PImage[] hurtt = new PImage[8];
PImage heart;
int gameWidth;
int gameHeight;
int sec;
Player p1;
Player p2;
Eagle e1;
Eagle e2;
Eagle e3;
Eagle e4;
Gem g1;
Gem g2;
Gem g3;
Gem g4;
Gem g5;
Gem g6;
Gem g7;
Gem g8;
Gem g9;
Gem g10;
Eagle e11;
Eagle e12;
Eagle e13;
Eagle e14;
Eagle e15;
Eagle e16;
Eagle e17;
Eagle e18;
Eagle e19;
Eagle e20;
Gem g11;
Gem g12;
Gem g13;
Gem g14;
Gem g15;
Gem g16;
Gem g17;
Gem g18;
Gem g19;
Gem g20;
Gem g21;
Gem g22;
Gem g23;
Gem g24;
Gem g25;
Cherry c1;

int status=1;      //which page are running
ArrayList<Star> stars;    //all bonus stars
int fullscore = 100;
int fullhp = 100;
int score = 0;   // original score
int hp = 100;
int level = 1;
boolean win;
boolean isRecording=false;
boolean changed = false;
float oldspeed=0;
float changeSpeed1=1;

import controlP5.*; // build main GUI using controlP5
ControlP5 cp5;

Textlabel labelA;
Textlabel labelB;
Textlabel labelC;
Textlabel labelD;
Textlabel labelE;
Textlabel labelF;
Textlabel labelG;

Accordion accordion1;
Accordion accordion2;

import ddf.minim.*;
Minim soundengine;
AudioPlayer s1;
AudioPlayer s2;
AudioPlayer s3;
AudioPlayer s4;
AudioPlayer s5;
AudioPlayer s6;

void setup() {
  gameWidth = 1920;
  gameHeight = 640;
  size(1920, 640);
  map1 = loadImage("map1.png");
  map2 = loadImage("map2.jpg");
  house = loadImage("house.png");
  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");
  idle[2] = loadImage("idle2.png");
  idle[3] = loadImage("idle3.png");
  idle2[0] = loadImage("idle20.png");
  idle2[1] = loadImage("idle21.png");
  idle2[2] = loadImage("idle22.png");
  run[0] = loadImage("run0.png");
  run[1] = loadImage("run1.png");
  run[2] = loadImage("run2.png");
  run[3] = loadImage("run3.png");
  run[4] = loadImage("run4.png");
  run[5] = loadImage("run5.png"); 
  putswrd[0] = loadImage("putswrd0.png");
  putswrd[1] = loadImage("putswrd1.png");
  putswrd[2] = loadImage("putswrd2.png");
  jump[0] = loadImage("jump0.png");
  jump[1] = loadImage("jump1.png");
  jump[2] = loadImage("jump2.png");
  jump[3] = loadImage("jump2.png");
  jump[4] = loadImage("jump2.png");
  jump[5] = loadImage("jump3.png");
  jump[6] = loadImage("jump3.png");
  climb[0] = loadImage("climb0.png");
  climb[1] = loadImage("climb1.png");
  climb[2] = loadImage("climb2.png");
  climb[3] = loadImage("climb3.png");
  runLeft[0] = loadImage("runLeft0.png");
  runLeft[1] = loadImage("runLeft1.png");
  runLeft[2] = loadImage("runLeft2.png");
  runLeft[3] = loadImage("runLeft3.png");
  runLeft[4] = loadImage("runLeft4.png");
  runLeft[5] = loadImage("runLeft5.png");
  down[0] = loadImage("down0.png");
  down[1] = loadImage("down1.png");
  down[2] = loadImage("down2.png");
  down[3] = loadImage("down3.png");
  gem[0] = loadImage("gem0.png");
  gem[1] = loadImage("gem1.png");
  gem[2] = loadImage("gem2.png");
  gem[3] = loadImage("gem3.png");
  cherry[0] = loadImage("cherry-1.png");
  cherry[1] = loadImage("cherry-2.png");
  cherry[2] = loadImage("cherry-3.png");
  cherry[3] = loadImage("cherry-4.png");
  cherry[4] = loadImage("cherry-5.png");
  cherry[5] = loadImage("cherry-6.png");
  cherry[6] = loadImage("cherry-7.png");
  attack[0] = loadImage("attack0.png");
  attack[1] = loadImage("attack1.png");
  attack[2] = loadImage("attack2.png");
  attack[3] = loadImage("attack3.png");
  attack[4] = loadImage("attack4.png");
  attack[5] = loadImage("attack5.png");
  attack[6] = loadImage("attack6.png");
  attack[7] = loadImage("attack7.png");
  eagle[0] = loadImage("eagle0.png");
  eagle[1] = loadImage("eagle1.png");
  eagle[2] = loadImage("eagle2.png");
  eagle[3] = loadImage("eagle3.png");
  edie[0] = loadImage("edie0.png");
  edie[1] = loadImage("edie1.png");
  edie[2] = loadImage("edie2.png");
  edie[3] = loadImage("edie3.png");
  edie[4] = loadImage("edie4.png");
  edie[5] = loadImage("edie5.png");
  pdie[0] = loadImage("pdie0.png");
  pdie[1] = loadImage("pdie1.png");
  pdie[2] = loadImage("pdie2.png");
  pdie[3] = loadImage("pdie3.png");
  pdie[4] = loadImage("pdie4.png");
  pdie[5] = loadImage("pdie5.png");
  pdie[6] = loadImage("pdie6.png");
  hurtt[0] = loadImage("hurt0.png");
  hurtt[1] = loadImage("hurt0.png");
  hurtt[2] = loadImage("hurt1.png");
  hurtt[3] = loadImage("hurt1.png");
  hurtt[4] = loadImage("hurt2.png");
  hurtt[5] = loadImage("hurt2.png");
  hurtt[6] = loadImage("hurt3.png");
  hurtt[7] = loadImage("hurt3.png");
  heart = loadImage("heart.png");
  p1 = new Player(50, 230);
  p2 = new Player(20, 277);
  
  status = 1;// 1 for start screen, 2 for play screen
  stars = new ArrayList<Star>();    //initialize all objects
  
  gui();
  soundengine = new Minim(this);
  s1 = soundengine.loadFile("onMove.mp3", 1024); //https://soundimage.org/fantasywonder/
  s2 = soundengine.loadFile("touchStar.mp3", 1024); //https://soundimage.org/sfx-alerts/
  s3 = soundengine.loadFile("touchCherry.mp3", 1024);
  s4 = soundengine.loadFile("hurt.mp3", 1024);
  s5 = soundengine.loadFile("death.mp3", 1024);
  s6 = soundengine.loadFile("eagleDie.mp3", 1024);
  
  g1 = new Gem(200,260);
  g2 = new Gem(230,260);
  g3 = new Gem(260,260);
  g4 = new Gem(290,260);
  g5 = new Gem(800,210);
  g6 = new Gem(840,200);
  g7 = new Gem(880,210);
  g8 = new Gem(1100,200);
  g9 = new Gem(1300,250);
  g10 = new Gem(1600,200);
  e1 = new Eagle(350,220);
  e2 = new Eagle(420,150);
  e3 = new Eagle(930,170);
  e4 = new Eagle(1500,210);
  c1 = new Cherry(692,145);
  cp5.setColorForeground(#FC9A30);
  cp5.setColorBackground(#9B5408);
  cp5.setColorActive(#FC9A30);
  g11 = new Gem(220,280);
  g12 = new Gem(250,310);
  g13 = new Gem(280,340);
  
  g14 = new Gem(370,300);
  g15 = new Gem(420,300);
  g16 = new Gem(470,300);
  
  
  e11 = new Eagle(450,220);
  e11.high = false;
  e12 = new Eagle(510,300);
  e12.high = false;
  
  //e13 = new Eagle(770,90);
  e14 = new Eagle(830,110);
  e15 = new Eagle(870,130);
  e16 = new Eagle(930,150);
  e17 = new Eagle(980,170);
  e18 = new Eagle(1030,190);
  e19 = new Eagle(1080,210);
  
  g17 = new Gem(860,170);
  g18 = new Gem(890,200);
  g19 = new Gem(920,230);
  
  g20 = new Gem(950,260);
  g21 = new Gem(950,170);
  
  g22 = new Gem(980,230);
  g23 = new Gem(1010,200);
  g24 = new Gem(1040,170);
  
  g25 = new Gem(1490,270);
  
  e20 = new Eagle(1310,150);
  e20.high = false;
}

void draw() {
  changeSpeed1 = cp5.getController("Star Speed").getValue();
  //println(changeSpeed1+" "+oldspeed);
  if (changeSpeed1 != oldspeed){
    changed = true;
  }else{
    changed = false;
  }
  oldspeed = changeSpeed1;
  switch (status){
    case 1:  //start screen
     //background
     tint(150);
     image(map1, 0, 0, gameWidth , gameHeight);
     
     //text
     textSize(80);
     textAlign(CENTER, CENTER);
     fill(255);
     text("Welcome to the Mystery World!",width/2,height/6);
     s1.play();
     s1.loop();
     
     //begin to play
     if ((mouseX>width/2-150 && mouseX<width/2+150) && (mouseY>height/3 && mouseY<height/3+100)){
       fill(255);
       rect(width/2-150,height/3,300,100);
       textSize(70);
       textAlign(CENTER, CENTER);
       fill(87);
       text("Play",width/2,height/3+40);
       if (mousePressed==true){
         status = 2;
         tint(255);
       }
     }else{
       strokeWeight(7);
       stroke(255);
       noFill();
       rect(width/2-150,height/3,300,100);
       textSize(70);
       textAlign(CENTER, CENTER);
       fill(255);
       text("Play",width/2,height/3+40);
     }
     
     if ((mouseX>width/2-150 && mouseX<width/2+150) && (mouseY>(height/2+20) && mouseY<height/2+120)){
       fill(255);
       rect(width/2-150,height/2+20,300,100);
       textSize(70);
       textAlign(CENTER, CENTER);
       fill(87);
       text("Exit",width/2,height/2+20+40);
       if (mousePressed==true){
         exit();
       }
     }else{
       strokeWeight(7);
       stroke(255);
       noFill();
       rect(width/2-150,height/2+20,300,100);
       textSize(70);
       textAlign(CENTER, CENTER);
       fill(255);
       text("Exit",width/2,height/2+60);
     }
     break;
     
  case 2:  //game play page
    //gui();
    sec+=1;
    image(map1, 0, 0, gameWidth , gameHeight);
    image(house, gameWidth-240, 90, 220 , 240);
    if (p1.posx>1550){
      strokeWeight(0);
      fill(55);
      rect(gameWidth-178,262,46,65);
    }
    if (p1.posx>1650){
      win = true;
      status=7;
      p1.posx = 20;
      p1.posy = 277;
    }
    p1.display();
    g1.display();
    g2.display();
    g3.display();
    g4.display();
    g5.display();
    g6.display();
    g7.display();
    g8.display();
    g9.display();
    g10.display();
    c1.display();
    e1.display();
    e2.display();
    e3.display();
    e4.display();
    for (int i = stars.size()-1; i >= 0; i--) {    //remove dead stars
      if (stars.get(i).dead()) {
        stars.remove(i);
      } else if (stars.get(i).hitPlayer(p1)) {    //if hit player, get points
        stars.remove(i);
        if ((hp+5)<fullhp){
          hp += 5;
        }else{
          hp = fullhp;
        }
        s2.play();
        s2.rewind();
      }
    }
    if (frameCount % 20 == 1) {      //create a new star for every 20 frames
      Star newStar = new Star();
      stars.add(newStar);
      newStar.changeSpeed(changeSpeed1/100);
    }

    for (int i = 0; i < stars.size(); i++) {    //update position and draw all elements
      if (changed==true){
        println(changeSpeed1/100);
        stars.get(i).changeSpeed(changeSpeed1/100);
      }
      stars.get(i).update();
      stars.get(i).display();
      stars.get(i).move();
    }
    
    if (score > fullscore){
      score = score - fullscore;
      level += 1;
      fullscore += 10;
      fullhp += 20;
      hp += 20;
    }
    //hp
    image(heart, 30, 28, 30 , 30);
    strokeWeight(3);
    stroke(139,69,19);
    noFill();
    rect(85,25,200,30);
    strokeWeight(0);
    fill(178,34,34);
    rect(87,27,198*(hp)/fullhp,27);
    fill(255);
    textSize(25);
    textAlign(CENTER, CENTER);
    text(str(hp)+"/"+str(fullhp), 185, 38); 
    //exp
    fill(50);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("exp", 46, 80);
    strokeWeight(3);
    stroke(139,69,19);
    noFill();
    rect(85,70,200,30);
    strokeWeight(0);
    fill(153,204,255); // blue rect
    rect(87,72,198*(score)/fullscore,27);
    fill(50);
    textSize(25);
    textAlign(CENTER, CENTER);
    text(str(score)+"/"+str(fullscore), 185, 84); 
    //level
    fill(50);
    textSize(28);
    textAlign(LEFT, CENTER);
    text("Lv. "+str(level), 310, 37);
    break;
   
  case 3:  //exit case
    exit();
    break;
     
  case 4: // pause case
    for (int i=0; i<stars.size (); i++) {
      stars.get(i).display();
    }
    fill(100);
    textSize(50);
    text("PAUSED", width/2, height*2/5);
    break;
      
  case 5:
    tint(150);
    image(map1, 0, 0, gameWidth , gameHeight);
    textSize(80);
    textAlign(CENTER, CENTER);
    fill(255);
    if (win == true){
      text("Congratulation! You win the game!",width/2,height/6);
    }else{
      text("Sorry, You are dead.",width/2,height/6);
    }
    p1.reset();
    p2.reset();
    g1.reset();
    g2.reset();
    g3.reset();
    g4.reset();
    g5.reset();
    g6.reset();
    g7.reset();
    g8.reset();
    g9.reset();
    g10.reset();
    e11.reset();
    e12.reset();
    //e13.reset();
    e14.reset();
    e15.reset();
    e16.reset();
    e17.reset();
    e18.reset();
    e19.reset();
    e20.reset();
    g11.reset();
    g12.reset();
    g13.reset();
    g14.reset();
    g15.reset();
    g16.reset();
    g17.reset();
    g18.reset();
    g19.reset();
    g20.reset();
    g21.reset();
    g22.reset();
    g23.reset();
    g24.reset();
    g25.reset();
    c1.reset();
    e1.reset();
    e2.reset();
    e3.reset();
    e4.reset();
    if (isRecording==false){
      String[] lines = loadStrings("score.txt");
      String[] lines2 = loadStrings("sec.txt");
      String words = str(level);
      lines = append(lines,words);
      saveStrings("score.txt", lines);
      if (win==true){
        String words2 = str(sec);
        lines2 = append(lines2,words2);
        saveStrings("sec.txt", lines2);
      }
      isRecording=true;
    }
    sec = 0;
    fullscore = 100;
    fullhp = 100;
    score = 0; 
    hp = 100;
    level = 1;
    if ((mouseX>width/2-200 && mouseX<width/2+200) && (mouseY>height/3 && mouseY<height/3+100)){
       fill(255);
       rect(width/2-200,height/3,400,100);
       textSize(70);
       textAlign(CENTER, CENTER);
       fill(87);
       text("Play again",width/2,height/3+40);
       if (mousePressed==true){
         status = 2;
         isRecording = false;
         tint(255);
       }
     }else{
       strokeWeight(7);
       stroke(255);
       noFill();
       rect(width/2-200,height/3,400,100);
       textSize(70);
       textAlign(CENTER, CENTER);
       fill(255);
       text("Play again",width/2,height/3+40);
     }
     
     if ((mouseX>width/2-150 && mouseX<width/2+150) && (mouseY>(height/2+20) && mouseY<height/2+120)){
       fill(255);
       rect(width/2-150,height/2+20,300,100);
       textSize(70);
       textAlign(CENTER, CENTER);
       fill(87);
       text("Exit",width/2,height/2+20+40);
       if (mousePressed==true){
         exit();
       }
     }else{
       strokeWeight(7);
       stroke(255);
       noFill();
       rect(width/2-150,height/2+20,300,100);
       textSize(70);
       textAlign(CENTER, CENTER);
       fill(255);
       text("Exit",width/2,height/2+60);
     }
     
     if ((mouseX>width/2-250 && mouseX<width/2+250) && (mouseY>height*2/3+50 && mouseY<height*2/3+150)){
       fill(255);
       rect(width/2-250,height*2/3+50,500,100);
       textSize(70);
       textAlign(CENTER, CENTER);
       fill(87);
       text("Check Scores",width/2,height*2/3+90);
       if (mousePressed==true){
         status = 6;
         tint(255);
       }
     }else{
       strokeWeight(7);
       stroke(255);
       noFill();
       rect(width/2-250,height*2/3+50,500,100);
       textSize(70);
       textAlign(CENTER, CENTER);
       fill(255);
       text("Check Scores",width/2,height*2/3+90);
     }  
     break;
   case 6:
    String[] lines = loadStrings("score.txt");
    String[] lines2 = loadStrings("sec.txt");
    IntList int1;
    int1 = new IntList();
    for (int i = 0 ; i < lines.length; i++) {
      int1.append(int(lines[i]));
    }
    int1.sort();
    //print(int1);
    
    IntList int2;
    int2 = new IntList();
    for (int i = 0 ; i < lines2.length; i++) {
      int2.append(int(lines2[i]));
    }
    int2.sort();
    //print(int2);
    
    tint(150);
    image(map1, 0, 0, gameWidth , gameHeight);
    textSize(65);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Highest Level",width/4,height/6);
    text("Shortest Time Used",width*3/4,height/6);
    textAlign(LEFT, CENTER);
    for (int i = 0 ; i < lines.length; i++) {
      text("No."+str(i+1)+"  Lv."+str(int1.get(lines.length - 1 - i)),width/4-150,height/6+90*(i+1));
      if (i==4){
        break;
      }
    }
    for (int i = 0 ; i < lines2.length; i++) {
      text("No."+str(i+1)+"  "+str(int2.get(i)/11)+" sec",width*3/4-190,height/6+90*(i+1));
      if (i==4){
        break;
      }
    }
    if ((mouseX>width/2-150 && mouseX<width/2+150) && (mouseY>height*2/3+50 && mouseY<height*2/3+150)){
       fill(255);
       rect(width/2-150,height*2/3+50,300,100);
       textSize(70);
       textAlign(CENTER, CENTER);
       fill(87);
       text("Back",width/2,height*2/3+90);
       if (mousePressed==true){
         status = 5;
         tint(255);
       }
     }else{
       strokeWeight(7);
       stroke(255);
       noFill();
       rect(width/2-150,height*2/3+50,300,100);
       textSize(70);
       textAlign(CENTER, CENTER);
       fill(255);
       text("Back",width/2,height*2/3+90);
     } 
    break;  
    
  case 7:
    sec+=1;
    image(map2, 0, 0, gameWidth , gameHeight);
    if (p1.posx>1400){
      strokeWeight(0);
      fill(55);
      rect(gameWidth-295,300,55,65);
    }
    if (p1.posx>1530){
      win = true;
      status=5;
    }
    
    p1.display();
    g11.display();
    g12.display();
    g13.display();
    g14.display();
    g15.display();
    g16.display();
    g17.display();
    g18.display();
    g19.display();
    g20.display();
    g21.display();
    g22.display();
    g23.display();
    g24.display();
    g25.display();
    e11.display();
    e12.display();
    //e13.display();
    e14.display();
    e15.display();
    e16.display();
    e17.display();
    e18.display();
    e19.display();
    e20.display();
    for (int i = stars.size()-1; i >= 0; i--) {    //remove dead stars
      if (stars.get(i).dead()) {
        stars.remove(i);
      } else if (stars.get(i).hitPlayer(p1)) {    //if hit player, get points
        stars.remove(i);
        if ((hp+5)<fullhp){
          hp += 5;
        }else{
          hp = fullhp;
        }
        s2.play();
        s2.rewind();
      }
    }
    if (frameCount % 20 == 1) {      //create a new star for every 20 frames
      Star newStar = new Star();
      stars.add(newStar);
      newStar.changeSpeed(changeSpeed1/100);
    }

    for (int i = 0; i < stars.size(); i++) {    //update position and draw all elements
      if (changed==true){
        println(changeSpeed1/100);
        stars.get(i).changeSpeed(changeSpeed1/100);
      }
      stars.get(i).update();
      stars.get(i).display();
      stars.get(i).move();
    }
    
    if (score > fullscore){
      score = score - fullscore;
      level += 1;
      fullscore += 10;
      fullhp += 20;
      hp += 20;
    }
    //hp
    image(heart, 30, 28, 30 , 30);
    strokeWeight(3);
    stroke(139,69,19);
    noFill();
    rect(85,25,200,30);
    strokeWeight(0);
    fill(178,34,34);
    rect(87,27,198*(hp)/fullhp,27);
    fill(255);
    textSize(25);
    textAlign(CENTER, CENTER);
    text(str(hp)+"/"+str(fullhp), 185, 38); 
    //exp
    fill(50);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("exp", 46, 80);
    strokeWeight(3);
    stroke(139,69,19);
    noFill();
    rect(85,70,200,30);
    strokeWeight(0);
    fill(153,204,255); // blue rect
    rect(87,72,198*(score)/fullscore,27);
    fill(50);
    textSize(25);
    textAlign(CENTER, CENTER);
    text(str(score)+"/"+str(fullscore), 185, 84); 
    //level
    fill(50);
    textSize(28);
    textAlign(LEFT, CENTER);
    text("Lv. "+str(level), 310, 37);
    break;
  }    
}

void gui() {
  cp5 = new ControlP5(this);
  Group g1 = cp5.addGroup("Instruction")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(140)
                ;
                
  labelA = cp5.addTextlabel("1")
                    .setText("Touch stars or cherry to restore HP")
                    .setPosition(5,20)
                    .moveTo(g1)
                    ;
              
  labelB = cp5.addTextlabel("2")
                    .setText("Touch eagles will lose HP")
                    .setPosition(5,40)
                    .moveTo(g1)
                    ;
                    
  labelC = cp5.addTextlabel("3")
                    .setText("Press 'A' or 'D' to move the character")
                    .setPosition(5,60)
                    .moveTo(g1)
                    ;
  labelD = cp5.addTextlabel("4")
                    .setText("Press 'W' or 'S' to jump or climb tree")
                    .setPosition(5,80)
                    .moveTo(g1)
                    ;
  labelE = cp5.addTextlabel("5")
                    .setText("Press space to attack eagles")
                    .setPosition(5,100)
                    .moveTo(g1)
                    ;
  labelF = cp5.addTextlabel("6")
                    .setText("Touch gems or kill eagles will get exp")
                    .setPosition(5,120)
                    .moveTo(g1)
                    ;
                    
  Group g2 = cp5.addGroup("Game setting")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;
                
  cp5.addRadioButton("radio")
     .setPosition(10,20)
     .setItemWidth(20)
     .setItemHeight(20)
     .addItem("continue", 0)
     .addItem("pause", 1)
     .addItem("exit", 2)
     .setColorLabel(color(255))
     .moveTo(g2)
     ;
     
  Group g3 = cp5.addGroup("Difficulty")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;
                
  cp5.addSlider("Star Speed")
     .setPosition(10,20)
     .setSize(100,20)
     .setRange(100,400)
     .setValue(100)
     .setColorForeground(color(252, 254, 48))
     .setColorActive(color(255, 0, 0))
     .moveTo(g3)
     ;
   
  Group g4 = cp5.addGroup("Control BGM")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;
  
  cp5.addRadioButton("BGM")
     .setPosition(10,20)
     .setItemWidth(20)
     .setItemHeight(20)
     .addItem("Mute", 0)
     .addItem("Unmute", 1)
     .setColorLabel(color(255))
     .moveTo(g4)
     ;
     
  accordion1 = cp5.addAccordion("acc1")
                 .setPosition(20,380)
                 .setWidth(200)
                 .addItem(g1)
                 .addItem(g3)
                 ;
                 
  accordion2 = cp5.addAccordion("acc2")
                 .setPosition(1680,380)
                 .setWidth(200)
                 .addItem(g2)
                 .addItem(g4)
                 ;
  
  accordion1.open(0, 1);
  accordion1.setCollapseMode(Accordion.MULTI);
  accordion2.open(0, 1);
  accordion2.setCollapseMode(Accordion.MULTI);
}

void radio(int action) {
  switch(action) {
    case(0):
    status = 2;
    break;
    case(1):
    status = 4;
    break;
    case(2):
    status = 3;
    break;
  }
}

void BGM(int action){
  switch(action) {
    case(0):
    s1.mute();
    s2.mute();
    s3.mute();
    s4.mute();
    s5.mute();
    s6.mute();
    break;
    case(1):
    s1.unmute();
    s2.unmute();
    s3.unmute();
    s4.unmute();
    s4.unmute();
    s6.unmute();
    break;
  }
} 
