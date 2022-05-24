//By Muneeb Khalid 
/*Player has to use arrow keys left,right, up, and down to avoid the cheese obstacle
and collect the popcorn for one point and the ellipse for 2 points. The Player has
3 lives and for each cheese they collide with they lose one life.*/

//variables declared  
PImage background, screen, end;
PFont font;
int x = 0; 
int y = 0;
int gameScreen = 0;
int crashed ;
int gameMode = NORMAL;
int frequency = 140; 

//Arraylist for orange collectable 
ArrayList<Orange> oranges = new ArrayList<Orange>();

//Arraylist for health bar 
ArrayList<Lives> lives = new ArrayList<Lives>();

Popcorn obstacle1;
Popcorn obstacle2;
Popcorn obstacle3;
Cheese drop1;
Cheese drop2;
Player Player1;
Explosion crash;

void setup() {
//sets canvas size
  size(800, 700);
  font = loadFont("AvenirNextCondensed-Bold-48.vlw");
  textFont(font);
  gameMode = NORMAL;
  background = loadImage("bg.png"); 
  screen = loadImage("start.png"); 
  end = loadImage("end.png");

  //background set to width and height of screen
  background.resize(width, height);
  
  //positions popcorn object
  obstacle1 = new Popcorn(200, 50, 1);
  obstacle2 = new Popcorn(550, 650, 1);
  obstacle3 = new Popcorn(100, 250, 1);
  
  //positions cheese object
  drop1 = new Cheese(300,200,1);
  drop2 = new Cheese(650,300,1);
  
  //positions crash off screen for now
  crash = new Explosion(900,900,1);
  
  //positions player object
  Player1 = new Player(400, 50);
  
 //Places lives on right side 
 lives.add(new Lives(700, 15));
 lives.add(new Lives(650, 15));
 lives.add(new Lives(600, 15)); 
}

void draw() {
  if (gameMode != crashed) { 
    if (gameScreen == 0) {
      startScreen();
    } 
    else if (gameScreen == 1) {
      gameScreen();
      Player1.update();
      
      drop1.update();
      drop2.update();
      
      obstacle1.update();
      obstacle2.update();
      obstacle3.update();

      collision(obstacle1);
      collision(obstacle2);
      collision(obstacle3);
      
      collisionC(drop1);
      collisionC(drop2);
      
      crash.render();
      removeCrash();
      
      drawOrange();
      
    for (int i = 0; i < lives.size(); i++) {
    Lives p = lives.get(i);
    p.render();
    
 
}
      if (Player1.crash()==true) {
      Player1.score +=2; 
      //player gets 2 points for colliding
      for(int i=oranges.size()-1; i>=0; i--){
       oranges.remove(i);
      //removes all orange obstacles on collision  
     }
  
}
     }
      lifeEnd();
      textSize(26);
      fill(255,255);
      text ("Score: " + Player1.score,20,30);
      text ("Lives: " + Player1.life1,320,30);
    
  }
  else if (gameScreen == 2) {
      endScreen();
      lifeEnd();
    }
}

//background loops downwards  
void gameScreen () {

  image(background, 0, y); 
  image(background, 0, y+background.height);
  y -= 4;
  if (y == -background.height){
  y=0; 
  }
}

//start screen image
void startScreen() {
  image(screen, x, 0);
}

//end screen image
void endScreen() {
  image(end, x, 0);
}

//starts game on mouse click
void mousePressed() {
  if (gameScreen==0) {
//game starts if gamescreen is 1
     gameScreen=1;
  }
}

void drawOrange() {
  //sets ellipse to have white colour 
  strokeWeight(8);
  stroke(c2);
  if (frameCount % frequency == 0) {
    //creates 10 oranges
    Orange orange = new Orange(10);
    oranges.add(orange);
  }
  for (int i = 0; i<oranges.size(); i++) {
    Orange currentOrange = oranges.get(i);
    currentOrange.drawOrange();
  }
}

//collision between player and popcorn 
void collision(Popcorn obstacle) {
  if (Player1.x < obstacle.x + obstacle.w &&
    Player1.x + Player1.w > obstacle.x &&
    Player1.y < obstacle.y + obstacle.h &&
    Player1.y + Player1.h >  obstacle.y)
  { 
    //adds 1 to score
    Player1.score += 1;
    //removes obstacle off screen on collision 
    obstacle.y = -200;   
    //changes obstacle after > 5 points
    obstacleChange();
    }    
  }
  
  
//collision between player and cheese obstacle
void collisionC(Cheese drop) {
  if (Player1.x < drop.x + drop.w &&
    Player1.x + Player1.w > drop.x &&
    Player1.y < drop.y + drop.h &&
    Player1.y + Player1.h >  drop.y)
  {
    //positions crash sequence 
    crash.x = drop.x;
    crash.y = drop.y;
    //removes obstacle off screen 
    drop.y = -200; 
    //removes a life 
    Player1.life1 --;
    lifea();
    

  }
}

 //changes obstacle on if score is > 5
void obstacleChange(){
  if(Player1.score > 5){
    //uses inheritance
    drop1 = new WalkingCheese(300,200,1);
    //obstacle is removed on collision popcorn object
    drop1.y = -400; 
}
}

//removes crash animation 
void removeCrash(){
  if(crash.count == 50){
    //places crash off screen after sequence is over
    crash.x = -900;
   }
}

//if player loses lives end screen is shown
void lifeEnd()
{
  if(Player1.life1 == 0)
  {
    gameMode = crashed;
    endScreen();
    
  }
}

//Removes a live on each collision with cheese objects
void lifea(){
  if(lives.size() > 0)
  {
    lives.remove(0);
  }
  
//once all lives are removed gameMode is set to crash 
//avoids index out of bounds error
else
{
  gameMode = crashed;
}
}

//arrows coded for player movement
void keyPressed()
{
  if (key ==CODED) {
    if (keyCode==LEFT) {
      Player1.x=Player1.x - 30 ;
      
    } else if (keyCode== RIGHT)
    {
      Player1.x=Player1.x + 30 ;
    } else if (keyCode== UP)
    {
      Player1.y=Player1.y - 20 ;
    } else if (keyCode== DOWN)
    {
      Player1.y=Player1.y + 20 ;
    }
    //restarts game if space is pressed
  } else if (key==' ' &&  gameMode == crashed)
  {
    setup();
  }
}
  
  
