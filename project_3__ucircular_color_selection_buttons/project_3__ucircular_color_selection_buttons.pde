// Cat pictures for stamps
PImage nyancat;
PImage bananacat;
PImage applecat;

// Stamp panel open or closed
boolean showStampPanel = false;

// Pen size
float lineSize = 5;

// Which button mouse is over
int hover = 0;

// Current color
color currentColor = #000000;

// Stamp color white
color white = #ffffff;

// Which stamp 1 2 or 3
int selectedStamp = 1;

void setup() {
  size(900, 700);
  background(255);
  nyancat = loadImage("https://p.kindpng.com/picc/s/433-4338219_nyan-cat-png-transparent-png.png");
  bananacat = loadImage("https://i.ytimg.com/vi/mETERG3F8tc/maxresdefault.jpg");
  applecat = loadImage("https://i.pinimg.com/originals/32/24/b0/3224b04ef5ecd11b67442cbd4c9344b0.jpg");
}

void draw() {
  // Clear left panel
  fill(255);
  noStroke();
  rect(0, 0, 300, 160);
  
  // Pen size slider
  fill(200);
  rect(20, 20, 200, 10);
  float knobLine = map(lineSize, 1, 20, 20, 220);
  fill(100);
  ellipse(knobLine, 25, 15, 15);
  
  fill(0);
  textSize(12);
  text("Pen Size " + int(lineSize), 20, 55);
  
  // Red circle
  tactileCircle(35, 95, 30, 1);
  if (hover == 1) fill(#FF6666); else fill(#FF0000);
  ellipse(35, 95, 30, 30);
  
  // Green circle
  tactileCircle(85, 95, 30, 2);
  if (hover == 2) fill(#66FF66); else fill(#00FF00);
  ellipse(85, 95, 30, 30);
  
  // Blue circle
  tactileCircle(135, 95, 30, 3);
  if (hover == 3) fill(#6666FF); else fill(#0000FF);
  ellipse(135, 95, 30, 30);
  
  // Yellow circle
  tactileCircle(185, 95, 30, 4);
  if (hover == 4) fill(#FFFF66); else fill(#FFFF00);
  ellipse(185, 95, 30, 30);
  
  // Black circle
  tactileCircle(235, 95, 30, 5);
  if (hover == 5) fill(#666666); else fill(#000000);
  ellipse(235, 95, 30, 30);
  
  // Eraser square
  tactile(270, 80, 40, 40, 6);
  if (hover == 6) fill(200); else fill(240);
  rect(270, 80, 40, 40);
  fill(0);
  textSize(10);
  text("ERASE", 275, 105);
  
  // Clear button
  tactile(350, 80, 60, 40, 7);
  if (hover == 7) fill(200); else fill(150);
  rect(350, 80, 60, 40);
  fill(0);
  text("CLEAR", 365, 105);
  
  // Stamp mode button
  tactile(420, 80, 80, 40, 8);
  if (hover == 8) fill(200); else fill(150);
  rect(420, 80, 80, 40);
  fill(0);
  if (showStampPanel) text("DRAW", 455, 105);
  else text("STAMP", 455, 105);
  
  // Save button
  tactile(20, 130, 60, 30, 9);
  if (hover == 9) fill(200); else fill(150);
  rect(20, 130, 60, 30);
  fill(0);
  textSize(12);
  text("SAVE", 35, 150);
  
  // Load button
  tactile(90, 130, 60, 30, 10);
  if (hover == 10) fill(200); else fill(150);
  rect(90, 130, 60, 30);
  fill(0);
  text("LOAD", 105, 150);
  
  // Drawing area border
  noFill();
  stroke(0);
  strokeWeight(2);
  rect(300, 140, 580, 540);
  
  // Stamp panel
  if (showStampPanel) {
    fill(255);
    stroke(0);
    strokeWeight(2);
    rect(520, 80, 360, 60);
    
    // Stamp 1 Nyan
    if (mouseX > 530 && mouseX < 590 && mouseY > 90 && mouseY < 130) {
      strokeWeight(4);
    } else {
      strokeWeight(1);
    }
    stroke(0);
    fill(255);
    rect(530, 90, 50, 50);
    if (nyancat != null) image(nyancat, 535, 95, 40, 40);
    
    // Stamp 2 Banana
    if (mouseX > 600 && mouseX < 660 && mouseY > 90 && mouseY < 130) {
      strokeWeight(4);
    } else {
      strokeWeight(1);
    }
    stroke(0);
    fill(255);
    rect(600, 90, 50, 50);
    if (bananacat != null) image(bananacat, 605, 95, 40, 40);
    
    // Stamp 3 Apple
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
  
  // Save click
  if (mousePressed && mouseX > 20 && mouseX < 80 && mouseY > 130 && mouseY < 160) {
    selectOutput("Save your drawing", "saveImage");
  }
  
  // Load click
  if (mousePressed && mouseX > 90 && mouseX < 150 && mouseY > 130 && mouseY < 160) {
    selectInput("Load an image", "openImage");
  }
  
  // Slider drag
  if (mousePressed && dist(mouseX, mouseY, knobLine, 25) < 10) {
    lineSize = constrain(map(mouseX, 20, 220, 1, 20), 1, 20);
  }
  
  // Pick color from circles
  if (mousePressed) {
    if (dist(mouseX, mouseY, 35, 95) < 15) currentColor = #FF0000;
    if (dist(mouseX, mouseY, 85, 95) < 15) currentColor = #00FF00;
    if (dist(mouseX, mouseY, 135, 95) < 15) currentColor = #0000FF;
    if (dist(mouseX, mouseY, 185, 95) < 15) currentColor = #FFFF00;
    if (dist(mouseX, mouseY, 235, 95) < 15) currentColor = #000000;
    if (mouseX > 270 && mouseX < 310 && mouseY > 80 && mouseY < 120) currentColor = #FFFFFF;
    if (mouseX > 350 && mouseX < 410 && mouseY > 80 && mouseY < 120) background(255);
  }
  
  // Pick stamp
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

void saveImage(File f) {
  if (f != null) {
    PImage canvas = get(300, 140, 580, 540);
    canvas.save(f.getAbsolutePath());
  }
}

void openImage(File f) {
  if (f != null) {
    PImage pic = loadImage(f.getAbsolutePath());
    image(pic, 300, 140, 580, 540);
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

void tactileCircle(int x, int y, int r, int id) {
  if (dist(mouseX, mouseY, x, y) < r) {
    hover = id;
    strokeWeight(3);
  } else if (hover == id) {
    hover = 0;
    strokeWeight(1);
  } else {
    strokeWeight(1);
  }
  stroke(0);
}
