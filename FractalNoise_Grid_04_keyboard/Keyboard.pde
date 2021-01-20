float mod;
int mod1 = 1, i = 0;
boolean[] keys = new boolean[32];

void keyAssignement() {
  /*A : Frequence*/  if (keys[0]) {
    gridPoint.freq += mod * 0.001;
  }
  /*Z : Amplitude*/  if (keys[1]) {
    gridPoint.amp += mod*10;
  }
  /*E : Rotation X*/  if (keys[2]) {
    gridPoint.xRot += mod;
  }
  /*R : Rotation Y*/  if (keys[3]) {
    gridPoint.yRot += mod;
  }
  /*T : Position X*/  if (keys[4]) {
    gridPoint.posX += mod*5;
  }
  /*Y : Position Y*/  if (keys[5]) {
    gridPoint.posY += mod*5;
  }
  /*U : Position Z*/  if (keys[6]) {
    gridPoint.posZ += mod*5;
  }
  /*I : Background color*/  if (keys[7]) {
    bg += mod*10;
  }
  /*O : Fade IN mesh*/  if (keys[8]) {
    gridPoint.fadeIn += mod*10;
  }
  /*P : Fade OUT mesh*/  if (keys[9]) {
    gridPoint.fadeOut += mod*10;
  }
  /*Q : Evolution speed (noise)*/  if (keys[10]) {
    gridPoint.speed += mod*0.0001;
  }
  /*S : Stroke Weight*/  if (keys[11]) {
    gridPoint.weight += mod*0.1;
  }
  /*D : Fly Speed X*/  if (keys[12]) {
    gridPoint.xFlySpeed += mod*0.001;
  }
  /*F : Fly Speed Y*/  if (keys[13]) {
    gridPoint.yFlySpeed += mod*0.001;
  }
  /*G : Show a Shape*/  if (keys[14]) {
    shapeAlpha = 360;
    shape = floor(random(2));
    shapeFill = floor(random(2));
  }
  /*H : Strobe*/  if (keys[15]) {
    strobeAlpha = 360;
  }
  /*J : Value of color*/  if (keys[16]) {
    gridPoint.val += mod*5;
  }
  /*K : Saturation of color*/  if (keys[17]) {
    gridPoint.sat += mod*5;
  }
  /*L : Color on IN line mesh*/  if (keys[18]) {
    gridPoint.clrIn += mod*5;
  }
  /*M : Color on OUT line mesh*/  if (keys[19]) {
    gridPoint.clrOut += mod*5;
  }
}


void keyPressed() {
  switch (key) {
  case 'a':
    keys[0] = true;
    break;
  case 'z':
    keys[1] = true;      
    break;
  case 'e':
    keys[2] = true;      
    break;
  case 'r':
    keys[3] = true;      
    break;
  case 't':
    keys[4] = true;      
    break;
  case 'y':
    keys[5] = true;      
    break;
  case 'u':
    keys[6] = true;      
    break;
  case 'i':
    keys[7] = true;      
    break;
  case 'o':
    keys[8] = true;      
    break;
  case 'p':
    keys[9] = true;      
    break;
  case 'q':
    keys[10] = true;
    break;
  case 's':
    keys[11] = true;      
    break;
  case 'd':
    keys[12] = true;      
    break;
  case 'f':
    keys[13] = true;      
    break;
  case 'g':
    keys[14] = true;      
    break;
  case 'h':
    keys[15] = true;      
    break;
  case 'j':
    keys[16] = true;      
    break;
  case 'k':
    keys[17] = true;      
    break;
  case 'l':
    keys[18] = true;      
    break;
  case 'm':
    keys[19] = true;      
    break;
  }

  //+++++++++++++++++++

  if (keyCode == 38) {
    mod = 1;
  } else if (keyCode == 40) {
    mod = -1;
  }
  if (keyCode == 37) mod1++;
  if (keyCode == 39) gridPoint.reset();

  // SPACE : Save image
  if (keyCode == 32) {    
    save("/Render/render" + i + ".png");
    i++;
  }
}

void keyReleased() {
  switch (key) {
  case 'a':
    keys[0] = false;
    break;
  case 'z':
    keys[1] = false;      
    break;
  case 'e':
    keys[2] = false;      
    break;
  case 'r':
    keys[3] = false;      
    break;
  case 't':
    keys[4] = false;      
    break;
  case 'y':
    keys[5] = false;      
    break;
  case 'u':
    keys[6] = false;      
    break;
  case 'i':
    keys[7] = false;      
    break;
  case 'o':
    keys[8] = false;      
    break;
  case 'p':
    keys[9] = false;      
    break;
  case 'q':
    keys[10] = false;
    break;
  case 's':
    keys[11] = false;      
    break;
  case 'd':
    keys[12] = false;      
    break;
  case 'f':
    keys[13] = false;      
    break;
  case 'g':
    keys[14] = false;      
    break;
  case 'h':
    keys[15] = false;      
    break;
  case 'j':
    keys[16] = false;      
    break;
  case 'k':
    keys[17] = false;      
    break;
  case 'l':
    keys[18] = false;      
    break;
  case 'm':
    keys[19] = false;      
    break;
  }

  //+++++++++++++++++++

  if ((keyCode == 38)||(keyCode == 40)) {
    mod = 0;
  }
}
