float mod;
int mod1 = 1;
boolean[] keys = new boolean[32];

void keyAssignement() {
  if (keys[0]) {
    gridPoint.freq += mod * 0.001;
  }
  if (keys[1]) {
    gridPoint.amp += mod*10;
  }
  if (keys[2]) {
    gridPoint.xRot += mod;
  }
  if (keys[3]) {
    gridPoint.yRot += mod;
  }
  if (keys[4]) {
    gridPoint.fadeOut += mod*10;
  }
  if (keys[5]) {
    gridPoint.fadeIn += mod*10;
  }
  if (keys[6]) {
    gridPoint.weight += mod*0.1;
  }
  if (keys[7]) {
    gridPoint.xFlyAcc += mod*0.001;
  }
  if (keys[8]) {
    gridPoint.speed += mod * 0.0001;
  }
  if (keys[9]) {
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
  }

  //+++++++++++++++++++

  if (keyCode == 38) {
    mod = 1;
  } else if (keyCode == 40) {
    mod = -1;
  }
  if (keyCode == 37) mod1++;
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
  }

  //+++++++++++++++++++

  if ((keyCode == 38)||(keyCode == 40)) {
    mod =0;
  }
}
