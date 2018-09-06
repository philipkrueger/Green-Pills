void menue(){
  
    fill(0,0,0,200);
    rect(width/4, 50, width/2, height-100);
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text("Game Over", width/2, 150);
    textSize(30);
    text(ceil(Points)+" Points", width/2, 220);
    

    //noLoop();
    
    
    if (gameState == 2){
    
      textSize(30);
      textAlign(CENTER);
      fill(255);
      //text("Enter Your Name",width/2,height/2);
      text("You placed "+(placed+1)+"th, enter Your Name: ",width/2,height/3+25);
      textSize(50);
      text(Player,width/2,height/2);
      
    }
    if (gameState == 3){    
    for(int i = 0; i < 9; i++){
      noLoop();
      textAlign(LEFT);
      textSize(30);
      text(bestlist[i], width/2 - 130, 300+l);
      l += 40;
    }
    textAlign(CENTER);
    textSize(20);
    text("Press Enter to restart", width/2, height-80);
    }
    
    
    
    
}