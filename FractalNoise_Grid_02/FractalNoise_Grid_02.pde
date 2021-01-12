//-----------------------------------------------
//TO DO :
//# optimisation (calcul noise 1x)
//# fly X, Y avec inertie (velocité, acceleration)
//# système de "LFO" à appliquer a n'importe quel paramètre
//# Mesh dynamique

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

FractalGrid gridPoint = new FractalGrid(2, 1500, 1500, 10);

boolean go = true;

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++

void setup() {
  size(1000, 1000, P3D);
  noFill();
  stroke(255);
}

void draw() {
  background(0);

  keyAssignement();

  gridPoint.move(width/2, height/2);

  push();
  gridPoint.calculateNoise();
  gridPoint.show();
  gridPoint.limits();
  gridPoint.mode = mod1 % 2 + 1;
  println(mod1 % 2);
  pop();

  push();
  textSize(32);
  String sFreq = nf(gridPoint.freq, 0, 3);
  String sxF = nf(gridPoint.xFly, 0, 3);
  String sxFA = nf(gridPoint.xFlyAcc, 0, 3);
  text("freq:"+sFreq+", Amp:"+int(gridPoint.amp)+" xFly:"+sxF+" xAcc:"+sxFA, 50, height - 50);
  pop();
}


void mousePressed() {
  go = !go;
}
