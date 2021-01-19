float value, target, speed = 0, acc = 0.01;
float dif;

void setup() {
  size(500, 500);
  background(50);

  rectMode(CENTER);

  value = width / 2;
}
void draw() { 
  background(50);

  dif = abs(value - target);

  if (dif > 10) {
    if (value < target) {
      //speed = 0;
      speed += acc;
      value += speed;
    } else {
      //speed = 0;
      speed -= acc;
      value += speed;
    }
  } else {
    speed = 0;
    acc = 0.01;
  }

  //x += targetX *0.01;
  println(dif);
  text("target:"+target+" dif:"+dif, 50, height - 70);
  text("value:"+value+" speed:"+speed+" acceleration:"+acc, 50, height - 50);
  fill(255);
  rect(value, 250, 50, 50);
}

void mousePressed() {
  target = mouseX;
  println(target);
  fill(255, 0, 0);
  rect(target, 250, 10, 10);
}
