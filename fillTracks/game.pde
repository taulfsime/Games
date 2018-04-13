class game
{
  block[][] map;
  FACING move = null;
  int playerAnimation = 0;
  int blockWidth = 50;
  
  int w;
  int h;
  
  game()
  {
    move = null;
    w = width / blockWidth;
    h = height / blockWidth;
    
    map = new block[w][h];
    
    for(int y = 0; y < h; y++)
    {
      for(int x = 0; x < w; x++)
      {
        map[x][y] = new empty(new PVector(x, y), blockWidth);
      }
    }
    
    for(int a = 0; a < 10; a++)
    {
      int rx = int(random(w));
      int ry = int(random(h));
      map[rx][ry] = new obstacle(new PVector(rx, ry), blockWidth);
    }
    
    for(int a = 0; a < 10; a++)
    {
      int rx = int(random(w));
      int ry = int(random(h));
      map[rx][ry] = new logic(new PVector(rx, ry), blockWidth);
    }
    
    int rx = int(random(w));
    int ry = int(random(h));
    map[rx][ry] = new player(new PVector(rx, ry), blockWidth);
    map[rx][ry].setStatic(false);
  }
  
  void setMap(int[][] m, int w, int h)
  {
    for(int y = 0; y < h; y++)
    {
      for(int x = 0; x < w; x++)
      {
        
      }
    }
  }
  
  void render()
  {
    if(move != null && playerAnimation > 0)
    {      
      int sx = int(getNonStatic().x);
      int sy = int(getNonStatic().y);
      
      switch(move)
      {
        case UP:
        {
          move(sx, sy, sx, sy - 1);
        }
        break;
        
        case DOWN:
        {
          move(sx, sy, sx, sy + 1);
        }
        break;
        
        case RIGHT:
        {
          move(sx, sy, sx + 1, sy);
        }
        break;
        
        case LEFT:
        {
          move(sx, sy, sx - 1, sy);
        }
        break;
      }
      
      playerAnimation = 0;
    }
    else
    {
      playerAnimation++;
    }
    
    for(int y = 0; y < h; y++)
    {
      for(int x = 0; x < w; x++)
      {
        map[x][y].render();
      }
    }
  }
  
  void move(int x, int y, int x1, int y1)
  { 
    if(x1 < 0 || x1 >= w || y1 < 0 || y1 >= h  || !(map[x1][y1] instanceof empty))
    {
      checkLogic(move);
      move = null;
      
      return;
    }
    
    map[x][y].setStatic(true);
    map[x1][y1] = new player(new PVector(x1, y1), blockWidth);
    connect(x, y, x1, y1);
  }
  
  PVector getNonStatic()
  {
    for(int y = 0; y < h; y++)
    {
      for(int x = 0; x < w; x++)
      {
        if(!map[x][y].isStatic && map[x][y] instanceof player)
        {
          return new PVector(x, y);
        }
      }
    }
    
    return new PVector(-1, -1);
  }
  
  void connect(int x, int y, int x1, int y1)
  {
    if(x == x1)
    {
      if(y > y1)
      {
        map[x][y].connect(FACING.UP);
        map[x1][y1].connect(FACING.DOWN);
      }
      else
      {
        map[x][y].connect(FACING.DOWN);
        map[x1][y1].connect(FACING.UP);
      }
    }
    else if(y == y1)
    {
      if(x > x1)
      {
        map[x][y].connect(FACING.LEFT);
        map[x1][y1].connect(FACING.RIGHT);
      }
      else
      {
        map[x][y].connect(FACING.RIGHT);
        map[x1][y1].connect(FACING.LEFT);
      }
    }
  }
  
  void keyPress(int c)
  {
    if(move != null)
    {
      return;
    }
    
    switch(c)
    {
      case UP:
      {
        move = FACING.UP;
      }
      break;
      
      case DOWN:
      {
        move = FACING.DOWN;
      }
      break;
      
      case LEFT:
      {
        move = FACING.LEFT;
      }
      break;
      
      case RIGHT:
      {
        move = FACING.RIGHT;
      }
      break;
      
    }
  }
  
  void checkLogic(FACING f)
  {
    int x = int(getNonStatic().x);
    int y = int(getNonStatic().y);
        
    switch(f)
    {
      case DOWN:
      {
        if(y < h - 1 && map[x][y + 1] instanceof logic)
        {
          map[x][y + 1] = new empty(new PVector(x, y + 1), blockWidth);
        }
      }
      break;
      
      case UP:
      {
        if(y > 0 && map[x][y - 1] instanceof logic)
        {
          map[x][y - 1] = new empty(new PVector(x, y - 1), blockWidth);
        }
      }
      break;
      
      case RIGHT:
      {
        if(x < w - 1 && map[x + 1][y] instanceof logic)
        {
          map[x + 1][y] = new empty(new PVector(x + 1, y), blockWidth);
        }
      }
      break;
      
      case LEFT:
      {
        if(x > 0 && map[x - 1][y] instanceof logic)
        {
          map[x - 1][y] = new empty(new PVector(x - 1, y), blockWidth);
        }
      }
      break;
    }
  }
}
