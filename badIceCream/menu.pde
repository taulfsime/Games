void menu()
{
  
}

class createLevel
{
  //String showBox = "gridBox.png";
  //String playerType = "brown";
  //String showPlayer = "player/" + playerType + "/down.png";
  //String showObstacle = "obstacle/ice.png";
  //String showFood = "food/banana.png";
  //String showEnemy = "enemy/first/down.png";
    
  int x = 0;
  int y = 0;
  int w = 0;
  int h = 0;
  
  PImage[][] map;
  PImage[][] entities;
  
  String type = null;
  PImage show = null;
  String scroll = "down";
  boolean hasScroll = false;
  
  createLevel()
  {    
    w = width/grid;
    h = height/grid;
    
    map = new PImage[w][h];
        
    for(int a = 0; a < h; a++)
    {
      for(int q = 0; q < w; q++)
      {
        map[q][a] = null;
      }
    }
    
    entities = new PImage[w][h];
        
    for(int a = 0; a < h; a++)
    {
      for(int q = 0; q < w; q++)
      {
        entities[q][a] = null;
      }
    }
  }
  
  void render()
  {
    x = int(mouseX/grid) >= 0 ? int(mouseX/grid) : 0;
    y = int(mouseY/grid) >= 0 ? int(mouseY/grid) : 0;
    
    background(0);
    
    for(int a = 0; a < h; a++)
    {
      for(int q = 0; q < w; q++)
      {
        if(map[q][a] != null)
        {
          image(map[q][a], grid * q, grid * a, grid, grid);
        }
        
        if(entities[q][a] != null)
        {
          image(entities[q][a], grid * q, grid * a, grid, grid);
        }
      }
    }
    
    checkDraw();
    tint(255, 170);
    image(show == null ? loadImage("textures/gridBox.png") : show, x * grid, y * grid, grid, grid);
    tint(255, 255);
    if(mousePressed)
    {
      mouse();
    }
  }
  
  void keyClicked()
  {
    switch(key)
    {
      case '1':
      {
        type = "ice";
      }
      break;
      
      case '2':
      {
        type = "player_brown";
      }
      break;
      
      case '3':
      {
        type = "banana";
      }
      break;
      
      case '4':
      {
        type = "first";
      }
      break;
    }
  }
  
  void checkDraw()
  {
    if(type != null)
    {
      switch(type)
      {
        case "ice":
        {
          show = drawObstacle(obstacleTypes.ICE);
        }
        break;
        
        case "player_brown":
        {
          show = drawPlayer(playerTypes.BROWN, facing.DOWN, false)[0];
        }
        break;
        
        case "banana":
        {
          show = drawFood(foodTypes.BANANA);
        }
        break;
        
        case "first":
        {
          show = drawEnemy(enemyTypes.FIRST, facing.DOWN);
        }
        break;
      }
    }
  }
  
  void mouse()
  {
    if(type != null && mouseButton == LEFT)
    {
      switch(type)
      {
        case "ice":
        {
          map[x][y] = show;
        }
        break;
        
        case "player_brown":
        {
          entities[x][y] = show;
        }
        break;
        
        case "banana":
        {
          entities[x][y] = show;
        }
        break;
        
        case "first":
        {
          entities[x][y] = show;
        }
        break;
      }
    }
  }
  
  void scroll(boolean dir)
  {
    
  }
}
