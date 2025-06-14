/*
Nombre: David Agustin Ruiz DNI: 43912182

Link del video explicativo: https://youtu.be/0b7YcRM7-9Q

Comentarios:en el video no lo dije, pero algunas de las funciones fueron realizadas
con ayuda de la ia, por lo que no puse tanta atencion en explicar como funcionaban ya que son
similares a las vistas en clase. Trate de especificarle que no utilice funciones especificas,
o que no hayamos visto en clase, como los arreglos/listas

Controles Interactivos:
Clickear y mantener el click sobre un rombo para poder arrastrarlo, al soltar el click vuelve a su posicion original
Presionar "c" para alternar los colores de las franjas blancas
Presionar "r" para reiniciar el estado del programa
*/


    PImage imagen;  
    float lado = 71; // Tamaño del rombo
    float distanciaX = lado * sqrt(2); 
    float distanciaY = lado * sqrt(2) / 2; 
    float factorEscala = 1.414; 
    boolean coloresAleatorios = false; 
    int semillaColor = 0; 
    int filaSeleccionada = -1; 
    int columnaSeleccionada = -1; 
    float desplazamientoX = 0; 
    float desplazamientoY = 0; 
    float posicionOriginalX = 0; 
    float posicionOriginalY = 0; 


    void setup() {
      size(800, 400); 
      imagen = loadImage("imagen.jpeg");
    }

    
    void draw() {
      background(255); 
      noStroke(); 
      
      
      for (int fila = 0; fila < 9; fila++) {
        int numRombos = (fila % 2 == 0) ? 5 : 4; 
        float offsetFila = (fila % 2 == 1) ? distanciaX / 2 : 0; 
        float y = fila * distanciaY;
        
        for (int col = 0; col < numRombos; col++) {
          if (fila != filaSeleccionada || col != columnaSeleccionada) {
            float x = col * distanciaX + offsetFila + 400; 
            int colorInicial;
            if (fila % 2 == 0) {
              colorInicial = ((fila / 2 + col) % 2 == 0) ? 0 : 255; 
            } else {
              colorInicial = (((fila - 1) / 2 + col) % 2 == 0) ? 0 : 255; 
            }
            dibujarRombo(x, y, colorInicial, fila % 2 == 0, fila, col); // Dibuja cada rombo
          }
        }
      }
      
     
      image(imagen, 0, 0, 400, 400); 
      
      
      if (filaSeleccionada != -1 && columnaSeleccionada != -1) {
        float x = mouseX + desplazamientoX;
        float y = mouseY + desplazamientoY;
        int colorInicial;
        if (filaSeleccionada % 2 == 0) {
          colorInicial = ((filaSeleccionada / 2 + columnaSeleccionada) % 2 == 0) ? 0 : 255;
        } else {
          colorInicial = (((filaSeleccionada - 1) / 2 + columnaSeleccionada) % 2 == 0) ? 0 : 255;
        }
        stroke(0);
        line(posicionOriginalX, posicionOriginalY, x, y); 
        noStroke();
        dibujarRombo(x, y, colorInicial, filaSeleccionada % 2 == 0, filaSeleccionada, columnaSeleccionada); 
        
        // Muestra la distancia 
        float distancia = dist(x, y, posicionOriginalX, posicionOriginalY);
        fill(100, 100, 100, 220); 
        rect(650, 5, 400, 20); 
        fill(255); 
        textAlign(RIGHT, TOP);
        textSize(16);
        text("Distancia: " + nf(distancia, 0, 1) + " px", 780, 10); // Contador de distancia
      }
    }

    
    void dibujarRombo(float x, float y, int colorInicial, boolean esHorizontal, int fila, int col) {
      pushMatrix();
      translate(x, y);
      rotate(radians(45));
      fill(255);
      rect(-lado/2, -lado/2, lado, lado);
      popMatrix();
      
      // Franjas alternadas
      pushMatrix();
      translate(x, y);
      
      for (int i = 0; i < 12; i++) {
        int colorBase = (colorInicial + i % 2 * 255) % 510; 
        if (coloresAleatorios && colorBase == 255) {
          randomSeed(semillaColor + i + fila * 100 + col * 1000); 
          fill(obtenerColorAleatorio(i)); // Aplica color aleatorio
        } else {
          fill(colorBase == 0 ? color(35, 35, 35) : colorBase); 
        }
        
        float t1 = -lado/2 * factorEscala + i * lado * factorEscala / 12;
        float t2 = -lado/2 * factorEscala + (i + 1) * lado * factorEscala / 12;
        
        if (esHorizontal) { 
          float y1 = t1;
          float y2 = t2;
          float x1_sup = -lado/2 * factorEscala * (1 - abs(y1) / (lado/2 * factorEscala));
          float x2_sup = lado/2 * factorEscala * (1 - abs(y1) / (lado/2 * factorEscala));
          float x1_inf = -lado/2 * factorEscala * (1 - abs(y2) / (lado/2 * factorEscala));
          float x2_inf = lado/2 * factorEscala * (1 - abs(y2) / (lado/2 * factorEscala));
          
          beginShape();
          vertex(x1_sup, y1);
          vertex(x2_sup, y1);
          vertex(x2_inf, y2);
          vertex(x1_inf, y2);
          endShape(CLOSE);
        } else { 
          float x1 = t1;
          float x2 = t2;
          float y1_izq = -lado/2 * factorEscala * (1 - abs(x1) / (lado/2 * factorEscala));
          float y2_izq = lado/2 * factorEscala * (1 - abs(x1) / (lado/2 * factorEscala));
          float y1_der = -lado/2 * factorEscala * (1 - abs(x2) / (lado/2 * factorEscala));
          float y2_der = lado/2 * factorEscala * (1 - abs(x2) / (lado/2 * factorEscala));
          
          beginShape();
          vertex(x1, y1_izq);
          vertex(x2, y1_der);
          vertex(x2, y2_der);
          vertex(x1, y2_izq);
          endShape(CLOSE);
        }
      }
      
      popMatrix();
    }

    // Genera un color aleatorio 
    color obtenerColorAleatorio(int indice) {
      int dominante = int(random(3)); 
      float r = (dominante == 0) ? random(200, 255) : random(0, 255);
      float g = (dominante == 1) ? random(200, 255) : random(0, 255);
      float b = (dominante == 2) ? random(200, 255) : random(0, 255);
      return color(r, g, b); 
    }

    // Selecciona un rombo para arrastrar
    void mousePressed() {
      float menorDistancia = Float.MAX_VALUE;
      int filaCercana = -1;
      int colCercana = -1;
      float despX = 0;
      float despY = 0;
      float origX = 0;
      float origY = 0;
      
      for (int fila = 0; fila < 9; fila++) {
        int numRombos = (fila % 2 == 0) ? 5 : 4;
        float offsetFila = (fila % 2 == 1) ? distanciaX / 2 : 0;
        float y = fila * distanciaY;
        
        for (int col = 0; col < numRombos; col++) {
          float x = col * distanciaX + offsetFila + 400;
          float d = dist(mouseX, mouseY, x, y);
          if (d < menorDistancia && d < lado) {
            menorDistancia = d;
            filaCercana = fila;
            colCercana = col;
            despX = x - mouseX;
            despY = y - mouseY;
            origX = x;
            origY = y;
          }
        }
      }
      
      if (filaCercana != -1) {
        filaSeleccionada = filaCercana; 
        columnaSeleccionada = colCercana;
        desplazamientoX = despX;
        desplazamientoY = despY;
        posicionOriginalX = origX;
        posicionOriginalY = origY;
      }
    }

    // Libera el rombo arrastrado
    void mouseReleased() {
      filaSeleccionada = -1; 
      columnaSeleccionada = -1;
    }

    // Teclas para colores aleatorios y reinicio
    void keyPressed() {
      if (key == 'r' || key == 'R') {
        coloresAleatorios = false; // Reinicia al estado inicial
        semillaColor = 0;
        filaSeleccionada = -1;
        columnaSeleccionada = -1;
      } else if (key == 'c' || key == 'C') {
        coloresAleatorios = true; // Activa colores aleatorios
        semillaColor++; 
      }
    }
