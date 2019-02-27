class Noisy extends Klank

{

  public void set(float vol, float freq, float pos, int k)
  {
    if (freq > 600) freq = 600;
    
    transp = int(vol * 160); // volumrange (-1 to +1) into transparency (0 to 255)
    positiony = (height/(maxFreq-minFreq)) * (freq-minFreq); // frequency range (min to max) into position y
    positionx = (pos*3) * width; // positionrange -1 to +1 (min to max) into position x
    
    posObject = pos/100;
    
    copy = k;
    counter = defaultCounter;    
  }
  
  public void draw()
  {          
    int widthX = int (40+variation);
    //int posX = int (positionx);
    int posX = int (positionx);
    int posY = 0;       
    int heightY = height;
    int transparency = 0;
    
    if (posX > width) posX = width;
    if (posX + widthX > width) widthX = width - posX;
    
    posX = (posX * 3) - 1 +100;
    
    transparency = max(min(int(transp)*8, 255), 0);
    
//        if (transparency > 255) transparency = 255;
    
    noStroke();
    fill(255, transparency);
    
     for (int y = 0; y < height/4; y++) {
          float x = randomGaussian() * widthX;
          rect(posX + random(variation/4), y*4, x, 4);
          //rect(posX - x + random(variation/4), y*4, x, 4);
     };
  }
      
}

    
    //loadPixels();
    
    //for (int x = posX; x < posX + widthX; x=x+2) {
      //for (int y = posY; y < heightY; y=y+2) {
        //pixels[x+y*width] = color(transparency);
      //};
    //};
      
    //updatePixels();
    
    //rect(
      //posX, // x pos point left top
      //posY, // y pos point left top
      //widthX, // width in x direction
      //heightY// /(1+pos)                  // height in y direction
     //);
     
