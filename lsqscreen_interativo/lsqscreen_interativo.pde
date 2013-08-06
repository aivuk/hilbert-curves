PGraphics buffer;

int interations = 6;
int w = 200;
int h = 200;

void setup() {
  size(interations*w, h);
  
  buffer = createGraphics(interations*w, h);
  buffer.beginDraw();
  buffer.background(255);
  buffer.endDraw();
}

void draw() {
  background(0);


  for (int i = 0; i < interations; ++i) {
    drawBuffer(buffer, w, h, i*w, (w)/2, h/2);
  }

  PImage finalImage = buffer.get(0, 0, buffer.width, buffer.height);
  
  image(finalImage, 0, 0);
}

void mouseDragged(){
  buffer.beginDraw();
  //buffer.stroke(random(255),random(255),random(255));
  buffer.strokeWeight(10);
  buffer.line(mouseX,mouseY,pmouseX,pmouseY);
  buffer.endDraw(); 
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
