void gegner(){
  pushMatrix();
  translate(camX, camY, 0); 
  
  for (int i=0; i<v.length; i++) {                             //Gegner
      v[i].z += Tempo;

      pushMatrix();
      fill(255, 0, 0, 200);
      noStroke();
      translate(v[i].x, v[i].y, v[i].z + boost);
      rotate(radians(random(-10, 10)));
      box(vSize[i]);
      popMatrix();

      if (dist(v[i].x, v[i].y, v[i].z, width/2-camX, height/2-camY, 500) < vSize[i]/2) {
        Leben -= 1;
        background(255, 0, 0);
        v[i].z += vSize[i];
      //  logFile.println("Leben verloren: "+frameCount+" Frames"); 
      }

      if (v[i].z>1000) {                       //Gegner zurück
        vSize[i] = random(80, 400);
        
        v[i].x = random(-50, width+50);
        v[i].y = random(-50, height+50);
        v[i].z=v[i].z-(random(45000,55000));
        //println(v[i].z);
      }
    }


    for (int i=0; i<v2.length; i++) {                             //Drops
      v2[i].z += Tempo;

      pushMatrix();
      fill(0, 255, 0, 200);
      noStroke();
      translate(v2[i].x, v2[i].y, v2[i].z + boost);
      sphere(20);
      popMatrix();

      pushMatrix();                                              //Extraleben + Punkte
      fill(random(0, 255));
      translate(v2[3].x, v2[3].y, v2[3].z);
      sphere(30);
      popMatrix();

      if (dist(v2[i].x, v2[i].y, v2[i].z, width/2-camX, height/2-camY, 500)<100) {
        Points += 10*Tempo;
        background(0, 255, 0);
        v2[i].z += 200;
      }

      if (dist(v2[3].x, v2[3].y, v2[3].z, width/2-camX, height/2-camY, 500)<200) {
        Leben += 1;
        background(255);
        v2[3].z += 400;
      }

      if (v2[i].z>1000) {                       //Drops zurück
        v2[i].z=v2[i].z-50000;
      }


    }
   popMatrix();
}