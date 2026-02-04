// ============================
// Globals (ported from Processing)
// ============================
let map1, map2, house, heart;

let idle = new Array(4);
let idle2 = new Array(3);
let run = new Array(6);
let runLeft = new Array(6);
let putswrd = new Array(3);
let jump = new Array(7);
let climb = new Array(4);
let down = new Array(4);
let gem = new Array(4);
let cherry = new Array(7);
let attack = new Array(8);
let eagle = new Array(4);
let edie = new Array(6);
let pdie = new Array(7);
let hurtt = new Array(8);

let gameWidth = 1920;
let gameHeight = 640;
let sec = 0;

let prevStatus = 1;
let timerStartMs = 0;
let pausedMs = 0;
let pauseStartMs = null;

function startTimer() {
  timerStartMs = millis();
  pausedMs = 0;
  pauseStartMs = null;
  sec = 0;
}

function pauseTimer() {
  if (pauseStartMs === null) pauseStartMs = millis();
}

function resumeTimer() {
  if (pauseStartMs !== null) {
    pausedMs += (millis() - pauseStartMs);
    pauseStartMs = null;
  }
}

function updateSecFromTimer() {
  const now = millis();
  const extraPaused = (pauseStartMs !== null) ? (now - pauseStartMs) : 0;
  sec = Math.floor((now - timerStartMs - pausedMs - extraPaused) / 1000);
}

let p1, p2;
let e1, e2, e3, e4;
let e11, e12, e14, e15, e16, e17, e18, e19, e20;
let g1, g2, g3, g4, g5, g6, g7, g8, g9, g10;
let g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25;
let c1;

let status = 1; // 1 start, 2 level1, 3 exit, 4 pause, 5 end, 6 scoreboard, 7 level2
let stars = [];
let fullscore = 100;
let fullhp = 100;
let score = 0;
let hp = 100;
let level = 1;
let win = false;

let isRecording = false;
let changed = false;
let oldspeed = 0;
let changeSpeed1 = 1;

// Audio (p5.sound)
let s1, s2, s3, s4, s5, s6;

// UI elements (replace ControlP5)
let uiStarSpeed;
let uiRadioGame;
let uiRadioBGM;

// localStorage keys
const LS_LEVELS = "mysteryworld_levels";
const LS_SECS = "mysteryworld_secs";

// ============================
// preload: load images + sounds
// ============================
function preload() {
  // backgrounds / objects
  map1 = loadImage("map1.png");
  map2 = loadImage("map2.jpg");
  house = loadImage("house.png");
  heart = loadImage("heart.png");

  // player animations
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

  runLeft[0] = loadImage("runLeft0.png");
  runLeft[1] = loadImage("runLeft1.png");
  runLeft[2] = loadImage("runLeft2.png");
  runLeft[3] = loadImage("runLeft3.png");
  runLeft[4] = loadImage("runLeft4.png");
  runLeft[5] = loadImage("runLeft5.png");

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

  down[0] = loadImage("down0.png");
  down[1] = loadImage("down1.png");
  down[2] = loadImage("down2.png");
  down[3] = loadImage("down3.png");

  // collectibles / enemies
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

  // sounds
  s1 = loadSound("onMove.mp3");
  s2 = loadSound("touchStar.mp3");
  s3 = loadSound("touchCherry.mp3");
  s4 = loadSound("hurt.mp3");
  s5 = loadSound("death.mp3");
  s6 = loadSound("eagleDie.mp3");
}

// ============================
// setup
// ============================
function setup() {
  const c = createCanvas(gameWidth, gameHeight);
  c.parent("game"); // matches your index.html

  // make text smoother
  textFont("Arial");

  // init objects
  p1 = new Player(50, 230);
  p2 = new Player(20, 277);

  status = 1;
  stars = [];

  // init UI (replaces ControlP5)
  buildUI();

  // init level 1
  g1 = new Gem(200, 260);
  g2 = new Gem(230, 260);
  g3 = new Gem(260, 260);
  g4 = new Gem(290, 260);
  g5 = new Gem(800, 210);
  g6 = new Gem(840, 200);
  g7 = new Gem(880, 210);
  g8 = new Gem(1100, 200);
  g9 = new Gem(1300, 250);
  g10 = new Gem(1600, 200);

  e1 = new Eagle(350, 220);
  e2 = new Eagle(420, 150);
  e3 = new Eagle(930, 170);
  e4 = new Eagle(1500, 210);

  c1 = new Cherry(692, 145);

  // init level 2
  g11 = new Gem(220, 280);
  g12 = new Gem(250, 310);
  g13 = new Gem(280, 340);

  g14 = new Gem(370, 300);
  g15 = new Gem(420, 300);
  g16 = new Gem(470, 300);

  e11 = new Eagle(450, 220);
  e11.high = false;
  e12 = new Eagle(510, 300);
  e12.high = false;

  e14 = new Eagle(830, 110);
  e15 = new Eagle(870, 130);
  e16 = new Eagle(930, 150);
  e17 = new Eagle(980, 170);
  e18 = new Eagle(1030, 190);
  e19 = new Eagle(1080, 210);

  g17 = new Gem(860, 170);
  g18 = new Gem(890, 200);
  g19 = new Gem(920, 230);

  g20 = new Gem(950, 260);
  g21 = new Gem(950, 170);

  g22 = new Gem(980, 230);
  g23 = new Gem(1010, 200);
  g24 = new Gem(1040, 170);

  g25 = new Gem(1490, 270);

  e20 = new Eagle(1310, 150);
  e20.high = false;
}

// ============================
// draw
// ============================
function draw() {
  // read UI star speed (100..400)
  changeSpeed1 = uiStarSpeed ? uiStarSpeed.value() : 100;

  if (changeSpeed1 !== oldspeed) changed = true;
  else changed = false;
  oldspeed = changeSpeed1;

  // --- status transitions for timer ---
  if (status !== prevStatus) {
    // entering gameplay (level 1 or level 2) from a non-game screen
    if ((status === 2 || status === 7) && !(prevStatus === 2 || prevStatus === 7)) {
      startTimer();
    }

    // pausing
    if (status === 4) {
      pauseTimer();
    }

    // resuming from pause back to gameplay
    if ((status === 2 || status === 7) && prevStatus === 4) {
      resumeTimer();
    }

    prevStatus = status;
  }

  switch (status) {
    case 1:
      drawStartScreen();
      break;
    case 2:
      drawLevel1();
      break;
    case 3:
      // "exit" in browser: just reset to start
      status = 1;
      break;
    case 4:
      drawPauseScreen();
      break;
    case 5:
      drawEndScreen();
      break;
    case 6:
      drawScoreboard();
      break;
    case 7:
      drawLevel2();
      break;
  }
}

// ============================
// Screens
// ============================
function drawStartScreen() {
  tint(150);
  image(map1, 0, 0, gameWidth, gameHeight);
  noTint();

  textSize(80);
  textAlign(CENTER, CENTER);
  fill(255);
  text("Welcome to the Mystery World!", width / 2, height / 6);

  // BGM
  if (s1 && !s1.isPlaying()) {
    s1.loop();
  }

  // Play button
  drawButton(width / 2 - 150, height / 3, 300, 100, "Play", () => {
    status = 2;
  });

  // Exit button (browser)
  drawButton(width / 2 - 150, height / 2 + 20, 300, 100, "Exit", () => {
    // in browser, just go back to start
    status = 1;
  });
}

function drawLevel1() {
  updateSecFromTimer();

  image(map1, 0, 0, gameWidth, gameHeight);
  image(house, gameWidth - 240, 90, 220, 240);

  if (p1.posx > 1550) {
    noStroke();
    fill(55);
    rect(gameWidth - 178, 262, 46, 65);
  }
  if (p1.posx > 1650) {
    win = true;
    status = 7;
    p1.posx = 20;
    p1.posy = 277;
  }

  p1.display();

  g1.display(); g2.display(); g3.display(); g4.display(); g5.display();
  g6.display(); g7.display(); g8.display(); g9.display(); g10.display();

  c1.display();

  e1.display(); e2.display(); e3.display(); e4.display();

  handleStars();

  handleLevelUpUI();
}

function drawPauseScreen() {
  // show stars frozen
  for (let i = 0; i < stars.length; i++) stars[i].display();
  fill(100);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("PAUSED", width / 2, height * 2 / 5);
}

function drawEndScreen() {
  tint(150);
  image(map1, 0, 0, gameWidth, gameHeight);
  noTint();

  textSize(80);
  textAlign(CENTER, CENTER);
  fill(255);
  if (win === true) text("Congratulation! You win the game!", width / 2, height / 6);
  else text("Sorry, You are dead.", width / 2, height / 6);

  // reset everything each frame (same as your code)
  resetAll();

  // record once (localStorage)
  if (isRecording === false) {
    saveRunToLocalStorage(level, win ? sec : null);
    isRecording = true;
  }

  // reset stats
  sec = 0;
  fullscore = 100;
  fullhp = 100;
  score = 0;
  hp = 100;
  level = 1;

  // buttons
  drawButton(width / 2 - 200, height / 3, 400, 100, "Play again", () => {
    status = 2;
    isRecording = false;
  });

  drawButton(width / 2 - 150, height / 2 + 20, 300, 100, "Exit", () => {
    status = 1;
  });

  drawButton(width / 2 - 250, height * 2 / 3 + 50, 500, 100, "Check Scores", () => {
    status = 6;
  });
}

function drawScoreboard() {
  const levels = loadLevelsFromLS();
  const secsArr = loadSecsFromLS();

  tint(150);
  image(map1, 0, 0, gameWidth, gameHeight);
  noTint();

  textSize(65);
  textAlign(CENTER, CENTER);
  fill(255);
  text("Highest Level", width / 4, height / 6);
  text("Shortest Time Used", width * 3 / 4, height / 6);

  // Sort copies
  const topLevels = [...levels].sort((a, b) => a - b);
  const topSecs = [...secsArr].sort((a, b) => a - b);

  textAlign(LEFT, CENTER);
  for (let i = 0; i < topLevels.length && i < 5; i++) {
    const v = topLevels[topLevels.length - 1 - i];
    text(`No.${i + 1}  Lv.${v}`, width / 4 - 150, height / 6 + 90 * (i + 1));
  }

  for (let i = 0; i < topSecs.length && i < 5; i++) {
    // your Processing had int2.get(i)/11 "sec" (frame-based). We keep same conversion.
    text(`No.${i + 1}  ${topSecs[i]} sec`, width * 3 / 4 - 190, height / 6 + 90 * (i + 1));
  }

  drawButton(width / 2 - 150, height * 2 / 3 + 50, 300, 100, "Back", () => {
    status = 5;
  });
}

function drawLevel2() {
  updateSecFromTimer();

  image(map2, 0, 0, gameWidth, gameHeight);

  if (p1.posx > 1400) {
    noStroke();
    fill(55);
    rect(gameWidth - 295, 300, 55, 65);
  }
  if (p1.posx > 1530) {
    win = true;
    status = 5;
  }

  p1.display();

  g11.display(); g12.display(); g13.display();
  g14.display(); g15.display(); g16.display();
  g17.display(); g18.display(); g19.display();
  g20.display(); g21.display(); g22.display();
  g23.display(); g24.display(); g25.display();

  e11.display(); e12.display();
  e14.display(); e15.display(); e16.display(); e17.display(); e18.display(); e19.display(); e20.display();

  handleStars();
  handleLevelUpUI();
}

// ============================
// Stars + UI bars
// ============================
function handleStars() {
  // remove dead stars and heal if hit
  for (let i = stars.length - 1; i >= 0; i--) {
    if (stars[i].dead()) {
      stars.splice(i, 1);
    } else if (stars[i].hitPlayer(p1)) {
      stars.splice(i, 1);
      hp = (hp + 5 < fullhp) ? hp + 5 : fullhp;
      if (s2 && s2.isLoaded()) { s2.stop(); s2.play(); }
    }
  }

  // spawn a star every 35 frames
  if (frameCount % 35 === 1) {
    const newStar = new Star();
    stars.push(newStar);
    newStar.changeSpeed(changeSpeed1 / 100);
  }

  // update all stars
  for (let i = 0; i < stars.length; i++) {
    if (changed === true) stars[i].changeSpeed(changeSpeed1 / 100);
    stars[i].update();
    stars[i].display();
    stars[i].move();
  }
}

function handleLevelUpUI() {
  if (score > fullscore) {
    score = score - fullscore;
    level += 1;
    fullscore += 10;
    fullhp += 20;
    hp += 20;
  }

  // HP bar
  image(heart, 30, 28, 30, 30);
  strokeWeight(3);
  stroke(139, 69, 19);
  noFill();
  rect(85, 25, 200, 30);
  noStroke();
  fill(178, 34, 34);
  rect(87, 27, 198 * (hp) / fullhp, 27);
  fill(255);
  textSize(25);
  textAlign(CENTER, CENTER);
  text(`${hp}/${fullhp}`, 185, 38);

  // EXP bar
  fill(50);
  textSize(30);
  textAlign(CENTER, CENTER);
  text("exp", 46, 80);

  strokeWeight(3);
  stroke(139, 69, 19);
  noFill();
  rect(85, 70, 200, 30);

  noStroke();
  fill(153, 204, 255);
  rect(87, 72, 198 * (score) / fullscore, 27);

  fill(50);
  textSize(25);
  textAlign(CENTER, CENTER);
  text(`${score}/${fullscore}`, 185, 84);

  // level text
  fill(50);
  textSize(28);
  textAlign(LEFT, CENTER);
  text(`Lv. ${level}`, 310, 37);
}

// ============================
// Simple button helper (Processing-style)
// ============================
function drawButton(x, y, w, h, label, onClick) {
  const hover = (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h);

  if (hover) {
    fill(255);
    rect(x, y, w, h);
    textSize(70);
    textAlign(CENTER, CENTER);
    fill(87);
    text(label, x + w / 2, y + 40);

    if (mouseIsPressed) {
      // prevent repeat triggers while held down
      if (!drawButton._pressed) {
        drawButton._pressed = true;
        onClick();
      }
    } else {
      drawButton._pressed = false;
    }
  } else {
    strokeWeight(7);
    stroke(255);
    noFill();
    rect(x, y, w, h);
    noStroke();
    textSize(70);
    textAlign(CENTER, CENTER);
    fill(255);
    text(label, x + w / 2, y + 40);
  }
}

// ============================
// UI (replaces ControlP5)
// ============================
function buildUI() {
   //Star Speed slider (100..400)
  uiStarSpeed = createSlider(100, 400, 100, 1);
  uiStarSpeed.position(20, 20);
  uiStarSpeed.style("width", "200px");

   //Game radio: continue/pause/exit
  uiRadioGame = createRadio();
  uiRadioGame.option("continue", "0");
  uiRadioGame.option("pause", "1");
  uiRadioGame.option("exit", "2");
  uiRadioGame.selected("0");
  uiRadioGame.position(20, 60);
  uiRadioGame.changed(() => {
    const v = parseInt(uiRadioGame.value(), 10);
    if (v === 0) status = (status === 4 ? 2 : status); // continue
    if (v === 1) status = 4; // pause
    if (v === 2) status = 3; // exit (browser -> back to start)
  });

  // BGM radio: mute/unmute
  uiRadioBGM = createRadio();
  uiRadioBGM.option("Mute", "0");
  uiRadioBGM.option("Unmute", "1");
  uiRadioBGM.selected("1");
  uiRadioBGM.position(20, 110);
  uiRadioBGM.changed(() => {
    const v = parseInt(uiRadioBGM.value(), 10);
    setMute(v === 0);
  });
    
  // HIDE ALL UI (keep it from breaking anything)
  uiStarSpeed.hide();
  uiRadioGame.hide();
  uiRadioBGM.hide();
}

function setMute(isMuted) {
  const all = [s1, s2, s3, s4, s5, s6].filter(Boolean);
  for (const snd of all) snd.setVolume(isMuted ? 0 : 1);
}

// ============================
// localStorage leaderboard (replaces score.txt/sec.txt)
// ============================
function loadLevelsFromLS() {
  try {
    const raw = localStorage.getItem(LS_LEVELS);
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

function loadSecsFromLS() {
  try {
    const raw = localStorage.getItem(LS_SECS);
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

function saveRunToLocalStorage(levelVal, secValOrNull) {
  const levels = loadLevelsFromLS();
  levels.push(levelVal);
  localStorage.setItem(LS_LEVELS, JSON.stringify(levels));

  if (secValOrNull !== null) {
    const secsArr = loadSecsFromLS();
    secsArr.push(secValOrNull);
    localStorage.setItem(LS_SECS, JSON.stringify(secsArr));
  }
}

// ============================
// Reset all entities (ported from your end screen)
// ============================
function resetAll() {
  p1.reset();
  p2.reset();

  g1.reset(); g2.reset(); g3.reset(); g4.reset(); g5.reset();
  g6.reset(); g7.reset(); g8.reset(); g9.reset(); g10.reset();

  e11.reset(); e12.reset();
  e14.reset(); e15.reset(); e16.reset(); e17.reset(); e18.reset(); e19.reset(); e20.reset();

  g11.reset(); g12.reset(); g13.reset(); g14.reset(); g15.reset(); g16.reset();
  g17.reset(); g18.reset(); g19.reset(); g20.reset(); g21.reset(); g22.reset(); g23.reset(); g24.reset(); g25.reset();

  c1.reset();

  e1.reset(); e2.reset(); e3.reset(); e4.reset();
}

// ============================
// Classes (ported from your Processing tabs)
// ============================
class Cherry {
  constructor(x, y) {
    this.xpos = x;
    this.ypos = y;
    this.sxpos = x;
    this.sypos = y;
    this.animate = 0;
    this.hit = false;
  }
  reset() {
    this.xpos = this.sxpos;
    this.ypos = this.sypos;
    this.animate = 0;
    this.hit = false;
  }
  display() {
    if (this.animate < 6) this.animate += 1;
    else this.animate = 0;

    if (dist(this.xpos, this.ypos, p1.posx + 55, p1.posy + 48) < (p1.rad + 5)) {
      if (this.hit === false) {
        hp = ((hp + 50) < fullhp) ? (hp + 50) : fullhp;
        if (s3 && s3.isLoaded()) { s3.stop(); s3.play(); }
      }
      this.hit = true;
    }
    if (this.hit === false) {
      image(cherry[this.animate], this.xpos, this.ypos, 45, 45);
    }
  }
}

class Gem {
  constructor(x, y) {
    this.xpos = x;
    this.ypos = y;
    this.sxpos = x;
    this.sypos = y;
    this.animate = 0;
    this.hit = false;
  }
  reset() {
    this.xpos = this.sxpos;
    this.ypos = this.sypos;
    this.animate = 0;
    this.hit = false;
  }
  display() {
    if (this.animate < 3) this.animate += 1;
    else this.animate = 0;

    if (dist(this.xpos, this.ypos, p1.posx + 55, p1.posy + 48) < (p1.rad + 5)) {
      if (this.hit === false) score += 10;
      this.hit = true;
    }
    if (this.hit === false) {
      image(gem[this.animate], this.xpos, this.ypos, 30, 30);
    }
  }
}

class Star {
  constructor() {
    this.maxR = 16;
    this.minR = 8;
    this.xpos = random(width);
    this.ypos = -this.maxR;
    this.yspd = random(2, 4);
    this.angle = 0;
    this.angleSpd = random(-0.1, 0.1);
    this.circlePos = 0;
    this.theta = random(10);
  }
  reset() {
    this.xpos = random(width);
    this.ypos = -this.maxR;
  }
  update() {
    this.ypos += this.yspd;
    this.angle += this.angleSpd;
  }
  changeSpeed(varSpeed) {
    this.yspd *= varSpeed;
  }
  display() {
    push();
    translate(this.xpos, this.ypos);
    rotate(this.angle);
    fill(187, 250, 73);
    strokeWeight(1);
    beginShape();
    for (let i = 0; i < 10; i++) {
      if (i % 2 === 0) vertex(cos(i * TWO_PI / 10) * this.maxR, sin(i * TWO_PI / 10) * this.maxR);
      else vertex(cos(i * TWO_PI / 10) * this.minR, sin(i * TWO_PI / 10) * this.minR);
    }
    endShape(CLOSE);
    pop();

    fill(235, 10, 10);
    ellipse(this.circlePos, this.ypos, (this.maxR - this.minR), (this.maxR - this.minR));
  }
  move() {
    this.circlePos = this.xpos + sin(this.theta) * (this.maxR - this.minR) * 3;
    this.theta += 0.2;
  }
  hitPlayer(p1) {
    return dist(this.xpos, this.ypos, p1.posx + 55, p1.posy + 50) < (p1.rad + 5);
  }
  dead() {
    return this.ypos > height + this.maxR;
  }
}

class Eagle {
  constructor(x, y) {
    this.xpos = x;
    this.ypos = y;
    this.sxpos = x;
    this.sypos = y;
    this.animate = 0;
    this.hit = 0;
    this.dirc = 1;
    this.die = false;
    this.high = true;
  }
  reset() {
    this.xpos = this.sxpos;
    this.ypos = this.sypos;
    this.animate = 0;
    this.hit = 0;
    this.dirc = 1;
    this.die = false;
  }
  display() {
    if (this.die === false) {
      if (this.animate < 3) this.animate += 1;
      else this.animate = 0;

      if (this.high === true) {
        if (this.ypos > 230) this.dirc = -1;
        else if (this.ypos < 40) this.dirc = 1;
      } else {
        if (this.ypos > 330) this.dirc = -1;
        else if (this.ypos < 180) this.dirc = 1;
      }

      this.ypos += 4 * this.dirc;

      if (dist(this.xpos, this.ypos, p1.posx + 55, p1.posy + 25) < (p1.rad) && p1.hurt === false) {
        if (hp > 40) {
          hp -= 40;
          p1.hurt = true;
          if (s4 && s4.isLoaded()) { s4.stop(); s4.play(); }
        } else {
          hp = 0;
          p1.die = true;
          p1.animate = 0;
          if (s5 && s5.isLoaded()) { s5.stop(); s5.play(); }
        }
      }

      if (dist(this.xpos, this.ypos, p1.posx + 90, p1.posy + 25) < (p1.rad + 5) && p1.doing === 6) {
        score += 30;
        this.die = true;
        this.animate = 0;
      }

      image(eagle[this.animate], this.xpos, this.ypos, 80, 80);
    } else {
      if (this.animate < 5) {
        this.animate += 1;
        image(edie[this.animate], this.xpos, this.ypos, 80, 80);
        if (this.animate === 1 && s6 && s6.isLoaded()) { s6.stop(); s6.play(); }
      }
    }
  }
}

// ============================
// Player class (ported from your paste)
// ============================
// ============================
// Player class (p5.js) — MAP1 + MAP2
// ============================
class Player {
  constructor(x, y) {
    this.posx = x;
    this.posy = y;
    this.sposx = x;
    this.sposy = y;

    this.state = 0;
    this.animate = -1;
    this.reach = 0;
    this.stretch = 0;
    this.doing = 0;

    this.sizex = 150;
    this.sizey = 100;
    this.rad = 60;

    this.die = false;
    this.hurt = false;
  }

  reset() {
    this.posx = this.sposx;
    this.posy = this.sposy;

    this.state = 0;
    this.animate = -1;
    this.reach = 0;
    this.stretch = 0;
    this.doing = 0;

    this.sizex = 150;
    this.sizey = 100;
    this.rad = 60;

    this.die = false;
    this.hurt = false;
  }

  display() {
    // ===================== MAP 1 (status === 2) =====================
    if (status === 2) {
      // ---- die ----
      if (this.die === true) {
        if (this.animate < 5) {
          this.animate += 1;
          image(pdie[this.animate], this.posx, this.posy, this.sizex, this.sizey);
        } else {
          image(pdie[5], this.posx, 230, this.sizex, this.sizey);
          status = 5;
          win = false;
        }
        return;
      }

      // ---- hurt ----
      if (this.hurt === true) {
        if (this.animate < 7) {
          this.animate += 1;
          this.posx -= 10;
          this.posy = 260;
          image(hurtt[this.animate], this.posx, this.posy, this.sizex, this.sizey);
        } else {
          this.hurt = false;
          this.posy = 230;
        }
        return;
      }

      // ---- jump ----
      if (this.doing === 3 && this.animate !== 6) {
        if (this.animate < 1) {
          this.animate += 1;
        } else if (this.animate < 4) {
          this.animate += 1;
          this.posy -= 20;
        } else if (this.animate < 6) {
          this.animate += 1;
          this.posy += 30;
        } else {
          this.animate = 6;
        }
        image(jump[this.animate], this.posx, this.posy, this.sizex, this.sizey);
        return;
      }

      // ---- fall down ----
      if (this.doing === 33) {
        if (this.posy < 230) {
          this.posy += 20;
          image(jump[3], this.posx, this.posy, this.sizex, this.sizey);
        } else {
          this.posy = 230;
          image(jump[3], this.posx, this.posy, this.sizex, this.sizey);
          this.doing = 0;
        }
        return;
      }

      // ---- finish attack ----
      if (this.doing === 6 && this.animate < 7) {
        this.animate += 1;
        image(attack[this.animate], this.posx, this.posy, this.sizex, this.sizey);
        return;
      }

      // ---- controls ----
      if (keyIsPressed) {
        if (key === 'a') {
          if (this.doing === 10 && this.posy < 300) {
            this.doing = 33;
            this.posx -= 10;
            image(jump[3], this.posx, this.posy, this.sizex, this.sizey);
            return;
          }

          if (this.doing !== 1) {
            this.animate = 0;
            this.doing = 1;
          }

          this.posx -= 20;
          this.animate = (this.animate < 5) ? (this.animate + 1) : 0;
          image(runLeft[this.animate], this.posx, this.posy + 20, this.sizex * 0.4, this.sizey * 0.75);
          return;

        } else if (key === 'd') {
          if (this.doing === 10 && this.posy < 230) {
            this.doing = 33;
            this.posx += 20;
            image(jump[3], this.posx, this.posy, this.sizex, this.sizey);
            return;
          }

          if (this.doing !== 2) {
            this.animate = 0;
            this.doing = 2;
          }

          this.posx += 20;
          this.animate = (this.animate < 5) ? (this.animate + 1) : 0;
          image(run[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          return;

        } else if (key === 'w') {
          if (this.doing !== 3) this.animate = 0;
          this.doing = 3;

          // climb tree in map1
          if (this.posx > 600 && this.posx < 640) {
            this.doing = 10;
            if (this.posy > 160) {
              this.animate = (this.animate < 3) ? (this.animate + 1) : 0;
              this.posy -= 6;
              image(climb[this.animate], this.posx, this.posy, this.sizex, this.sizey);
            } else {
              image(climb[0], this.posx, this.posy, this.sizex, this.sizey);
            }
            return;
          }

          // normal jump
          if (this.animate < 1) {
            this.animate += 1;
          } else if (this.animate < 4) {
            this.animate += 1;
            this.posy -= 20;
          } else if (this.animate < 6) {
            this.animate += 1;
            this.posy += 30;
          } else {
            this.animate = 0;
          }
          image(jump[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          return;

        } else if (key === 's') {
          // climb down tree in map1
          if (this.posx > 600 && this.posx < 640 && this.posy < 230) {
            this.doing = 10;
            this.animate = (this.animate < 3) ? (this.animate + 1) : 0;
            this.posy += 6;
            if (this.posy > 230) this.posy = 230;
            image(climb[this.animate], this.posx, this.posy, this.sizex, this.sizey);
            return;
          }

          // down animation
          if (this.doing !== 4) this.animate = 0;
          this.doing = 4;
          this.animate = (this.animate < 3) ? (this.animate + 1) : 0;
          image(down[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          return;

        } else if (key === ' ') {
          if (this.doing === 10 && this.posy < 230) {
            image(climb[0], this.posx, this.posy, this.sizex, this.sizey);
            return;
          }

          if (this.doing !== 6) {
            this.animate = 0;
            this.doing = 6;
          }

          this.animate = (this.animate < 6) ? (this.animate + 1) : 0;
          image(attack[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          return;

        } else {
          // idle / other keys
          if (this.doing === 10 && this.posy < 230) {
            image(climb[0], this.posx, this.posy, this.sizex, this.sizey);
            return;
          }

          if (this.doing !== 0) this.animate = 0;
          this.doing = 0;
          this.animate = (this.animate < 3) ? (this.animate + 1) : 0;
          image(idle[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          return;
        }
      }

      // no key pressed
      if (this.doing === 10 && this.posy < 230) {
        image(climb[0], this.posx, this.posy, this.sizex, this.sizey);
      } else {
        if (this.doing !== 0) this.animate = 0;
        this.doing = 0;
        this.animate = (this.animate < 3) ? (this.animate + 1) : 0;
        image(idle[this.animate], this.posx, this.posy, this.sizex, this.sizey);
      }
      return;
    }

    // ===================== MAP 2 (status === 7) =====================
    if (status === 7) {
      // ---- die ----
      if (this.die === true) {
        if (this.animate < 5) {
          this.animate += 1;
          image(pdie[this.animate], this.posx, this.posy, this.sizex, this.sizey);
        } else {
          image(pdie[5], this.posx, this.posy, this.sizex, this.sizey);
          win = false;
          status = 5;
        }
        return;
      }

      // ---- hurt ----
      if (this.hurt === true) {
        if (this.posx > 600 && this.posx < 1090) { // in highground
          if (this.doing !== 123) {
            this.doing = 123;
            this.animate = 0;
          }
          if (this.animate === 0) {
            this.animate += 1;
            this.posx -= 10;
            this.posy = 270;
            image(hurtt[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          } else if (this.animate < 7) {
            this.animate += 1;
            this.posx -= 10;
            image(hurtt[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          } else {
            this.hurt = false;
            this.animate = 0;
            this.posy = 240;
            this.doing = 2;
          }
        } else { // not in highground
          if (this.doing !== 123) {
            this.doing = 123;
            this.animate = 0;
          }
          if (this.animate === 0) {
            this.animate += 1;
            this.posx -= 10;
            this.posy = 375;
            image(hurtt[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          } else if (this.animate < 7) {
            this.animate += 1;
            this.posx -= 10;
            image(hurtt[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          } else {
            this.hurt = false;
            this.animate = 0;
            this.posy = 345;
            this.doing = 2;
          }
        }
        return;
      }

      // ---- jump ----
      if (this.doing === 3 && this.animate !== 6) {
        if (this.animate < 1) {
          this.animate += 1;
        } else if (this.animate < 4) {
          this.animate += 1;
          this.posy -= 20;
        } else if (this.animate < 6) {
          this.animate += 1;
          this.posy += 30;
        } else {
          this.animate = 6;
        }
        image(jump[this.animate], this.posx, this.posy, this.sizex, this.sizey);
        return;
      }

      // ---- fall down ----
      if (this.doing === 33) {
        if (this.posy < 365) {
          this.posy += 20;
          image(jump[3], this.posx, this.posy, this.sizex, this.sizey);
        } else {
          this.posy = 385;
          image(jump[3], this.posx, this.posy, this.sizex, this.sizey);
          this.doing = 0;
        }
        return;
      }

      // ---- finish attack ----
      if (this.doing === 6 && this.animate < 7) {
        this.animate += 1;
        image(attack[this.animate], this.posx, this.posy, this.sizex, this.sizey);
        return;
      }

      // ---- controls ----
      if (keyIsPressed) {
        if (key === 'a') {

          if (this.doing === 10 && this.posy < 385 && this.posy > 240) {
            this.doing = 33;
            this.posx -= 10;
            image(jump[3], this.posx, this.posy, this.sizex, this.sizey);
            return;
          }

          if (this.doing !== 1) {
            this.animate = 0;
            this.doing = 1;
          }

          // map2 movement constraints on highground
          if (this.posy <= 240) {
            if (this.posx > 705) this.posx -= 20;
          } else {
            this.posx -= 20;
          }

          // terrain follow (ported exactly)
          if (this.posx > 120 && this.posx < 260) {
            if (this.posy < 287) this.posy = 277;
            else this.posy -= 15;
          }
          if (this.posx > 540 && this.posx < 660) {
            this.posy -= 9;
            if (this.posy < 345) this.posy = 345;
          }
          if (this.posx > 1070 && this.posx < 1130) {
            this.posy += 15;
            if (this.posy > 385) this.posy = 385;
          }
          if (this.posx > 1280 && this.posx < 1400) {
            if (this.posy > 340) this.posy = 355;
            else this.posy += 15;
          }

          this.animate = (this.animate < 5) ? (this.animate + 1) : 0;
          image(runLeft[this.animate], this.posx, this.posy + 20, this.sizex * 0.4, this.sizey * 0.75);
          return;

        } else if (key === 'd') {

          if (this.doing === 10 && this.posy < 385 && this.posy > 240) {
            this.doing = 33;
            this.posx += 10;
            image(jump[3], this.posx, this.posy, this.sizex, this.sizey);
            return;
          }

          if (this.doing !== 2) {
            this.animate = 0;
            this.doing = 2;
          }

          if (this.posy <= 240) {
            if (this.posx < 1049) this.posx += 20;
          } else {
            this.posx += 20;
          }

          // terrain follow (ported exactly)
          if (this.posx > 120 && this.posx < 260) {
            if (this.posy > 345) this.posy = 355;
            else this.posy += 15;
          }
          if (this.posx > 540 && this.posx < 660) {
            this.posy += 9;
            if (this.posy > 385) this.posy = 385;
          }
          if (this.posx > 1070 && this.posx < 1130) {
            this.posy -= 15;
            if (this.posy < 345) this.posy = 345;
          }
          if (this.posx > 1280 && this.posx < 1400) {
            if (this.posy < 290) this.posy = 275;
            else this.posy -= 15;
          }

          this.animate = (this.animate < 5) ? (this.animate + 1) : 0;
          image(run[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          return;

        } else if (key === 'w') {

          if (this.doing !== 3) this.animate = 0;
          this.doing = 3;

          // jump on highground
          if (this.posx > 750 && this.posx < 1020 && this.posy <= 240) {
            if (this.animate < 1) this.animate += 1;
            else if (this.animate < 4) { this.animate += 1; this.posy -= 20; }
            else if (this.animate < 6) { this.animate += 1; this.posy += 30; }
            else this.animate = 0;

            image(jump[this.animate], this.posx, this.posy, this.sizex, this.sizey);
            return;
          }

          // climb tree
          if (this.posx > 750 && this.posx < 1020) {
            this.doing = 10;
            if (this.posy > 240) {
              this.animate = (this.animate < 3) ? (this.animate + 1) : 0;
              this.posy -= 6;
              if (this.posy < 240) this.posy = 240;
              image(climb[this.animate], this.posx, this.posy, this.sizex, this.sizey);
            } else {
              this.animate = 0;
              this.doing = 2;
            }
            return;
          }

          // normal jump
          if (this.animate < 1) this.animate += 1;
          else if (this.animate < 4) { this.animate += 1; this.posy -= 20; }
          else if (this.animate < 6) { this.animate += 1; this.posy += 30; }
          else this.animate = 0;

          image(jump[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          return;

        } else if (key === 's') {

          // climb down
          if (this.posx > 750 && this.posx < 1020 && this.posy < 385) {
            this.doing = 10;
            this.animate = (this.animate < 3) ? (this.animate + 1) : 0;
            this.posy += 6;
            if (this.posy > 385) this.posy = 385;
            image(climb[this.animate], this.posx, this.posy, this.sizex, this.sizey);
            return;
          }

          // down animation
          if (this.doing !== 4) this.animate = 0;
          this.doing = 4;
          this.animate = (this.animate < 3) ? (this.animate + 1) : 0;
          image(down[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          return;

        } else if (key === ' ') {

          if (this.doing === 10 && this.posy < 385 && this.posy > 250) {
            image(climb[0], this.posx, this.posy, this.sizex, this.sizey);
            return;
          }

          if (this.doing !== 6) {
            this.animate = 0;
            this.doing = 6;
          }

          this.animate = (this.animate < 6) ? (this.animate + 1) : 0;
          image(attack[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          return;

        } else {
          // idle / other keys
          if (this.doing === 10 && this.posy < 385 && this.posy > 250) {
            image(climb[0], this.posx, this.posy, this.sizex, this.sizey);
            return;
          }

          if (this.doing !== 0) this.animate = 0;
          this.doing = 0;
          this.animate = (this.animate < 3) ? (this.animate + 1) : 0;
          image(idle[this.animate], this.posx, this.posy, this.sizex, this.sizey);
          return;
        }
      }

      // no key pressed (map2)
      if (this.doing === 10 && this.posy < 385 && this.posy > 240) {
        image(climb[0], this.posx, this.posy, this.sizex, this.sizey);
      } else {
        if (this.doing !== 0) this.animate = 0;
        this.doing = 0;
        this.animate = (this.animate < 3) ? (this.animate + 1) : 0;
        image(idle[this.animate], this.posx, this.posy, this.sizex, this.sizey);
      }
      return;
    }

    // Other screens: do nothing
  }
}


