void setup() {
    size(2400, 400);
}

void draw() {
  for (int i = 0; i < 6; ++i) {
    recDraw(1, i, 400);
    translate(400, 0);
  }
}

void recDraw(int i, int m, float s) {
  if (m == 0) {
    drawSeed(1);
    return;
  }

  // Top Left
  if (i < m) {
    recDraw(i+1, m, s/2);
  } else {
    drawSeed(pow(2, i));
  }

  // Top Right
  pushMatrix();
  translate(s/2, 0);
  if (i < m) {
    recDraw(i+1, m, s/2);
  } else {
    drawSeed(pow(2, i));
  }
  popMatrix();

  // Bottom Left
  pushMatrix();
  translate(s/4, s/2 + s/4);
  rotate(PI/2);
  translate(-s/4, -s/4);
  if (i < m) {
    recDraw(i+1, m, s/2);
  } else {
      drawSeed(pow(2, i));
  }
  popMatrix();

  // Bottom Right
  pushMatrix();
  translate(s/2 + s/4, s/2 + s/4);
  rotate(-PI/2);
  translate(-s/4, -s/4);
  if (i < m) {
    recDraw(i+1, m, s/2);
  } else {
      drawSeed(pow(2, i));
  }
  popMatrix();
}

void drawSeed(float s) {
  line(0, 400/s, 200/s, 0);
  line(200/s, 0, 400/s, 400/s);
  line(400/s, 400/s, 100/s, 200/s);
}
