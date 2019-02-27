class Grain1
{
  
  protected float transp;
  protected float positiony;
  protected float positionx;
  
  protected float sustain;
  protected float rawVol;
  
  protected float counter; 
  protected float variation; 
  
  public Grain1()
  {
    variation = 0.0;
  }
  
  public void set(float vol, float freq, float pos, float sustain)
  {
      rawVol = vol;
      transp = int(vol * 160); // volumrange (-1 to +1) into transparency (0 to 255)
      positiony = height/maxFreq * freq; // frequency range (min to max) into position y
      positionx = (pos+1)/2 * width; // positionrange -1 to +1 (min to max) into position x (((pos+1)/2 * 3)-1) * width
      counter = defaultCounter;
  }
  
  public void update()
  {
    
    if (transp > 0 && counter > 0) {
      
        counter--;
        if (counter <= 0) 
        {
          rawVol = 0;
          transp = 0; 
          positiony = 0;
          positionx = 0;
        };
  
      variation = variation + random(-1, 1);
      
      // println("Variation("+i+" ="+variation);
      if (variation > (height/2)) variation = variation - 1;
      if (variation < -(height/2)) variation = variation + 1;
    
    }
  
  }
  
  public void draw()
  {
      float posX = width/5+(4*positionx/5);
      float posY = (height - positiony) / 2;
      float widthX = width*rawVol/3+variation;
      float heightY = (width*rawVol/3+variation);
      float px = random(widthX);
      float py = random(heightY);
      float pw = random(80*rawVol+(variation/4));
      float ph = random(80*rawVol+(variation/4));
      
      noStroke();
      fill(255, transp*3);
      
      rect(posX-px, posY-py, pw, ph);
  }
}
