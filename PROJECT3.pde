PImage nyancat, bananacat, applecat;
boolean showStampPanel = false;
float lineSize = 5;
int hover = 0;
color currentColor = #000000;
color white = #ffffff;
int selectedStamp = 1;

void setup() {
  size(900, 700);
  background(255);
  nyancat = loadImage("https://p.kindpng.com/picc/s/433-4338219_nyan-cat-png-transparent-png.png");
  bananacat = loadImage("https://i.ytimg.com/vi/mETERG3F8tc/maxresdefault.jpg");
  applecat = loadImage("https://i.pinimg.com/originals/32/24/b0/3224b04ef5ecd11b67442cbd4c9344b0.jpg");
}

void draw() {
  fill(255);
  noStroke();
  rect(0, 0, 300, 160);
  
  // Line size slider
  fill(200);
  rect(20, 20, 200, 10);
  float knobLine = map(lineSize, 1, 20, 20, 220);
  fill(100);
  ellipse(knobLine, 25, 15, 15);
  
  fill(0);
  textSize(12);
  text("Line Size: " + int(lineSize), 20, 55);
  
  // Color buttons
  tactile(20, 80, 40, 40, 1);
  if (hover == 1) fill(#FF6666); else fill(#FF0000);
  rect(20, 80, 40, 40);
  
  tactile(70, 80, 40, 40, 2);
  if (hover == 2) fill(#66FF66); else fill(#00FF00);
  rect(70, 80, 40, 40);
  
  tactile(120, 80, 40, 40, 3);
  if (hover == 3) fill(#6666FF); else fill(#0000FF);
  rect(120, 80, 40, 40);
  
  tactile(170, 80, 40, 40, 4);
  if (hover == 4) fill(#FFFF66); else fill(#FFFF00);
  rect(170, 80, 40, 40);
  
  tactile(220, 80, 40, 40, 5);
  if (hover == 5) fill(#666666); else fill(#000000);
  rect(220, 80, 40, 40);
  
  // Eraser
  tactile(270, 80, 40, 40, 6);
  if (hover == 6) fill(200); else fill(240);
  rect(270, 80, 40, 40);
  fill(0);
  textSize(10);
  text("ERASER", 275, 105);
  
  // Clear
  tactile(350, 80, 60, 40, 7);
  if (hover == 7) fill(200); else fill(150);
  rect(350, 80, 60, 40);
  fill(0);
  text("CLEAR", 365, 105);
  
  // Stamp toggle button
  tactile(420, 80, 80, 40, 8);
  if (hover == 8) fill(200); else fill(150);
  rect(420, 80, 80, 40);
  fill(0);
  if (showStampPanel) text("DRAW", 455, 105);
  else text("STAMP", 455, 105);
  
  // Drawing area border
  noFill();
  stroke(0);
  strokeWeight(2);
  rect(300, 140, 580, 540);
  
  // Stamp selection panel (on the right side of stamp button)
  if (showStampPanel) {
    fill(255);
    stroke(0);
    strokeWeight(2);
    rect(520, 80, 360, 60);
    
    // Stamp 1
    if (mouseX > 530 && mouseX < 590 && mouseY > 90 && mouseY < 130) {
      strokeWeight(4);
    } else {
      strokeWeight(1);
    }
    stroke(0);
    fill(255);
    rect(530, 90, 50, 50);
    if (nyancat != null) image(nyancat, 535, 95, 40, 40);
    
    // Stamp 2
    if (mouseX > 600 && mouseX < 660 && mouseY > 90 && mouseY < 130) {
      strokeWeight(4);
    } else {
      strokeWeight(1);
    }
    stroke(0);
    fill(255);
    rect(600, 90, 50, 50);
    if (bananacat != null) image(bananacat, 605, 95, 40, 40);
    
    // Stamp 3
    if (mouseX > 670 && mouseX < 730 && mouseY > 90 && mouseY < 130) {
      strokeWeight(4);
    } else {
      strokeWeight(1);
    }
    stroke(0);
    fill(255);
    rect(670, 90, 50, 50);
    if (applecat != null) image(applecat, 675, 95, 40, 40);
  }
  
  // Slider
  if (mousePressed && dist(mouseX, mouseY, knobLine, 25) < 10) {
    lineSize = constrain(map(mouseX, 20, 220, 1, 20), 1, 20);
  }
  
  // Color pick
  if (mousePressed && mouseY > 80 && mouseY < 120) {
    if (mouseX > 20 && mouseX < 60) currentColor = #FF0000;
    if (mouseX > 70 && mouseX < 110) currentColor = #00FF00;
    if (mouseX > 120 && mouseX < 160) currentColor = #0000FF;
    if (mouseX > 170 && mouseX < 210) currentColor = #FFFF00;
    if (mouseX > 220 && mouseX < 260) currentColor = #000000;
    if (mouseX > 350 && mouseX < 410) background(255);
  }
  
  // Eraser
  if (mousePressed && mouseX > 270 && mouseX < 310 && mouseY > 80 && mouseY < 120) {
    currentColor = #FFFFFF;
  }
  
  // Stamp selection click
  if (showStampPanel && mousePressed && mouseY > 90 && mouseY < 140) {
    if (mouseX > 530 && mouseX < 590) selectedStamp = 1;
    if (mouseX > 600 && mouseX < 660) selectedStamp = 2;
    if (mouseX > 670 && mouseX < 730) selectedStamp = 3;
  }
}

void mouseDragged() {
  if (!showStampPanel) {
    if (mouseX > 300 && mouseX < 880 && mouseY > 140 && mouseY < 680) {
      stroke(currentColor);
      strokeWeight(lineSize);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  } else {
    if (mouseX > 300 && mouseX < 880 && mouseY > 140 && mouseY < 680) {
      PImage selected = nyancat;
      if (selectedStamp == 1) selected = nyancat;
      if (selectedStamp == 2) selected = bananacat;
      if (selectedStamp == 3) selected = applecat;
      
      if (selected != null) {
        tint(white);
        image(selected, mouseX - 25, mouseY - 25, 50, 50);
        noTint();
      }
    }
  }
}

void mouseReleased() {
  if (mouseX > 420 && mouseX < 500 && mouseY > 80 && mouseY < 120) {
    showStampPanel = !showStampPanel;
  }
}

void tactile(int x, int y, int w, int h, int id) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    hover = id;
  } else if (hover == id) {
    hover = 0;
  }
  strokeWeight(1);
  stroke(0);
}
