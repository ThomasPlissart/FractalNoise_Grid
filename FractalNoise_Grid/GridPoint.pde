// GridPoint est un objet permettant de générer une grille de points affectés par un Perlin Noise


class GridPoint {

  float posX, posY, xRot; // paramètres liés aux transformations dans l'espace
  float xoff, yoff, zoff, speed, amp, freq, flying; // paramètres liés au noise
  float opacity;
  int cols, rows, gridWidth, gridHeight, gridScale; // paramètres liés à la structure de la grille
  float noiseValues[][]; // tableau à 2 dimensions permettant de stocker les valeurs de noise

  //CONSTRUCTEUR
  GridPoint(int w, int h, int scl, float s) {
    gridWidth = w;
    gridHeight = h;
    gridScale = scl;

    xRot = 45;
    opacity = 1;

    cols = gridWidth / gridScale;
    rows = gridHeight / gridScale;

    noiseValues = new float[cols][rows];
    xoff = 0;
    yoff = 0;
    zoff = 0;

    speed = s;
    amp = 0;
    freq = 0.1;
    flying = 0;
  }

  //Fonction liée au perlin noise
  //
  //permet de calculer/modifier le noise et l'enregistrer dans le tableau noiseValue qui sera utilisé pour 
  //modifier le mesh de la grille
  void calculateNoise() {
    yoff = flying;
    for (int y = 0; y < rows; y++) {
      xoff = 0;
      for (int x = 0; x < cols; x++) {     
        noiseValues[x][y] = map(noise(xoff, yoff, zoff), 0, 1, -amp, amp);
        xoff += freq;
      }      
      yoff += freq;
    }
    zoff += speed;
    flying += speed;
  }

  //Fonction permettant d'afficher la grille
  void show() {  
    if (opacity > 0) { // permet de ne pas calculer tout ça si on ne le voit pas -> optimisation performances
      translate(width/2, height/2);
      rotateX(radians(xRot)); // permet de tourner sur l'axe X via un nombre en degrés plutôt qu'en radian
      translate(-gridWidth/2, -gridHeight/2);

      noFill();
      stroke(255);
      strokeWeight(3);

// beginsShape et endShape permettent de placer des vertex pour créer un mesh
      for (int y = 0; y < rows-1; y++) {
        beginShape(POINTS);  //POINT dit à la shape de créer un point sur chaque vertex
        stroke(255, map(y, 0, rows-1, 0, 255)*opacity); //mappe l'opacité de la couleur pour que les vertex au loin soient transparent
        for (int x = 0; x < cols; x++) {     
          vertex(x*gridScale, y*gridScale, noiseValues[x][y]); // crée un vertex tous les "gridscale" et lui donne une position en Z par rapport au tableau de noise
        }
        endShape();
      }
    }
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
}
