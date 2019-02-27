class Klank

{
  // protected int object; --> TODO: remove in supercollider
  protected float transp;
  protected float positiony;
  protected float positionx;
  
  protected float posObject;
  protected float variation;
  
  protected int copy;
  protected int counter;

  public Klank()
  {
    variation = 0.0;
  }
  
  public void set(float vol, float freq, float pos, int k)
  {
    if (freq > 600) freq = 600;
    
    transp = (vol * 80) * 10; // volumrange (-1 to +1) into transparency (0 to 255)
    positionx = ((pos+1)/2) * width; // positionrange -1 to +1 (min to max) into position x  
    positiony = (height/(maxFreq-minFreq)) * (freq-minFreq); // frequency range (min to max) into position y
    
    posObject = pos/2;
    copy = k;
    counter = defaultCounter;    
  }
  
  public void update()
  {
    
    if (transp > 0 && counter > 0) {  
      
      counter--;
      if (counter <= 0) 
      {
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
    noStroke();
  
    fill(255, transp);
    //fill(255);
    triangle(
      posObject + (copy*width/5), height/10 + (variation), // x und y pos point 1
      posObject + (copy*width/5) + 10 * variation, height, // x und y pos point 2
      posObject + (copy*width/5) + 6 * variation, height);  // x und y pos point 3
  }  
      
}
