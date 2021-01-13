//-----------------------------------------------
//TO DO :
//# optimisation (calcul noise 1x)
//# fly X, Y avec inertie (velocité, acceleration)
//# système de "LFO" à appliquer a n'importe quel paramètre
//# Mesh dynamique

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

FractalGrid gridPoint = new FractalGrid(2, 1500, 1500, 15);

boolean go = true;
int bg = 0;

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++

void setup() {
  size(1000, 1000, P3D);
  colorMode(HSB, 360);
  noFill();
  stroke(255);
  
  gridPoint.move(width/2, height/2);
}

void draw() {
  background(bg);

  keyAssignement();

  push();
  gridPoint.calculateNoise();
  gridPoint.show();
  gridPoint.limits();
  gridPoint.mode = mod1 % 2 + 1;
  pop();

  push();
  if (bg > 180) {fill(0);} else fill(255);
  textSize(20);
  String sFreq = nf(gridPoint.freq, 0, 3);
  String sxF = nf(gridPoint.xFly, 0, 3);
  String sxFA = nf(gridPoint.xFlyAcc, 0, 3);
  String sxFV = nf(gridPoint.xFlyVel, 0, 3);
  String syFV = nf(gridPoint.yFlyVel, 0, 3);
  String s = nf(gridPoint.speed, 0, 3);
  text("X:"+gridPoint.posX+" Y:"+gridPoint.posY, 50, height-60);
  text(" xVel:"+sxFV+" yVel:"+syFV, 50, height - 40);
  text("freq:"+sFreq+", Amp:"+int(gridPoint.amp)+" speed:"+s, 50, height - 20);
  text("fps: "+frameRate, 0, 20);
  pop();
}


void mousePressed() {
  go = !go;
}
