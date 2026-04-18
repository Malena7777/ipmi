// Malena Cañiu Fernández - Comisión 3 - TP1 - 04/26 //

PImage refe;
void setup() {
  size (800, 400);
  pixelDensity(1);
  refe= loadImage("foto_mural.png");
}

void draw () {
  background (214, 199, 192);
  image(refe, 0, 0);

  //cara
  fill(136, 159, 175);
  beginShape();
  vertex(647, 39);
  vertex (534, 49);
  vertex (517, 269);
  vertex (623, 274);
  vertex (679, 248);
  vertex (659, 151);
  vertex (693, 114);
  vertex (647, 39);
  endShape(CLOSE);//


  //cuerpo
  fill(136, 159, 175);
  beginShape();
  vertex(625, 273);
  vertex(400, 261);
  vertex(400, 400);
  vertex(400, 800);
  vertex(800, 400);
  vertex(331, 761);
  vertex(681, 321);
  vertex(621, 304);
  endShape(CLOSE);//

  //cuerpo
  fill(136, 159, 175);
  beginShape();
  vertex(517, 305);
  vertex(400, 305);
  vertex(400, 400);
  vertex(400, 800);
  vertex(800, 331);
  vertex(761, 308);
  vertex(681, 321);
  vertex(621, 304);
  endShape(CLOSE);//



  //pelo
  fill(78, 81, 86);
  stroke (164, 110, 98);
  strokeWeight(4);
  beginShape();
  vertex(500, 0);
  vertex(453, 47);
  vertex(400, 226);
  vertex(400, 380);
  vertex(419, 374);
  vertex(465, 392);
  vertex(503, 362);
  vertex(531, 345);
  vertex(534, 327);
  vertex(570, 306);
  vertex(550, 238);
  vertex(556, 109);
  vertex(605, 50);
  vertex(660, 32);
  vertex(627, 0);
  endShape(CLOSE);

  //puntitos en el pelo
  fill(255);
  noStroke();
  ellipse (410, 355, 4, 4);
  ellipse (442, 367, 4, 4);
  ellipse (434, 329, 4, 4);
  ellipse (471, 433, 4, 4);
  ellipse (474, 309, 3, 3);
  ellipse (425, 283, 3, 3);
  ellipse (516, 304, 4, 4);
  ellipse (533, 214, 3, 3);
  ellipse (438, 161, 3, 3);
  ellipse (481, 259, 4, 4);
  ellipse (460, 202, 3, 3);
  ellipse (474, 149, 3, 3);
  ellipse (489, 337, 2, 2);
  ellipse (537, 264, 3, 3);
  ellipse (427, 222, 3, 3);
  ellipse (472, 361, 2, 2);


  //pupilas
  fill(0);
  stroke (164, 110, 98);
  strokeWeight(3);
  ellipse (729, 87, 35, 40);
  ellipse (617, 115, 35, 40);


  fill(255);
  noStroke();
  ellipse (721, 78, 10, 10);
  noStroke();
  ellipse (743, 87, 5, 5);
  noStroke();
  ellipse (741, 101, 8, 8);
  noStroke();
  ellipse (717, 107, 10, 10);

  noStroke ();
  ellipse(606, 105, 14, 14);
  noStroke ();
  ellipse(627, 113, 4, 4);
  noStroke ();
  ellipse(632, 127, 8, 8);

  //círculos cyan
  noFill();
  stroke (132, 176, 187);
  ellipse (728, 88, 50, 60);
  ellipse (615, 115, 60, 75);

  //líneas en el rostro
  stroke(0);
  strokeWeight(3);
  line(623, 67, 634, 45);
  line(643, 80, 658, 61);
  line(577, 99, 572, 94);

  // líneas que rellenan el cuerpo
  stroke(0);
  strokeWeight(2);
  line(639, 400, 667, 317);
  line(661, 339, 685, 320);
  line(639, 395, 631, 370);
  line(631, 370, 569, 307);
  line(631, 370, 607, 330);
  line (607, 330, 601, 283);
  line (601, 283, 628, 236);
  line (601, 283, 582, 189);
  line (582, 189, 561, 147);
  line (582, 189, 581, 145);
  line (643, 261, 653, 203);

  line (729, 400, 777, 317);
  line (690, 400, 697, 379);
  line (697, 379, 724, 360);
  line (594, 400, 550, 377);
  line (550, 377, 519, 356);
  
  line (527, 400, 500, 376);
  line (513, 389, 492, 385);
  line (492, 385, 471, 395);
  
  line (763, 340, 792, 331 );
  
  
  


  //líneas más finas
  stroke(0);
  strokeWeight(1);
  line (648, 227, 602, 195);
  line (697, 379, 695, 347);
  line (695, 347, 709, 325);
  line (597, 400, 602, 372);
  line (599, 391, 575, 338);

  //labios
  stroke (176, 110, 96);
  strokeWeight(4);
  fill(177, 149, 148);
  triangle(677, 157, 597, 189, 683, 204);
  stroke (176, 110, 96);
  strokeWeight(4);
  line (680, 179, 607, 189);

  //círculos medio naranjas
  noFill();
  stroke (185, 89, 65);
  ellipse (728, 88, 14 + 50, +14+ 60);
  ellipse (615, 115, +14+ 60, +14 + 75);

  //rectángulos para lograr semicírculos
  noStroke();
  fill(214, 199, 192);
  rect(688, 57, 100, 60);

  //pupilas y círculos cyan están copiados dos veces porque
  //se superponía y no supe cómo evitarlo

  //pupilas
  fill(0);
  stroke (164, 110, 98);
  strokeWeight(3);
  ellipse (729, 87, 35, 40);
  ellipse (617, 115, 35, 40);


  fill(255);
  noStroke();
  ellipse (721, 78, 10, 10);
  noStroke();
  ellipse (743, 87, 5, 5);
  noStroke();
  ellipse (741, 101, 8, 8);
  noStroke();
  ellipse (717, 107, 10, 10);

  noStroke ();
  ellipse(606, 105, 14, 14);
  noStroke ();
  ellipse(627, 113, 4, 4);
  noStroke ();
  ellipse(632, 127, 8, 8);

  //círculos cyan
  noFill();
  stroke (132, 176, 187);
  ellipse (728, 88, 50, 60);
  ellipse (615, 115, 60, 75);

  //nariz
  fill(136, 159, 175);
  noStroke();
  ellipse (683, 121, 36, 36);

  // detalles hombro
  fill (132, 129, 140);
  noStroke ();
  beginShape();
  vertex(800, 333);
  vertex(736, 400);
  vertex(800, 400);
  endShape(CLOSE);


  fill (185, 89, 65);
  noStroke ();
  beginShape();
  vertex(733, 317);
  vertex(715, 325);
  vertex(737, 329);
  endShape(CLOSE);

  beginShape();
  vertex(737, 333);
  vertex(725, 357);
  vertex(749, 345);
  endShape(CLOSE);

  beginShape();
  vertex(752, 347);
  vertex(760, 379);
  vertex(772, 352);
  endShape(CLOSE);

  beginShape();
  vertex(790, 347);
  vertex(774, 350);
  vertex(790, 365);
  endShape(CLOSE);
}
