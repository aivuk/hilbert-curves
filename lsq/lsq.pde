import processing.pdf.*;

PGraphics buffer;
PImage startImage;
PImage finalImage;
int interations = 6;

void setup() {
  startImage = loadImage("seed.png");
  size(interations*startImage.width, startImage.height, PDF, "hilbert.pdf");

  buffer = createGraphics(interations*startImage.width, startImage.height);

  buffer.beginDraw();
  buffer.image(startImage, 0, 0);
  buffer.endDraw();

  for (int i = 0; i < interations; ++i) {
    drawBuffer(buffer, startImage.width, startImage.height, i*startImage.width, (startImage.width)/2, startImage.height/2);
  }

  finalImage = buffer.get(0, 0, buffer.width, buffer.height);
}

void draw() {
  image(finalImage, 0, 0);
  exit();
}

void drawBuffer(PGraphics b, int w, int h, int x, int nw, int nh) {
  PImage imageCut, itb, ibb;
  PGraphics tb, bb;

  imageCut = b.get(x, 0, w, h);

  tb = createGraphics(w, h);
  tb.beginDraw();
  tb.imageMode(CENTER);
  tb.translate(w/2, h/2);
  tb.rotate(PI/2);
  tb.image(imageCut, 0, 0);
  tb.endDraw();

  bb = createGraphics(w, h);
  bb.beginDraw();
  bb.imageMode(CENTER);
  bb.translate(w/2, h/2);
  bb.rotate(-PI/2);
  bb.image(imageCut, 0, 0);
  bb.endDraw();

  itb = tb.get(0, 0, w , h);
  itb.resize(nw, nh);

  ibb = bb.get(0, 0, w , h);
  ibb.resize(nw, nh);

  imageCut.resize(nw, nh);

  b.beginDraw();
  b.image(imageCut, x + w, 0);
  b.image(imageCut, x + w + nw, 0);
  b.image(ibb, x + w + nw, nh);
  b.image(itb, x + w, nh);
  b.endDraw();

}
