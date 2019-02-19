void bckgrnd(){
                                                       //Farbmischer
    cr+=(cir*0.1);
    if ((cr>=255)||(cr<=0)) cir=cir*(-1); 
    cg+=(cig*0.01);
    if ((cg>=255)||(cg<=0)) cig=cig*(-1);
    cb+=(cib);
    if ((cb>=255)||(cb<=0)) cib=cib*(-1);
   //println(cr+" "+cg+" "+cb+" "+cig);
    
    
    background(cr,cg,cb);
   // fill(cr,cg,cb);
   // rect(0,0,-4502,10*width,10*height);
    
    if(gameState == 1){
      
      fill(255);
      blendMode(SCREEN);
      background(cr,cg,cb,0);
      textFont(f);
      textSize(32);
      text(ceil(Points), 30, height-30, 0);
      text(Leben, width-50, height-30, 0);
      blendMode(NORMAL);

    }
    
     
    
    pushMatrix();

    translate(camX, camY, 0);  

    pushMatrix();                                          //Spirale (Hintergrund)
    translate(width/2,height/2,-4600);
    rotate(radians(r));
    r+=(Tempo/100);
    imageMode(CENTER);
    blendMode(MULTIPLY);
    image(img,0,0,width*14,width*14);
    rotate(radians(0.5*r));
    translate(100,0,1);
    image(img,10,10,width*14,width*14);
    popMatrix();
    
    pushMatrix();
    translate(-width/2,-height/2,-4599);
    fill(0);
    //rect(0,0,2*width,2*height);
    ellipse(width,height,2*width,2*width);
    blendMode(NORMAL);
    noFill();
    noStroke();
    popMatrix();

 


   

    for (int n = 1; n<z.length; n++) {
      z[n] += Tempo;                                 //Welt Z Koordinaten

      pushMatrix();
      if (z[n]>1000) {                                 //Welt zurück
        z[n]=z[n-1]-50000;
      }
      translate(0, 0, z[n]+boost);
      //rotate(radians(r));
      stroke(255-cr,255-cg,255-cb, 100);
      strokeWeight(d);
      rect(0, 0, width, height);
      //ellipse(width/2,height/2,4*width,4*height);
      translate(0, 0, 300);
      rect(-200, -200, width+400, height+400);
      //ellipse(width/2,height/2,8*width,8*height);
      translate(0, 0, 300);
      rect(-600, -600, width+1200, height+1200);    
      //ellipse(width/2,height/2,12*width,12*height);
      popMatrix();


      //println(z[0]);
    }
    popMatrix();

}
