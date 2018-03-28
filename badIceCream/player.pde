class player extends object
{
  playerTypes type;
  facing cFacing = facing.DOWN;
  String name = "player";
  boolean canPower = true;
  int score = 0;
  int animaniton = 0;
  boolean isDead = false;
  
  player(int x, int y, playerTypes type)
  {
    super(x, y);
    this.type = type;
  }
  
  void logic()
  {
    object o = system.getObject(x, y);
    if(o != null && o instanceof food)
    {
      score++;
      system.unregisterObject(o);
    }
  }
  
  void render()
  {
    image((drawPlayer(type, cFacing, isDead)[++animaniton > (animaniton > 20 ? (animaniton = 0) : 10) ? 0 : 1]), x * grid, y * grid, grid, grid);
  }
  
  void usePower(int x, int y, facing f, playerPowerTypes p)
  {
    if(x < 0 || x > width/grid || y < 0 || y > height/grid)
    {
      canPower = true;
      println("exit");
      return;
    }
    
    switch(f)
    {
      case LEFT:
      {
        usePower(x - 1, y, f, p);
      }
      break;
      
      case RIGHT:
      {
        usePower(x + 1, y, f, p);
      }
      break;
      
      case DOWN:
      {
        usePower(x, y + 1, f, p);
      }
      break;
      
      case UP:
      {
        usePower(x, y - 1, f, p);
      }
      break;
    }
    
    //if(x != this.x && y != this.y)
    {
      switch(p)
      {
        case PLACEICE:
        {
          if(system.getBlock(x, y) instanceof air)
          {
            system.setBlock(new obstacleIce(), x, y);
          }
          else
          {
            println("exit1");
            canPower = true;
          }
        }
        break;
        
        case BREAKICE:
        {
          if(system.getBlock(x, y).canBreak)
          {
            system.setBlock(new air(), x, y);
          }
          else
          {
            println("exit2");
            canPower = true;
          }
        }
        break;
      }
    }
  }
  
  void move(facing f)
  {
    switch(f)
    {
      case DOWN:
      {
        if(system.getMove(x, y).contains(facing.DOWN))
        {
          y++;
        }
        cFacing = facing.DOWN;
      }
      break;
      
      case UP:
      {
        if(system.getMove(x, y).contains(facing.UP))
        {
          y--;
        }
        cFacing = facing.UP;
      }
      break;
      
      case LEFT:
      {
        if(system.getMove(x, y).contains(facing.LEFT))
        {
          x--;
        }
        cFacing = facing.LEFT;
      }
      break;
      
      case RIGHT:
      {
        if(system.getMove(x, y).contains(facing.RIGHT))
        {
          x++;
        }
        cFacing = facing.RIGHT;
      }
      break;
    }
  }
  
  void keyClicked()
  {
    switch(key)
    {
      case 'a':
      {
        move(facing.LEFT);
      }
      break;
      
      case 's':
      {
        move(facing.DOWN);
      }
      break;
      
      case 'd':
      {
        move(facing.RIGHT);
      }
      break;
      
      case 'w':
      {
        move(facing.UP);
      }
      break;
      
      case ' ':
      {
        if(canPower)
        {
          usePower(x, y, cFacing, playerPowerTypes.PLACEICE);
          canPower = false;
        }
      }
      break;
    }
  }
}
