PImage[] drawPlayer(playerTypes type, facing facing, boolean isDead)
{
  PImage[] r = new PImage[2];
  
  String t = "";
  switch(type)
  {
    case BROWN:
    {
      t = "brown";
    }
    
    case RED:
    {
      //t = "red";
    }
  }
  
  if(isDead)
  {
    r[0] = loadImage("textures/player/" + t + "/dead.png");
    r[1] = loadImage("textures/player/" + t + "/dead1.png");
  }
  else
  {
    String f = "";
    
    switch(facing)
    {
      case DOWN:
        f = "down";
      break;
      
      case UP:
        f = "up";
      break;
      
      case LEFT:
        f = "left";
      break;
      
      case RIGHT:
        f = "right";
      break;
    }
    
    r[0] = loadImage("textures/player/" + t + "/" + f + ".png");
    r[1] = loadImage("textures/player/" + t + "/" + f + "1.png");
    
  }
  return r;
}

PImage drawObstacle(obstacleTypes type)
{
  switch(type)
  {
    case ICE:
    {
      return loadImage("textures/obstacle/ice.png");
    }
  }
  
  return null;
}

PImage drawFood(foodTypes type)
{
  switch(type)
  {
    case BANANA:
    {
      return loadImage("textures/food/banana.png");
    }
  }
  
  return null;
}

PImage drawEnemy(enemyTypes type, facing facing)
{
  String f = "";
  
  switch(facing)
  {
    case DOWN:
      f = "down";
    break;
    
    case UP:
      f = "up";
    break;
    
    case LEFT:
      f = "left";
    break;
    
    case RIGHT:
      f = "right";
    break;
  }
  
  switch(type)
  {
    case FIRST:
    {
      return loadImage("textures/enemy/first/" + f + ".png");
    }
  }
  
  return null;
}

public enum playerTypes {RED, BROWN};
public enum playerPowerTypes {PLACEICE, BREAKICE};
public enum obstacleTypes {ICE};
public enum foodTypes {BANANA};
public enum enemyTypes {FIRST};
public enum facing {DOWN, UP, LEFT, RIGHT};
