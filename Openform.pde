  class Openform
{
  // protected int object; --> TODO: remove in supercollider

  protected float[] vol = new float[objectcopies];
  protected float[] freq = new float[objectcopies];
  protected float[] pos = new float[objectcopies];

  protected float[] sustain = new float[objectcopies];
  
  protected ArrayList<Grain1> grains1;
  protected ArrayList<Grain2> grains2;
  protected ArrayList<Klank> bells;
  protected ArrayList<Noisy> noises;
  protected ArrayList<Sine> sines1;
  
  public Openform()
  {
    grains1 = new ArrayList<Grain1>();
    grains2 = new ArrayList<Grain2>();
    bells = new ArrayList<Klank>();
    noises = new ArrayList<Noisy>();
    sines1 = new ArrayList<Sine>();
    
    for(int i=0; i<objectcopies; ++i) 
    {
      grains1.add(new Grain1());
      grains2.add(new Grain2());
      bells.add(new Klank());
      noises.add(new Noisy());
      sines1.add(new Sine());

    }
    
  }
   
  public void receive1(int i, float a, float b, float c, float d, int k)
  {
    float newV = 0.1;
    float oldV = 1 - newV;
  
     //println(" Variablen empfangen: "+i+", "+a+", "+b+", "+c+", "+d+", "+k);  
  
    vol[k] = vol[k] * oldV + a * newV;
    freq[k] = freq[k] * oldV + b * newV;
    pos[k] = pos[k] * oldV + c * newV;
    sustain[k] = sustain[k] * oldV + d * newV;
    
    switch(i) { 
      case 0:
        grains1.get(i).set(vol[k], freq[k], pos[k], sustain[k]);
        break;
      case 1:
        grains2.get(i).set(vol[k], freq[k], pos[k], sustain[k]);
        break;
    };
  }

  public void receive2(int i, float a, float b, float c, int k)
  {
    float newV = 0.1;
    float oldV = 1 - newV;
    
    println(" 5 variablen empfangen: "+i+", "+a+", "+b+", "+c+", "+k);  
    
    vol[k] = vol[k] * oldV + a * newV;
    freq[k] = freq[k] * oldV + b * newV;
    pos[k] = pos[k] * oldV + c * newV;
    
    switch(i) { 
      case 2:
        bells.get(i).set(vol[k], freq[k], pos[k], k);
        break;
      case 3:
        noises.get(i).set(vol[k], freq[k], pos[k], k);
        break;
      case 4:
        sines1.get(i).set(vol[k], freq[k], pos[k], k);
        break;
    }
    
  }

  // To do: Flag setzen ob aktiv oder inaktiv
  
  public void update()
  {
    for (int i = 0; i < objectcopies; i++) {
      // if (grains.get(i).active == true) .... update
      grains1.get(i).update();
      grains2.get(i).update();
      bells.get(i).update();
      noises.get(i).update();
      sines1.get(i).update();
    }
  }

  public void draw()
  {    
    for (int i = 0; i < objectcopies; i++) {
      
      // if (grains.get(i).active == true) .... draw
      grains1.get(i).draw();
      grains2.get(i).draw();
      bells.get(i).draw();
      noises.get(i).draw();
      sines1.get(i).draw();
    }
    
  }
}
