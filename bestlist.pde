void best(){
  
  if (temp == "leer"){
    //noLoop();
    if (Points < 10)  bestlist[10] = "00000"+ceil(Points)+" - ";
    if (Points < 100 && Points > 9)  bestlist[10] = "0000"+ceil(Points)+" - ";
    if (Points < 1000 && Points > 99)  bestlist[10] = "000"+ceil(Points)+" - ";                          //Punkte ins Array[10]
    if (Points < 10000 && Points > 999)  bestlist[10] = "00"+ceil(Points)+" - ";
    if (Points < 100000 && Points > 9999)  bestlist[10] = "0"+ceil(Points)+" - ";
    if (Points < 1000000 && Points > 99999)  bestlist[10] = ceil(Points)+" - ";
    if (Points > 999999)  bestlist[10] = "999999"+" - ";
    
    temp = bestlist[10];                                                                                 //Punkte in temp kopieren
    
  }
    
    bestlist = sort(bestlist);
    bestlist = reverse(bestlist);                                                                         //Sortieren
    saveStrings("data/Bestlist.txt", bestlist);
    
    if(bestlist[10].equals(temp) == true){
      gameState = 3;
    }
    else{
    for(int i=0;i<9;i++){
     if (bestlist[i].equals(temp) == true) {  
      placed = i;
      println("fckyeah");
      top10 = true;
      temp = "alt";
     }
    }
    }
    
    
}