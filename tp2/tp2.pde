//   TP2 - Presentación: Tame Impala - Malena Cañiu Fernández - Legajo: 122631/4



PImage img1, img2, img3, img4, img5;

PFont fuentePropia;     // fuente de google fonts
PFont fuenteProcessing; // fuente de processing


int pantalla;
int tiempoInicio;
int duracion = 9000;   // duración de cada pantalla en milisegundos (9 seg)

float textY;           // posición Y para slide-in
float textAlpha;       // opacidad para fade
float textSize;        // tamaño para escalado
float angulo;          // ángulo para oscilación

// Botones
boolean sobreBotonInicio;
boolean sobreBotonReinicio;

void setup() {
  size(640, 480);
  textAlign(CENTER, CENTER);

  img1 = loadImage("tame_impala.png");
  img2 = loadImage("coachella.png");
  img3 = loadImage("innerspeaker.png");
  img4 = loadImage("currents.png");
  img5 = loadImage("the_slow_rush.png");

  fuentePropia     = loadFont("RubikGlitch.vlw");
  fuenteProcessing = createFont("Georgia", 32);

  reiniciar();
}

void draw() {
  background(0);

  if (pantalla == 0) {
    dibujarInicio();
  } else if (pantalla >= 1 && pantalla <= 5) {
    dibujarSlide(pantalla);
    verificarTiempo();
  } else if (pantalla == 6) {
    dibujarFinal();
  }
}

void dibujarInicio() {
  background(10, 10, 20);
  textFont(fuentePropia);
  textSize(42);
  fill(255);
  text("TAME IMPALA", width/2, height/2 - 60);

  textFont(fuenteProcessing);
  textSize(20);
  fill(200);
  text("Una presentación visual", width/2, height/2 - 15);

  // Botón inicio
  sobreBotonInicio = mouseOverBoton(220, 300, 200, 50);
  dibujarBoton(220, 300, 200, 50, "INICIAR", sobreBotonInicio);
}


void dibujarSlide(int num) {
  float t = (millis() - tiempoInicio) / 1000.0;

  PImage img;
  String titulo   = "";
  String cuerpo   = "";
  boolean usarFuentePropia = false;

  if (num == 1) {
    img    = img1;
    titulo = "¿Qué es Tame Impala?";
    cuerpo = "Tame Impala es el proyecto psicodélico\ndel músico australiano Kevin Parker.\nInició en Perth en 2007 y se convirtió\nen uno de los proyectos más influyentes\ndel rock australiano";
    usarFuentePropia = true;
  } else if (num == 2) {
    img    = img2;
    titulo = "Formación y estilo";
    cuerpo = "Kevin Parker es el compositor, productor\ny voz principal. En vivo se presenta\ncomo banda completa. Su estilo mezcla\npsicodelia, dream pop, synth y neo-soul\ncon una producción muy cinematográfica.";
    usarFuentePropia = false;
  } else if (num == 3) {
    img    = img3;
    titulo = "InnerSpeaker (2010)";
    cuerpo = "El disco debut de Tame Impala.\nSonido crudo, guitarras distorsionadas\ny producción lo-fi. Transmite introspección\ny una sensación de viaje interior.\nUna declaración psicodélica pura.";
    usarFuentePropia = true;
  } else if (num == 4) {
    img    = img4;
    titulo = "Currents (2015)";
    cuerpo = "El quiebre. Parker abandona las guitarras\ny abraza los sintetizadores y el funk.\nUn disco sobre el cambio y la pérdida.\nCanciones como 'Let It Happen' y\n'The Less I Know The Better' lo hicieron internacional.";
    usarFuentePropia = false;
  } else {
    img    = img5;
    titulo = "The Slow Rush (2020)";
    cuerpo = "El disco más maduro de Parker.\nExplora el paso del tiempo, la nostalgia\ny el futuro. Producción densa y envolvente.\nConsolidó a Tame Impala como\nuna de las bandas más importantes del siglo.";
    usarFuentePropia = true;
  }

  // Dibujar imagen de fondo con transparencia
  tint(255, 160);
  image(img, 0, 0, width, height);
  noTint();

  fill(0, 140);
  noStroke();
  rect(0, 0, width, height);

  if (num == 1) {
    // FADE IN: el texto aparece de a poco
    textAlpha = calcularFade(t, 0.5, 2.5);  // función con retorno
    dibujarTextoSlide(titulo, cuerpo, usarFuentePropia, textAlpha);

  } else if (num == 2) {
    // SLIDE IN DESDE ABAJO: el texto sube
    textY = calcularSlideY(t, 480, 180, 1.5);  // función con retorno
    pushMatrix();
    translate(0, textY - 180);
    dibujarTextoSlide(titulo, cuerpo, usarFuentePropia, 255);
    popMatrix();

  } else if (num == 3) {
    // ESCALADO: el texto crece desde pequeño
    textSize = calcularEscala(t, 0.3, 1.0, 1.5);  // función con retorno
    pushMatrix();
    translate(width/2, height/2);
    scale(textSize);
    translate(-width/2, -height/2);
    dibujarTextoSlide(titulo, cuerpo, usarFuentePropia, 255);
    popMatrix();

  } else if (num == 4) {
    // OSCILACIÓN: el texto se mueve suavemente de lado a lado
    angulo = t * 1.5;
    float offsetX = sin(angulo) * 8;
    pushMatrix();
    translate(offsetX, 0);
    dibujarTextoSlide(titulo, cuerpo, usarFuentePropia, 255);
    popMatrix();

  } else if (num == 5) {
    // FADE IN + SLIDE combinados
    textAlpha = calcularFade(t, 0.5, 2.5);
    textY     = calcularSlideY(t, 220, 180, 1.5);
    pushMatrix();
    translate(0, textY - 180);
    dibujarTextoSlide(titulo, cuerpo, usarFuentePropia, textAlpha);
    popMatrix();
  }

  // Indicador de pantalla (puntitos abajo)
  dibujarIndicador(num);
}

void dibujarTextoSlide(String titulo, String cuerpo, boolean usarPropia, float alpha) {
  // Título
  if (usarPropia) {
    textFont(fuentePropia);
  } else {
    textFont(fuenteProcessing);
  }
  textSize(28);
  fill(255, 220, 80, alpha);   // amarillo cálido
  text(titulo, width/2, 110);

  // Separador
  stroke(255, 220, 80, alpha * 0.6);
  strokeWeight(1);
  line(width/2 - 120, 135, width/2 + 120, 135);
  noStroke();


  textFont(fuenteProcessing);
  textSize(15);
  fill(240, 240, 240, alpha);
  text(cuerpo, width/2, 290);
}

// Dibuja puntitos indicadores de pantalla actual
void dibujarIndicador(int actual) {
  for (int i = 1; i <= 5; i++) {
    float x = width/2 - 50 + (i - 1) * 25;
    if (i == actual) {
      fill(255, 220, 80);
    } else {
      fill(100);
    }
    noStroke();
    ellipse(x, 455, 8, 8);
  }
}

// Dibuja la pantalla final con botón de reinicio
void dibujarFinal() {
  background(10, 10, 20);

  textFont(fuentePropia);
  textSize(36);
  fill(255, 220, 80);
  text("Gracias por ver", width/2, 150);

  textFont(fuenteProcessing);
  textSize(20);
  fill(200);
  text("Tame Impala — Una banda única.", width/2, 210);


  // Botón reinicio
  sobreBotonReinicio = mouseOverBoton(220, 360, 200, 50);
  dibujarBoton(220, 360, 200, 50, "REINICIAR", sobreBotonReinicio);
}

// Dibuja un botón con hover
void dibujarBoton(float x, float y, float w, float h, String etiqueta, boolean hover) {
  if (hover) {
    fill(255, 220, 80);
    stroke(255, 220, 80);
  } else {
    fill(40);
    stroke(180);
  }
  strokeWeight(1.5);
  rect(x, y, w, h, 8);

  if (hover) {
    fill(20);
  } else {
    fill(220);
  }
  textFont(fuenteProcessing);
  textSize(16);
  noStroke();
  text(etiqueta, x + w/2, y + h/2);
}


// Calcula opacidad de fade entre 0 y 255 según el tiempo
float calcularFade(float t, float inicio, float fin) {
  return map(constrain(t, inicio, fin), inicio, fin, 0, 255);
}

// FUNCIÓN QUE RETORNA VALOR
// Calcula posición Y para efecto slide-in
float calcularSlideY(float t, float desde, float hasta, float durSeg) {
  float progreso = constrain(t / durSeg, 0, 1);
  return map(progreso, 0, 1, desde, hasta);
}


// Calcula escala para efecto zoom-in
float calcularEscala(float t, float desde, float hasta, float durSeg) {
  float progreso = constrain(t / durSeg, 0, 1);
  return map(progreso, 0, 1, desde, hasta);
}

// Devuelve true si el mouse está sobre un botón (AND / OR usados internamente)
boolean mouseOverBoton(float x, float y, float w, float h) {
  return (mouseX >= x && mouseX <= x + w) && (mouseY >= y || mouseY <= y + h) && mouseY >= y && mouseY <= y + h;
}

// Verifica si pasó el tiempo y avanza de pantalla
void verificarTiempo() {
  if (millis() - tiempoInicio >= duracion) {
    if (pantalla < 5) {
      pantalla++;
      tiempoInicio = millis();
      resetAnimaciones();
    } else {
      pantalla = 6;  // ir a pantalla final
    }
  }
}

// Resetea variables de animación al cambiar de pantalla
void resetAnimaciones() {
  textY     = 480;
  textAlpha = 0;
  textSize  = 0.3;
  angulo    = 0;
}

// EVENTOS
void mouseClicked() {
  if (pantalla == 0 && sobreBotonInicio) {
    pantalla     = 1;
    tiempoInicio = millis();
    resetAnimaciones();
  }
}

void mousePressed() {
  if (pantalla == 6 && sobreBotonReinicio) {
    reiniciar();
  }
}

// Reiniciar: vuelve todo al estado original
void reiniciar() {
  pantalla     = 0;
  tiempoInicio = millis();
  resetAnimaciones();
  sobreBotonInicio    = false;
  sobreBotonReinicio  = false;
}
