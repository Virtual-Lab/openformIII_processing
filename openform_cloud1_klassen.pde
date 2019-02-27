/**
 * Proccessing sketch for Openform III
 * © Raimund Vogrtenhuber - vogtenhuber.com
 * 
 */

// importieren der Bibliotheken
import oscP5.*;
import netP5.*;

// Angabe von Variablen (wahrscheinlich von der Bibliothek)
OscP5 oscP5;
NetAddress myRemoteLocation;
int objectnumber = 5;
int objectcopies = 5;
int object = 0;
int canvasWidth = 1280; // 1024 1280 3840 1920;   
int canvasHeight = 800; // 768 800  720 1080;
float maxFreq = 500;
float minFreq = 18;
int defaultCounter = 20;
String action = "start";

String program = "open";

PGraphics[] canvas = new PGraphics[objectnumber];

Openform newPerformance = new Openform();

void settings() {

  // intern display
  size(canvasWidth, canvasHeight, P3D); //, P3D
  PJOGL.profile=1;
}
// Setup - Main part
void setup() {

  //fullScreen();
  noStroke();
  background(0);
  smooth(2);
  frameRate(25);
      
  //server = new SyphonServer(this, "Processing_receive_Dodec_1_03");
  int port = 12001;

  OscProperties op = new OscProperties();
  op.setListeningPort(port);
  op.setDatagramSize(80);

  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, op);
  // myRemoteLocation = new NetAddress("169.254.123.93", 12001);

  /* Plug Message - leitet die message auf die Funktion "test" */
  oscP5.plug(newPerformance, "receive2", "/sinus");
  oscP5.plug(newPerformance, "receive2", "/klank");
  oscP5.plug(newPerformance, "receive2", "/noisy");
  oscP5.plug(newPerformance, "receive1", "/grain1");
  oscP5.plug(newPerformance, "receive1", "/grain2");
}

void draw() {
 
  fill(0, 60);
  rect(0, 0, width, height);

  // beginDraw();
  // background(0);
  newPerformance.update();
  newPerformance.draw();

}
