//TP3- IPMI
//Malena Cañiu Fernández - Legajo: 122631/4
// link del video: https://www.youtube.com/watch?v=UXRJkXi1-zQ

PImage imagenRef;

// Variables del túnel interactivo
float grosorBanda;
int   cantBandas;
float anguloExtra;
boolean modoColor;

// Valores originales para reiniciar
float grosorBanda_orig = 18;
int   cantBandas_orig  = 11;
float anguloExtra_orig = 0;

// Centro fijo del túnel
float cx = 200;
float cy = 200;


void setup() {
  size(800, 400);
  imagenRef = loadImage("26.jpg");
  reiniciar();
}

void draw() {
  background(30);
image(imagenRef, 0, 0, 400, 400);
  stroke(180);
  strokeWeight(2);
  line(400, 0, 400, 400);

  // Túnel interactivo
  pushMatrix();
  translate(400, 0);
  dibujarTunel(cx, cy, grosorBanda, cantBandas);
  popMatrix();
}


// función que calcula el grosor de banda según la distancia del mouse al centro
float calcularGrosor(float mx, float my) {
  float d = dist(mx, my, 400 + cx, cy);
  return map(d, 0, 300, 10, 32);
}


void dibujarTunel(float tcx, float tcy, float grosor, int bandas) {
  noStroke();

  for (int i = bandas; i >= 0; i--) {
    for (int lado = 0; lado < 4; lado++) {

      if (modoColor) {
        float h = map(i, 0, bandas, 0, 360);
        colorMode(HSB, 360, 100, 100);
        if (i % 2 == 0) fill(h, 85, 95);
        else            fill(h, 85, 15);
        colorMode(RGB, 255);
      } else {
        if (i % 2 == 0) fill(255);
        else            fill(0);
      }

      float mitad = i * grosor;

      pushMatrix();
      translate(tcx, tcy);
      float angulo = map(i, 0, bandas, 0, 0.04) + anguloExtra;
      rotate(angulo);
      rectMode(CENTER);
      rect(0, 0, mitad * 2, mitad * 2);
      popMatrix();
    }
  }
}

// Eventos de mouse

void mouseDragged() {
  grosorBanda = calcularGrosor(mouseX, mouseY);
  cantBandas  = int(map(grosorBanda, 10, 32, 18, 7));
  anguloExtra += map(mouseX - pmouseX, -20, 20, -0.03, 0.03);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    modoColor = !modoColor;
  }
}

// Eventos de teclado

void keyPressed() {
  if (key == 'r' || key == 'R') {
    reiniciar();
  }
  if (key == 'c' || key == 'C') {
    modoColor = !modoColor;
  }
}

// Reiniciar: vuelve las variables a su estado original

void reiniciar() {
  grosorBanda = grosorBanda_orig;
  cantBandas  = cantBandas_orig;
  anguloExtra = anguloExtra_orig;
  modoColor   = false;
}
