//Player must avoid object from this class
class Cheese{
//variables declared  
int x,y,xspeed,yspeed; 
int count =0;
PImage cheese,cheese1,cheese2,cheese3;
PImage walk1,walk2;
float w,h;

//constructor
Cheese(int x, int y, int xspeed)
{
   this.x = x;
   this.y = y;
   cheese = loadImage("cheese.png"); 
   cheese.resize(100,100);
   cheese1 = loadImage("cheese2.png"); 
   cheese1.resize(100,100);
   cheese2 = loadImage("cheese3.png"); 
   cheese2.resize(100,100);
   this.xspeed = xspeed;
   this.w = cheese.width;
   this.h = cheese.height;
}

//cheese movement sequence
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
  //adds spin effect   
  //changes images   
     if(count<10)
   image(cheese,x,y);
     else if(count<30)
    image(cheese1,x,y);
     else if(count<50)
    image(cheese2,x,y);
       else if(count<70)
    image(cheese,x,y);

   else{
    count = -1; 
   }

   
   count ++;
  }
  
  
  void update()
  {
    move();
    render();
    
  }
  
  
}
  
    
