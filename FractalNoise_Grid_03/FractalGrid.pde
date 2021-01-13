// GridPoint est un objet permettant de générer une grille de points affectés par un Perlin Noise


class FractalGrid {
  
  int mode;
  int hue = 0, sat = 0, val = 360, clrIn = 0, clrOut = 360;
  float posX, posY, posZ, xRot = 45, yRot = 0; //transformations dans l'espace
  float xoff = 0, yoff = 0, zoff = 0, speed, amp = 100, freq = 0.1; //noise
  float xFly = 0, yFly = 0, xFlyAcc, yFlyAcc, xFlyVel, yFlyVel, ease = 0.02;//noise fly
  float opacity = 1, weight = 1;
  int fadeIn = 255, fadeOut = 255;
  int cols, rows, gridWidth, gridHeight, gridScale; //structure grille
  float noiseValues[][]; 

  //CONSTRUCTEUR
  FractalGrid(int _mode, int w, int h, int scl) {
    mode = _mode;

    gridWidth = w;
    gridHeight = h;
    gridScale = scl;

    cols = gridWidth / gridScale;
    rows = gridHeight / gridScale;

    noiseValues = new float[cols][rows];
  }

  FractalGrid(int _mode, int w, int h) {
    mode = _mode;

    fadeIn = fadeOut = 255;

    xFlyVel = yFlyVel = 0;

    gridWidth = w;
    gridHeight = h;
    gridScale = 25;

    cols = gridWidth / gridScale;
    rows = gridHeight / gridScale;

    noiseValues = new float[cols][rows];
  }

  //Fonction liée au perlin noise
  //
  //permet de calculer/modifier le noise et l'enregistrer dans le tableau noiseValue qui sera utilisé pour 
  //modifier le mesh de la grille
  void calculateNoise() {
    float mx = -map(mouseX,0,width,0,10), 
          my = -map(mouseY,0,height,0,10);
    
    yoff = yFly;
    for (int y = 0; y < rows; y++) {
      xoff = xFly;
      for (int x = 0; x < cols; x++) {     
        noiseValues[x][y] = map(noise(xoff, yoff, zoff), 0, 1, -amp, amp);
        xoff += freq;
      }      
      yoff += freq;
    }
    // /!\ PAS TROUVE DE SOLUTION
    xFlyAcc = (mx - xFly) * ease;
    yFlyAcc = (my - yFly) * ease;
    
    zoff += speed;
    xFly += xFlyVel;
    yFly += yFlyVel;
  }

  //Fonction permettant d'afficher la grille
  void show() {  
    if (opacity > 0) { // permet de ne pas calculer tout ça si on ne le voit pas -> optimisation performances
      translate(posX, posY, posZ);
      rotateX(radians(xRot));
      rotateY(radians(yRot));
      translate(-gridWidth/2, -gridHeight/2);

      strokeWeight(weight);
      //fill(0);

      if (mode == 1) {
        for (int y = 0; y < rows-1; y++) {
          beginShape(POINTS);
          hue = int(map(y, 0, rows-1, clrOut, clrIn));
          stroke(hue, sat, val, map(y, 0, rows-1, fadeOut, fadeIn)*opacity);
          for (int x = 0; x < cols; x++) {  
            vertex(x*gridScale, y*gridScale, noiseValues[x][y]);
          }
          endShape();
        }
      } else if (mode == 2) {
        for (int y = 0; y < rows-1; y++) {
          beginShape(TRIANGLE_STRIP);
          hue = int(map(y, 0, rows-1, clrOut, clrIn));
          stroke(hue, sat, val, map(y, 0, rows-1, fadeOut, fadeIn)*opacity);
          for (int x = 0; x < cols; x++) {     
            vertex(x*gridScale, y*gridScale, noiseValues[x][y]);
            vertex(x*gridScale, (y+1)*gridScale, noiseValues[x][y+1]);
          }
          endShape();
        }
      }
    }
  }

  void limits() {
    if (fadeIn < -200) fadeIn = -200;
    if (fadeIn > 255) fadeIn = 255;
    if (fadeOut < -200) fadeOut = -200;
    if (fadeOut > 255) fadeOut = 255;
  }
  
  void reset() {
  }

  // toute les fonctions permettant d'affecter la grid
  void rotX(float value) {
    xRot = value;
  }

  void setSpeed(float value) {
    speed = value;
  }

  void setAmp(float value) {
    amp = value;
  }

  void setFreq(float value) {
    freq = value;
  }

  void setGridWidth(int value) {
    gridWidth = value;
  }

  void move(float x, float y) {
    posX = x;
    posY = y;
  }

  void setOpacity(float value) {
    opacity = value;
  }

  void setMesh (int _w, int _h, int _scl) {
    gridWidth = _w;
    gridHeight = _h;
    gridScale = _scl;
  }
}
