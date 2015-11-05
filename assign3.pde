//You should implement your assign3 here.


final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
int gameState;
PImage hp;
PImage enemy;
PImage treasure;
PImage fighter;
PImage bg1;
PImage bg2;
PImage start2 ;
PImage start1 ;
PImage end1 ;
PImage end2 ;
int aa ;
int bb ;
int cc ;
int dd ;
int ee ;
int ff ;
int gg ;
int x = 550;
int y = 240;
float speed = 5;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;


void setup(){
  background(0);
  size(640,480);
  
  
  aa=0 ;
  bb=0 ;
  gg=40;
  cc=floor(random(0,600));
  dd=floor(random(0,440));
  ee=floor(random(0,420));
  ff=floor(random(0,440));
  fill(255,0,0);
  rect(10,10,gg,31);
  fighter=loadImage("img/fighter.png");
  hp=loadImage("img/hp.png");
  enemy=loadImage("img/enemy.png");
  treasure=loadImage("img/treasure.png");
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  start2=loadImage("img/start1.png");
  start1=loadImage("img/start2.png");  
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
}
void draw(){
  image(start1,0,0);
    switch (gameState){
    case GAME_START:
  if(mouseX>210 && mouseX<440 && mouseY>380 && mouseY<410){
    if(mousePressed){
          gameState = GAME_RUN;
    }else{
      image(start2,0,0);
    }
  }
  break ;
  case GAME_RUN:
     for( int z=0;z<=5;z=z+1){
    image(bg1,aa-640,0);
  image(bg2,aa,0);  
  image(bg1,aa+640,0);
  image(bg2,aa-1280,0);
  fill(255,0,0);
  rect(15,10,gg,31);
  image(hp,10,10);
  image(enemy,bb,ee);
  image(treasure,cc,dd);
  image(fighter,x,y);
  aa += 1 ;
  bb += 2 ;
  aa %= 1280 ;
  bb %= 580 ;
  ff %= 440 ;
    if (upPressed) {
    y -= speed;
  }
  if (downPressed) {
    y += speed;
  }
  if (leftPressed) {
    x -= speed;
  }
  if (rightPressed) {
    x += speed;
  }
  if( x <= 0 ){
  x=0;
  }
  if( y <= 0 ){
  y=0;
  }
  if( x >= 590 ){
  x=590; 
  }
  if( y >= 430 ){
  y=430; 
   }

  /*if(x>=cc-45 && x<cc+40 && y>=dd-45 && y<=dd+40){
  cc=floor(random(0,600));
  dd=floor(random(0,440));
  image(treasure,cc,dd);   
  gg += 20;
  }
  if(x>=bb-45 && x<bb+60 && y>=ee-45 && y<=ee+60){
  bb=0;    
  ee=floor(random(0,440));
  image(treasure,bb,ee);   
  bb+=2;
  gg -= 40;
  }*/
  if(gg>=200){
    gg=200;
  }
  if(ee>y){
    ee-=2;
  }
  if(ee==y){
    bb+=3;
  }
  if(ee<y){
    ee+=2;
  }
  if(gg<=0){
    gameState = GAME_OVER;
  }
  break ;}
  case GAME_OVER:
    image(end1,0,0);
  if (mouseX>210 && mouseX<440 && mouseY>315 && mouseY<345){
    if (mousePressed){
     gameState = GAME_RUN;    
     gg=40;
  aa=0 ;
  bb=0 ;
  gg=40;
  cc=floor(random(0,600));
  dd=floor(random(0,440));
  ee=floor(random(0,440));
  ff=floor(random(0,440)); 
  x = 550;
  y = 240;
    }else{
     image(end2,0,0);
    }
  break;

   }     
    }  
    }
    




  
  
  
  
  

void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
