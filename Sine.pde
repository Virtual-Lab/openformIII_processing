class Sine extends Klank
{

  protected float phase;
  protected float thickness;
  
  protected float[] siney = new float[canvasWidth];
  protected float[] sineyold = new float[canvasWidth];
  
  public void set(float vol, float freq, float pos, int k)
  { 
    transp = int(vol * 150); // volumrange (-1 to +1) into transparency (0 to 255)
    positiony = (height/(maxFreq-minFreq)) * (freq-minFreq); // frequency range (min to max) into position y
    positionx = ((pos+1)/2) * width; // positionrange -1 to +1 (min to max) into position x  
    
    phase += vol;
    thickness = 6 + int( maxFreq / freq );
    
    copy = k;
    counter = defaultCounter;    
  }
  
  public void draw()
  {          
    sineyold[0] = height/(2+(0.2-copy/10))+variation;
    
    for (int i = 2; i < (width); i=i+2) { 

      siney[i] = ((height/255)*(transp*3.2) * sin(phase + i*2*PI*(positiony/30)/(width) )); // *variation);
      
      stroke(255, transp*2);
      fill(255, transp*3);
      strokeWeight(thickness);
      // point(i, siney[i]+(height/2+variation));
      //ellipse(i-2, sineyold[i-2], 8, 8);
      //point(i, siney[i]*(height/2)); // +variation)
      
      line(
        i-2, // OLD SINE FIRST POINT
        sineyold[i-2], // OLD SINE POINT
        i, // NEW POINT X-DIRECTION
        siney[i]+(height/(2+(0.2-copy/10))+variation)   // NEW PONT Y-DIRECTION
      );
      
      sineyold[i] = siney[i] + (height/(2+(0.2-copy/10))+variation);
    }
  }
      
}
