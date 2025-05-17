PImage imagen1, imagen2, imagen3, imagen4, imagen5;
String texto1 = "Nombre de la obra:\n Resonating microcosms of life – Solidified light colour";
String texto2 = "Obra creada por el equipo japonés TeamLab";
String texto3 = "Esta obra fue presentada en Maison&Objet 2022 en París";
String texto4 = "Los objetos pueden cambiar entre 61 colores, \n al interactuar el espectador o el ambiente, los objetos producen un sonido, \n cambian de color, y hacen que los objetos a su alrededor cambien también";
String texto5 = "La instalación busca explorar la relación entre las personas,\n los fenómenos naturales y la percepción del espacio";
int numPantalla = 0;
int contadorTiempo = 0;
int contadorTiempoBoton = 0;
boolean buttonPressed = false;
float buttonX, buttonY, buttonW, buttonH;

void setup() {
  size(640, 480);
  frameRate(30);
  //Imagenes
  imagen1 = loadImage("imagen1.png");
  imagen2 = loadImage("imagen2.png");
  imagen3 = loadImage("imagen3.png");
  imagen4 = loadImage("imagen4.png");
  imagen5 = loadImage("imagen5.png");
  textAlign(CENTER, CENTER);
  textSize(24);

  buttonW = 150;
  buttonH = 50;
  buttonX = width/2 - buttonW/2;
  buttonY = height/2 - buttonH/2;
}

void draw() {
  //Contador
  contadorTiempo++;
  
  if (numPantalla < 5) {
    
    if (numPantalla == 0) {
      image(imagen1, 0, 0, width, height);
    } else if (numPantalla == 1) {
      image(imagen2, 0, 0, width, height);
    } else if (numPantalla == 2) {
      image(imagen3, 0, 0, width, height);
    } else if (numPantalla == 3) {
      image(imagen4, 0, 0, width, height);
    } else if (numPantalla == 4) {
      image(imagen5, 0, 0, width, height);
    }
    
    //Efectos de texto
    switch(numPantalla) {
      case 0: 
        fill(255);
        float y0 = map(min(contadorTiempo, 120), 0, 120, 0, height/2); 
        text(texto1, width/2, y0);
        break;
      case 1: 
        float opacidad1 = map(contadorTiempo, 0, 240, 0, 255);
        float y1 = map(min(contadorTiempo, 120), 0, 120, height/2, height/2-140); 
        fill(255, opacidad1);
        text(texto2, width/2, y1);
        break;
      case 2: 
        fill(255);
        float y2 = map(min(contadorTiempo, 120), 0, 120, height, height/2); 
        text(texto3, width/2, y2);
        break;
      case 3: 
        float scale = map(min(contadorTiempo, 120), 0, 120, 0.3, 0.8); 
        scale = min(scale, 1.0);
        pushMatrix();
        translate(width/2, height/2);
        scale(scale);
        fill(255);
        text(texto4, 0, 0);
        popMatrix();
        break;
      case 4: 
        float opacidad2 = map(min(contadorTiempo, 120), 0, 120, 0, 255); 
        fill(255, opacidad2);
        text(texto5, width/2, height/2 - 70); 
        break;
    }
    
    
    if (contadorTiempo > 240) {
      contadorTiempo = 0;
      numPantalla++;
      contadorTiempoBoton = 0; 
    }
  } else {
   
    background(0); 
    contadorTiempoBoton++;
    float opacidadBoton = map(min(contadorTiempoBoton, 30), 0, 30, 0, 255);
    fill(buttonPressed ? 150 : 200, opacidadBoton);
    rect(buttonX, buttonY, buttonW, buttonH, 10);
    fill(0, opacidadBoton);
    textSize(16);
    text("Reiniciar", buttonX + buttonW/2, buttonY + buttonH/2);
    textSize(24); 
  }
}

void mousePressed() {
  if (numPantalla == 5) {
    if (mouseX >= buttonX && mouseX <= buttonX + buttonW && 
        mouseY >= buttonY && mouseY <= buttonY + buttonH) {
      buttonPressed = true;
    }
  }
}

void mouseReleased() {
  if (buttonPressed && numPantalla == 5) {
    // Reiniciar presentación
    numPantalla = 0;
    contadorTiempo = 0;
    contadorTiempoBoton = 0;
    buttonPressed = false;
  }
}
