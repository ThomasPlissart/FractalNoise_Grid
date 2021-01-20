//-----------------------------------------------
//TO DO :
//# optimisation (calcul noise 1x)
//# fly X, Y avec inertie (velocité, acceleration)
//# système de "LFO" à appliquer a n'importe quel paramètre -> oscillateur
//# Mesh dynamique
//# Tempo
//# piano mode rect

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++
import themidibus.*; //Import the library
import spout.*;
MidiBus myBus; // The MidiBus
Spout spout;

FractalGrid gridPoint = new FractalGrid(2, 1100, 1100, 15);

boolean go;
int bg = 0;

int strobeAlpha = 0, shapeAlpha = 0, shape, shapeFill, shapeSize = 400;
float strobeFade = 5;

float ctrl[] = new float [128];
float note[] = new float [128];

// SPACE = Save image

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++

void setup() {
  size(1000, 1000, P3D);
  colorMode(HSB, 360);
  rectMode(CENTER);
  noFill();
  stroke(255);

  spout = new Spout(this);
  spout.createSender("Spout Processing");

  MidiBus.list();
  myBus = new MidiBus(this, "APC40 mkII", "APC40 mkII");

  gridPoint.move(width/2, height/2, 0);
}

void draw() {
  //bg = int(note[58]*360);
  background(bg);

  keyAssignement();

  push();
  gridPoint.calculateNoise();

  /*
  gridPoint.mode = int(1+ note[59]);
   
   gridPoint.setAmp(ctrl[48]*width);
   gridPoint.setFreq(ctrl[49]*0.1);
   gridPoint.setSpeed(ctrl[50]*0.05);
   gridPoint.setFly(-map(ctrl[51], 0, 1, -1, 1)*0.01, map(ctrl[52], 0, 1, -1, 1)*0.01);
   gridPoint.move(width/2, height/2 + map(ctrl[53], 0, 1, -1, 1)*height/2, ctrl[54]*500);  
   gridPoint.weight = 0.1+ctrl[55]*40;
   
   gridPoint.rot(45 + map(ctrl[16], 0, 1, -1, 1)*45, ctrl[17]*90); 
   gridPoint.setFade(255 - int(ctrl[18]*360), 255 - int(ctrl[19]*360)); 
   gridPoint.val = int(ctrl[20]*360);
   gridPoint.sat = int(ctrl[21]*360);
   gridPoint.setClr(int(ctrl[22]*360), int(ctrl[23]*360)); 
   */
  gridPoint.show();
  gridPoint.limits();
  gridPoint.mode = mod1 % 2 + 1;
  pop();

  push();
  if (shapeAlpha > 0) {
    if (shapeFill == 0) {
      noStroke();
      fill(360 - bg, shapeAlpha);
    } else {
      noFill();
      strokeWeight(5);
      stroke(360 - bg, shapeAlpha);
    }
    if (shape == 0) rect(width/2, height/2, shapeSize, shapeSize);
    if (shape == 1) ellipse(width/2, height/2, shapeSize, shapeSize);

    shapeAlpha -= strobeFade;
  }
  pop();

  push();
  translate(0, 0, 200);
  noStroke();
  if (strobeAlpha > 0) {
    fill(360 - bg, strobeAlpha);
    rect(width/2, height/2, width, height);
    strobeAlpha -= strobeFade;
  }
  pop();

  if (go) {
    push();
    fill(0, 360, 360);
    textSize(20);
    String sFreq = nf(gridPoint.freq, 0, 3);
    String sxF = nf(gridPoint.xFly, 0, 3);
    String sxFS = nf(gridPoint.xFlySpeed, 0, 3);
    String syFS = nf(gridPoint.yFlySpeed, 0, 3);
    String sxFT = nf(gridPoint.xFlyTarget, 0, 3);
    String s = nf(gridPoint.speed, 0, 3);
    text("Xrot:"+gridPoint.xRot+" Yrot:"+gridPoint.yRot, 50, height-80);
    text("X:"+gridPoint.posX+" Y:"+gridPoint.posY+" Z:"+gridPoint.posZ, 50, height-60);
    text("xFly:"+sxFS+" yFly:"+syFS, 50, height - 40);
    text("freq:"+sFreq+", Amp:"+int(gridPoint.amp)+" speed:"+s, 50, height - 20);
    text("fps: "+frameRate, 0, 20);
    pop();
  }


  spout.sendTexture();
}

void mousePressed() {
  go = !go;
}

void controllerChange(int channel, int number, int value) {
  ctrl[number] = map(value, 0, 127, 0, 1);
}

void noteOn(int channel, int pitch, int velocity) {
  if (pitch == 0) {
    shapeAlpha = 360;
    shape = floor(random(2));
    shapeFill = floor(random(2));
  } else if (pitch == 7) {
    strobeAlpha = 360;
  } else {
    note[pitch] = map(velocity, 0, 127, 0, 1);
  }
}

void noteOff(int channel, int pitch, int velocity) {
  if ((pitch < 40)&&(pitch >= 0)) {
  } else {
    note[pitch] = 0;
  }
}
