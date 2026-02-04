let heart;

function preload() {
  heart = loadImage("heart.png"); // uses your existing repo file
}

function setup() {
  const c = createCanvas(960, 320);
  c.parent("game");
}

function draw() {
  background(0);
  image(heart, 30, 30, 80, 80);
  fill(255);
  textSize(20);
  text("GitHub Pages is working ✅", 130, 75);
}
