void ctrl(){
     
                                                                        //Steuerung 
  
                                                                       
                                                                          // links
    if (keys[0]) {
      camX += Tempo;
    }
                                                                          // rechts
    if (keys[1]) {
      camX -= Tempo;
    }
                                                                          // oben
    if (keys[2]) {
      camY += Tempo;
    }
                                                                          // unten
    if (keys[3]) {
      camY -= Tempo;
    }


    
    camX = constrain(camX, -width/2+40, width/2-40);                        //Begrenzung
    camY = constrain(camY, -height/2+40, height/2-40);
    //println("X = "+camX+", Y = "+camY);
    //println(keys[0] + " " + keys[1] + " " + keys[2] + " " + keys[3]);
    
    if (keyPressed) {                                                        //Rahmen
      if (key == 'a' && top10 ==false) {
        d += 1;
      }
      if (key == 'd' && top10 ==false) {
        d -= 1;
      }
    }
    
}

void mouseMoved() {
  
   camX =  (width - 2*mouseX);
   camY =  (height - 2*mouseY);
}

void keyPressed() { 
  
  if (keyCode == LEFT) {
    keys[0] = true;
  }
  if (keyCode == RIGHT) {
    keys[1] = true;
  }
  if (keyCode == UP) {
    keys[2] = true;
  }
  if (keyCode == DOWN) {
    keys[3] = true;
  }
  if (keyCode == TAB){
    boost = 10000;
  }
  

  if (keyCode == BACKSPACE && top10 == true) {                        //Name eingeben 
         Player = "" ;
       } 
  if (top10 == true && keyCode != ENTER && keyCode != BACKSPACE && keyCode != SHIFT) {
         Player += key;
       }
      
  }
  



void keyReleased() {
 
  if(gameState == 2 && keyCode == ENTER){                              //Name bestätigen
     //noLoop();
     bestlist[placed] += Player;
     saveStrings("data/Bestlist.txt", bestlist);
     top10 = false;
     gameState = 3;
     //noLoop();
     //menue();
  }
    
  else if(gameState == 3 && keyCode == ENTER){                           //Spiel starten
    loop();
    a = 1;
    l = 0;
    Leben = 3;
    Points = 0;
    temp = "leer";
    gameState = 1;
    //setup();
  }
  
  if (keyCode == LEFT) {
    keys[0] = false;
  }
  if (keyCode == RIGHT) {
    keys[1] = false;
  }
  if (keyCode == UP) {
    keys[2] = false;
  }
  if (keyCode == DOWN) {
    keys[3] = false;
  }
    if (keyCode == TAB){
    boost = 0;
  }
}


  