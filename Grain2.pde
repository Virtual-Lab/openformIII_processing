class Grain2 extends Grain1

{
  public void set(float vol, float freq, float pos, float sustain)
  {
    rawVol = vol;
    transp = (vol * 80 * 2); // volumrange (-1 to +1) into transparency (0 to 255)
    positiony = height/10 * freq; // frequency range (min to max) into position y
    positionx = (((pos+1)/2*5)-1) * width; // positionrange -1 to +1 (min to max) into position x
        
    counter = defaultCounter;    
  }
  
  public void draw()
  {
    float posX = positionx/2 + random(abs(variation));
    //float posY = height-positiony;
    float widthX = width/20+variation;
    float heightY = height;
    
    //positionx[i] = (positionx[i]+1)*50;
    noStroke();
    fill(255, transp);

    rect(posX, 0, widthX, heightY);      
  }  
      
}
