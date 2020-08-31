import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

Planet sun;
PeasyCam cam;
PImage sunTexture;
PImage starTexture;
PImage[] textures = new PImage[3];
PShape sky;

void setup(){
  size(600,600, P3D);
  sunTexture = loadImage("sun.jpg");
  starTexture = loadImage("stars.jpg");
  textures[0] = loadImage("earth.jpg");
  textures[1] = loadImage("earthcloud.jpg");
  textures[2] = loadImage("venus.jpg");
  noStroke();
  noFill();
  sky = createShape(SPHERE, 1000);
  sky.setTexture(starTexture);
  cam = new PeasyCam(this, 500);
  sun = new Planet(50,0, 0, sunTexture);
  sun.spawnMoons(4, 1);
}

void draw(){
  background(0);
  //lights();
  pointLight(255,255,255,0,0,0);
  shape(sky);
  sun.show();
  sun.orbit();
}