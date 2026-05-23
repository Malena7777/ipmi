PImage coachella;
PImage innerspeaker;
PImage currents;
PImage TameImpala;
PImage SlowRush;


PFont texto;

int posX= 640;
int posY= 480;

int ancho = 64;
int alto = 48;
int tamañotexto = 10;
int movimiento = 0;

boolean empujar = false;
boolean mostrarimagen= false;

int aparece = 0;
int textoY;
int truco2X;

boolean subirtexto = false;
int tiempoimagen= 2;

color rojo= color(100, 0, 0);
color azul= color(0, 0, 200);
color negro= color(0);
color verde= color(0, 255, 0);
color amarillo = color(240, 233, 34);

String mitexto1, mitexto2, mitexto3;


void setup() {
  size(640, 480);
   currents = loadImage("currents.png");
  coachella = loadImage("coachella.png");
  innerspeaker = loadImage("innerspeaker.png");
  TameImpala = loadImage ("tame_imapala.png");
  SlowRush = loadImage ("the_slow_rush.png");
 
texto= loadFont("SegoeUIBlack-48.vlw");
  mitexto1= ("Tame Impala es el \n proyecto de música psicodelica \ndel artista Kevin Parker, \n proveniente de Australia");
  
  mitexto2= ("Kevin graba a solas \n en un estudio de grabacion \n Compone, \ninterpreta \ny produce \n toda la música del proyecto" );
  mitexto3= ("En sus giras, Tame Impala está \n formado por Kevin, Dominic Simper, Jay Watson, \n Cam Avery y Julien Barbagallo" );
  texto= loadFont("Verdana-Bold-48.vlw");

  textAlign(CENTER, CENTER);
  textoY = height + 50;
}
void draw() {
  background(255);
  if (ancho >= width && alto >= height && tamañotexto >= 25) {
    if (!empujar) {
      empujar = true;
      aparece = frameCount;
    }
  }
  if (empujar && movimiento < width) {
    movimiento += 2;
  }
  if (empujar && !mostrarimagen) {

    image(innerspeaker, 0, 0, width, height);
    textAlign(posX= (-10)+ movimiento, posY= 0);
    fill(negro);
    textFont(texto);
    textSize(20);
    text(mitexto2, posX/2, height / 2);

    if (frameCount - aparece >= 600) {
      mostrarimagen = true;
      subirtexto = true;
      tiempoimagen = frameCount;
    }
  }
  if (mostrarimagen) {
    image(currents, 0, 0, width, height);
    if (subirtexto) {
      if (textoY > height / 2) {
        textoY -= 2;
      } else {
        textoY = height / 2;
        subirtexto = false;
      }
    }
    fill(amarillo);
    textFont(texto);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(mitexto3, 300, textoY);
  }
  int x = (width - ancho) / 2 + movimiento;
  int y = (height - alto) / 2;
  image(coachella, x, y, ancho, alto);
  textFont(texto);
  textAlign(CENTER, CENTER);
  fill(amarillo);
  textSize(20);
  text(mitexto1, 300 + 1 +movimiento, 200 + 1+movimiento);
  if (ancho < width) ancho += 8;
  if (alto < height) alto += 3;
  if (tamañotexto < 25) tamañotexto += 1;
}
