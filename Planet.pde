class Planet {
 float radius;
 float angle;
 float distance;
 float orbitSpeed;
 PVector v;
 Planet[] planets;
 PShape globe;
 
 Planet(float r, float d, float o, PImage img){
  radius = r;
  v = PVector.random3D();
  angle = random(TWO_PI);
  distance = d;
  v.mult(distance);
  orbitSpeed = o;
  noStroke();
  noFill();
  globe = createShape(SPHERE, radius);
  globe.setTexture(img);
 }
 
 void spawnMoons(int total, int level){
   planets = new Planet[total];
   for(int i = 0; i< planets.length; i++){
     float r = radius / (level * 2);
     float d = random(radius+r, (radius+r)*2);
     float o = random (-0.1, 0.1);
     planets[i] = new Planet(r, d, o, textures[int(random(3))]);
     if (level<3){
       int num = int(random(0,3));
       planets[i].spawnMoons(num, level+1);
     }
   }
 }
 
 void show(){
   pushMatrix();
   noStroke();
   fill(255);
   PVector v2 = new PVector(1,0,1);
   PVector p = v.cross(v2);
   rotate(angle, p.x, p.y, p.z);
   translate(v.x, v.y, v.z);
   shape(globe);
   //ellipse(0,0, radius * 2, radius * 2);
   if (planets != null)
     for(int i = 0; i< planets.length; i++){
        planets[i].show(); 
   }
   popMatrix();
 }
 
 void orbit(){
  angle += orbitSpeed;
  if (planets != null)
     for(int i = 0; i< planets.length; i++)
        planets[i].orbit(); 
 }
  
}