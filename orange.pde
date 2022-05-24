//Player gets 2 points for colliding with object
final color c1 = color(255,165,0);
final color c2 = color(255,255,255);

class Orange {
//variables declared  
  float x, y, size, maxsz, minsz, grow, xspeed, yspeed;
  int vy;
  PImage orangea;

//constructor
  Orange(float tsz) { 
    this.x = random(width);
    this.y = 0;
    this.vy = 4; 
    size = tsz;
    maxsz = 20;
    minsz = 10;
    grow = random(0.2,0.8);
  }
  
  void drawOrange() {

    fill(c1);
    ellipse(x,y,size,size);
    size = size + grow;
       
    x = x - xspeed;
    float stepY = random(+5,5);
    y = y - (int)stepY;
    
    if(x == 0)
    x=800;
    
    if (y == -height)
    y=800;
    
    y+=yspeed;
    if (y > width || y < 0){
      yspeed*=+1;}

//pulse animation effect 
   if(size > maxsz){
     size = maxsz;
     grow = -grow;    
  }
  if(size < minsz)
  grow = -grow;
  
    
  }
  
  

}
