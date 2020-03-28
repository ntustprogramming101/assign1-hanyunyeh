/* @pjs preload=
"img/bg.jpg,
img/groundhog.png,
img/life.png,
img/robot.png,
img/soil.png,
img/soldier.png"; */

int soldierX,soldierY,soldierSpeed;
int robotX,robotY;
int lightStartX,lightStartY,lightEndX,LIGHT_W;

PImage bg ,groundhog ,life ,robot ,soil ,soldier;

void setup(){
  //load image
  size(640,480);
  bg = loadImage("img/bg.jpg");
  groundhog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  soil = loadImage("img/soil.png");
  
  soldier = loadImage("img/soldier.png");
  //set soldier's coordinate
  soldierX = -40;
  soldierY = floor(random(2,6))*80;;
  
  robot = loadImage("img/robot.png");
  //set robot's coordinate
  robotX = floor(random(2,8))*80;;
  robotY = floor(random(2,6))*80;;
  
  //set lightX's coordinate
  lightStartX = robotX+25;
  lightStartY = robotY+37;
  lightEndX = lightStartX + LIGHT_W;
  LIGHT_W = -2;
 
  
}


void draw() {
  //set sky
  background(0);
  image(bg,0,0);
  
  //grass
  noStroke();
  fill(124, 204, 25);
  rect(0, 145, 640, 480);
  //sun
  fill(255, 255, 0);
  ellipse(590,50,130,130);
  fill(253, 184, 19);
  ellipse(590,50,120,120);
  //ground
  image(soil,0,160);
  //life icon
  image(life,10,10);
  image(life,80,10);
  image(life,150,10);
  //groundhog
  image(groundhog,280,80);
  
  
  //set soldier
  image(soldier,soldierX,soldierY);
  //let the soldier move 
  soldierSpeed = 2;
  soldierX += soldierSpeed;
  soldierX %= 640;
  
  //set robot
  image(robot,robotX,robotY);

  //robot's light
  stroke(255,0,0);
  strokeWeight(10); 
  //set the light coordinate
  line(lightStartX,lightStartY,lightEndX,lightStartY);
  lightStartX += LIGHT_W;
  
  //set light's length
  if(lightEndX - lightStartX >=40)
  {
    lightEndX +=LIGHT_W;
  }
  
  //restart the light
  if(robotX-lightStartX >=185)
  {
  lightStartX = robotX+25;
  lightEndX = robotX+25;
  }

}
