//Player gets 1 point for colliding with object from this class
class Popcorn{
//variables declared    
int x,y,xspeed,yspeed; 
PImage popcorn;
float w,h;

//constructor
Popcorn(int x, int y, int xspeed)
{
   this.x = x;
   this.y = y;
   popcorn = loadImage("popcorn.png"); 
   popcorn.resize(100,100);
   this.xspeed = xspeed;
   this.w = popcorn.width;
   this.h = popcorn.height;
}

 void move()
  {
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
      
      
  }
  
 void render()
  {  

 image(popcorn,x,y);
  }
  
  
 void update()
  {
    move();
    render();
    
  }
  
}
  
    
