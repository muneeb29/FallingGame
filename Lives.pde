class Lives{
//variables declared    
int x,y,xspeed,yspeed; 
PImage Lives;
float w,h;

//constructor
Lives(int x, int y)
{
   this.x = x;
   this.y = y;
   Lives = loadImage("lives.png"); 
   Lives.resize(60,60);
   this.w = Lives.width;
   this.h = Lives.height;
}


  
  void render()
  {  

 image(Lives,x,y);
  }
 
}
  
    
