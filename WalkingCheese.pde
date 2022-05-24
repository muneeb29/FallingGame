//Class used to change cheese image after player scores > 5 points
class WalkingCheese extends Cheese{

//uses inheritance  
WalkingCheese(int x, int y, int xspeed){
super(x,y,xspeed);
    
   walk1 = loadImage("walk1.png"); 
   walk1.resize(100,100);
   walk2 = loadImage("walk2.png"); 
   walk2.resize(100,100);
    }
  
    void render()
  {  
  //changes images   
   if(count<10)
   image(walk1,x,y);
   else if(count<30)
   image(walk2,x,y);

   else{
    count = -1; 
   }
   count ++; 
  
 
    
}
  
  
}
