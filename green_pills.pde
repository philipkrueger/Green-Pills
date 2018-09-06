
float[] z = new float[50];      //Welt 
PVector[] v = new PVector[150];   //Gegner
float[] vSize = new float[150];   //Größe Gegner 
float Tempo;
PVector[] v2 = new PVector[50];
float camX = 0;
float camY = 0;
float Points;
int Leben;
int boost = 0;
int d = 0;
float a = 1;
PImage img;
float r = 3;
float cr = 0;
float cg = 0;
float cb = 0;
int cir = 1;
int cig = 1;
int cib = 1;
String Player = "";
String temp;
String[] bestlist = new String[11];                     //Bestenliste
int l = 0;
boolean[] keys = new boolean [5];
//int offset = 20;
PrintWriter logFile;
boolean top10 = false;
int placed;
int gameState = 1;


void setup() {
    
  // logFile = createWriter("log_"+year()+"."+month()+"."+day()+"_"+hour()+"."+minute()+"."+second()+".txt"); 

  
  temp = "leer";
  img = loadImage("Spirale.png");
  bestlist = loadStrings("Bestlist.txt");
  
  Leben = 3;
  Points = 0;
  
  z[0] = -50000;
  size (1200, 800, P3D);

  
  smooth();


  for (int n = 1; n<z.length; n++) {     //Welt Z Koordinaten
    z[n] = z[n-1] + 1000;
  }

  for (int i=0; i<v.length; i++) {           //Gegner
    vSize[i] = random(80, 400);
    v[i] = new PVector(random(-50, width+50), random(-50, height+50), -(random(0, 50000)));
  } 

  for (int j=0; j<v2.length; j++) {           //Drops
    v2[j] = new PVector(random(0, width-20), random(0, height-20), random(-50000, 0));
  }
}



void draw() {
  
  //println(gameState);
  noCursor();
  
  ctrl();
  bckgrnd(); 
  
  if(Leben<0){ 
    gameState = 2;                                                //gameState: 1= Spiel, 2= Namen Eingeben, 3= Bestenliste
    Leben = 3;
  }
  
  if (gameState == 1) {
    
    Points += Tempo/1000;
    noFill();
    noStroke();
    directionalLight(255, 255, 255, 1, 1, -1);
    //lights();

    Tempo = 10.0 * (1.0+(a/1000));                                 //Bewegung, bzw steigende Geschwindigkeit
    a+=0.2;
       
    gegner();
   
  } 
  
  if (gameState > 1) {
    
    best();
    menue();
    
    //noLoop();

  //  logFile.flush();
  //  logFile.close();
  }
  //println(temp+"|"+bestlist[10]+"|"+top10+"|"+placed+"|"+Player);
}