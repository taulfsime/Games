class game
{
  private int rows;
  private int w;
  private int[][] grid;
  
  game(int rows)
  {
    this.rows = rows;
    w = width / this.rows;
    grid = new int[this.rows][this.rows];
    
    for(int x = 0; x < rows; x++)
    {
      for(int y = 0; y < rows; y++)
      {
        grid[x][y] = 0;
      }
    }
    
    generate();
  }
  
  void render()
  {
    for(int x = 0; x < rows; x++)
    {
      for(int y = 0; y < rows; y++)
      {
        int n = grid[x][y];
        if(n == 0)
        {
          drawRect(x, y);
        }
        else
        {
          drawRect(x, y, n);
        }
      }
    }
  }
  
  void generate()
  {
    int n = (random(0, 1) > 0.8 ? 4 : 2);
    ArrayList<PVector> pos = new ArrayList<PVector>();
    
    for(int x = 0; x < rows; x++)
    {
      for(int y = 0; y < rows; y++)
      {
        if(grid[x][y] == 0)
        {
          pos.add(new PVector(x, y));
        }
      }
    }
    
    PVector p = pos.get(int(random(0, pos.size())));
    //println("new at " + int(p.x) + ", " + int(p.y));
    grid[int(p.x)][int(p.y)] = n;
  }
  
  void moveUp()
  {
    boolean gen = false;
    
    for(int x = 0; x < rows; x++)
    {
      for(int y = rows - 2; y >= 0; y--)
      {
        if(grid[x][y] == 0 && grid[x][y + 1] != 0)
        {
          grid[x][y] = grid[x][y + 1];
          grid[x][y + 1] = 0;
          
          gen = true;
        }
        else if(grid[x][y] == grid[x][y + 1])
        {
          grid[x][y] += grid[x][y + 1];
          grid[x][y + 1] = 0;
        }
      }
    }
    
    if(gen)
    {
      generate();
    }
  }
  
  void moveDown()
  {
    boolean gen = false;
    
    for(int x = 0; x < rows; x++)
    {
      for(int y = 1; y < rows; y++)
      {
        if(grid[x][y] == 0 && grid[x][y - 1] != 0)
        {
          grid[x][y] = grid[x][y - 1];
          grid[x][y - 1] = 0;
          
          gen = true;
        }
        else if(grid[x][y] == grid[x][y - 1])
        {
          grid[x][y] += grid[x][y - 1];
          grid[x][y - 1] = 0;
        }
      }
    }
    
    if(gen)
    {
      generate();
    }
  }
  
  void moveLeft()
  {
    boolean gen = false;
    
    for(int y = 0; y < rows; y++)
    {
      for(int x = rows - 2; x >= 0; x--)
      {
        if(grid[x][y] == 0 && grid[x + 1][y] != 0)
        {
          grid[x][y] = grid[x + 1][y];
          grid[x + 1][y] = 0;
          
          gen = true;
        }
        else if(grid[x][y] == grid[x + 1][y])
        {
          grid[x][y] += grid[x + 1][y];
          grid[x + 1][y] = 0;
        }
      }
    }
    
    if(gen)
    {
      generate();
    }
  }
  
  void moveRight()
  {
    boolean gen = false;
    
    for(int y = 0; y < rows; y++)
    {
      for(int x = 1; x < rows; x++)
      {
        if(grid[x][y] == 0 && grid[x - 1][y] != 0)
        {
          grid[x][y] = grid[x - 1][y];
          grid[x - 1][y] = 0;
          
          gen = true;
        }
        else if(grid[x][y] == grid[x - 1][y])
        {
          grid[x][y] += grid[x - 1][y];
          grid[x - 1][y] = 0;
        }
      }
    }
    
    if(gen)
    {
      generate();
    }
  }
  
  void keyTyped()
  {    
    switch(key)
    {
      case 'w':
      {
        moveUp();
        return;
      }
      
      case 's':
      {
        moveDown();
        return;
      }
      
      case 'a':
      {
        moveLeft();
        return;
      }
      
      case 'd':
      {
        moveRight();
        return;
      }
    }
  }
  
  void drawRect(int x, int y, int n)
  {
    tint(255, 255);
    stroke(0);
    strokeWeight(1);
    fill(255);
    rect(x * w, y * w, w, w);
    fill(0);
    textSize(40);
    text(n, x * w + w / 3, y * w + w / 2);
  }
  
  void drawRect(int x, int y)
  {
    tint(255, 255);
    stroke(0);
    strokeWeight(1);
    fill(255);
    rect(x * w, y * w, w, w);
  }
}
