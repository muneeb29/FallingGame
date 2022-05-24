class Explosion{
//variables declared  
int x,y,xspeed,yspeed; 
int count =0;
float w,h;
PImage explode;
 PImage img1, img2, img3, img4;

//constructor
Explosion(int x, int y, int xspeed)
{
   this.x = x;
   this.y = y;
   this.xspeed = xspeed;
   img1 = loadImage("c.png");
   img1.resize(100,100);
   img2 = loadImage("c1.png");
   img2.resize(100,100);
   img3 = loadImage("c2.png");
   img3.resize(100,100);
   img4 = loadImage("c3.png");
   img4.resize(100,100);
}
  
//uses count for crash animation sequence  
  void render()
  {  
 if(count<60)  
 image(img1,x,y);
 else if(count<10)  
 image(img2,x,y);
 else if(count<30)  
 image(img3,x,y);
 else if(count<50)  
 image(img4,x,y);
 
   else{
    count = -1; 
   }
   
   
   count ++;
  }
  
}
  
    
