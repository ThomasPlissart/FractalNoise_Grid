GridTri gridTri = new GridTri(1400, 800, 30, 0.006);
GridTri gridTri2 = new GridTri(1400, 800, 30, 0.006);
GridPoint gridPoint = new GridPoint(1000, 200, 5, 0.006);

boolean go = true;

// Fonctions spéciales Processing : 
// - setup : fonction one shot pour initialiser la scène
// - draw : le programme passe dans draw à chaque frame => Loop

void setup() {
  size(1000, 1000, P3D);
  noFill();
  stroke(255);
}

void draw() {
  background(0); //rafraîchi le background à chaque frame

  // push() et pop() permettent de créer une sorte de layer dans lequel tous les paramètre de transformation lui sont propre.
  // Ainsi, chaque Layer a son propre espace et les fonctions qui touchent à la mise en forme n'interfèrent pas entre les différents Layer

  //Layer 1 GridTri BAS
  push();
  gridTri.setAmp(200);
  gridTri.setFreq(0.04);
  gridTri.rotX(80);
  gridTri.move(0, 500);
  gridTri.calculateNoise();
  gridTri.show();
  pop();

  //Layer 2  GridPoint
  push();
  gridPoint.setAmp(map(mouseY, 0, height, 0, 200)); //resize la valeur de mouseY, qui est entre 0 et height, de 0 à 200
  gridPoint.setSpeed(map(mouseY, 0, height, 0, 0.05));
  gridPoint.setFreq(0.04);
  gridPoint.rotX(90);
  gridPoint.calculateNoise();
  //gridPoint.setOpacity(map(mouseY, 0, height, 0, 1));
  if (go) {
    gridPoint.show();
  }
  pop();

  //Layer3  GridTri HAUT
  push();
  gridTri2.setAmp(200);
  gridTri2.setFreq(0.04);
  gridTri2.rotX(100);
  gridTri2.move(0, -500);
  gridTri2.calculateNoise();
  gridTri2.show();
  pop();
}

void mousePressed() {
  go = !go;
}
