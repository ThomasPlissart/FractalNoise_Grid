class GridTri {

  float posX, posY, xRot, amp, freq;
  float xoff, yoff, zoff, speed, flying;
  int gridWidth, gridHeight, gridScale;
  int cols, rows;
  float noiseValues[][];

  GridTri(int w, int h, int scl, float s) {
    gridWidth = w;
    gridHeight = h;
    gridScale = scl;

    float opacity;

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

  void calculateNoise() {
    yoff = flying;
    for (int y = 0; y < rows; y++) {
      xoff = 0;
      for (int x = 0; x < cols; x++) {     
        noiseValues[x][y] = map(noise(xoff, yoff), 0, 1, -amp, amp);
        xoff += freq;
      }      
      yoff += freq;
    }
    zoff += speed;
    flying += speed;
  }

  void show() {  
    translate(width/2 + posX, height/2 + posY);
    rotateX(radians(xRot));
    translate(-gridWidth/2, -gridHeight/2);

    for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      stroke(map(y, 0, rows-1, 0, 255));
      for (int x = 0; x < cols; x++) {     
        vertex(x*gridScale, y*gridScale, noiseValues[x][y]);
        vertex(x*gridScale, (y+1)*gridScale, noiseValues[x][y+1]);
      }
      endShape();
    }
  }

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
}
