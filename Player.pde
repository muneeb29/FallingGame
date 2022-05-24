class Player{
//variables declared  
  int x,y;
  float xspeed = 5; 
  float yspeed = 5; 
  float h,w;
  PImage character;
  int score = 0;
  int life1 = 3;
  
//constructor
  Player(int x, int y)
  {
   this.x = x;
   this.y = y;
   character = loadImage("cm.png"); 
   character.resize(100,100);
   this.h = character.height;
   this.w = character.width;
   
  }
  
  void move()
 {
   //prevents player from going off screen
    if(x < 0 || x > 700)  
    x=400;
    
    
    if (y < 100 || y > 650)
    y=200;
     
   
 }
 
  void render(){
 image(character,x,y);
  }
  
  void bounce(){ 
  xspeed = -xspeed;
  yspeed = - yspeed;


} 
  
  void update(){
    move();
    render();
  }

//Collision detection between orange object and Player  
    boolean crash()
  {
   color colortest;
   for(int i=y; i<y+20; i++){
     colortest = get(x + 45, i);
     if (colortest == c1 || colortest == c2 ) {
       return true;
     }
   } 
    return false;
}
  
    

}
  
  
  
