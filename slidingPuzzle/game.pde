class game
{
  int rows;
  int w;
  ArrayList<block> grid;
  boolean canMove = true;
  int anm = 10;
  int random = 0;
  int clickCount = 0;
  PImage[] images = null;
  
  game(int rows)
  {
    this.rows = rows;
    images = null;
  }
  
  void setup()
  {
    grid = new ArrayList<block>();
    images = new PImage[rows * rows];
    w = width/rows;
    clickCount = 0;
    
    PImage img = null;
    img = loadImage("image.png");
    
    if(img != null)
    {
      int iw = img.width / rows;
      int ih = img.height / rows;
      
      int n = 0;
      for(int y = 0; y < rows; y++)
      {
        for(int x = 0; x < rows; x++)
        {
          images[n] = img.get(x * iw, y * ih, iw, ih);
          n++;
        }
      }
    }
    
    int n = 0;
    for(int y = 0; y < rows; y++)
    {
      for(int x = 0; x < rows; x++)
      {
        if((x + 1) * (y + 1) == rows * rows)
        {
          return;
        }
        
        block b = new block(new PVector(x, y), w, ++n, img == null ? null : images[n - 1]);
        b.setup();
        grid.add(b);
      }
    }
  }
  
  void render()
  { 
    if(hasWinner())
    {
      textSize(89);
      fill(0);
      text("YOU WIN", 10, height / 2);
      textSize(40);
      fill(0);
      String text = "with " + clickCount + " clicks!";
      text(text, width/2 - textWidth(text)/2, height / 2 + 100);
      textSize(20);
      fill(80);
      text("in " + level[n] + " rows mode!", width/2 - 100, height / 2 + 150);
    }
    else
    {
      if(random > 0)
      {
        randomize();
        
        random--;
      }
      
      for(block b : grid)
      {
        b.render();
      }
    }
  }
  
  void mousePressed()
  {
    if(canMove)
    {
      for(int a = 0; a < grid.size(); a++)
      {
        move m = getMove(grid.get(a).pos);
        if(grid.get(a).isOver() && m != null)
        {
          grid.get(a).move(m, anm);
          clickCount++;
          surface.setTitle(clickCount + " clicks");
          canMove = false;
          return;
        }
      }
    }
  }
  
  move getMove(PVector pos)
  {
    if(getNum(pos) == -2)
    {
      return null;
    }
    
    if(getNum(new PVector(pos.x + 1, pos.y)) == -1)
    {
      return move.RIGHT;
    }
    else if(getNum(new PVector(pos.x - 1, pos.y)) == -1)
    {
      return move.LEFT;
    }
    else if(getNum(new PVector(pos.x, pos.y + 1)) == -1)
    {
      return move.DOWN;
    }
    else if(getNum(new PVector(pos.x, pos.y - 1)) == -1)
    {
      return move.UP;
    }
    
    return null;
  }
  
  int getNum(PVector pos)
  {
    if(pos.x < 0 || pos.x >= rows || pos.y < 0 || pos.y >= rows)
    {
      return -2;
    }
    
    for(int a = 0; a < grid.size(); a++)
    {
      if(pos.equals(grid.get(a).pos))
      {
        return a;
      }
    }
    
    return -1;
  }
  
  PVector getEmptyPos()
  {
    for(int y = 0; y < rows; y++)
    {
      for(int x = 0; x < rows; x++)
      {
        PVector p = new PVector(x, y);
        if(getNum(p) < 0)
        {
          return p;
        }
      }
    }
    
    return new PVector(-1, -1);
  }
  
  void randomize()
  {
    for(int a = 0; a < rows*rows; a++)
    {
      int s = int(random(grid.size()));
      int e = int(random(grid.size()));
      
      if(e != s)
      {
        PVector p = grid.get(s).pos;
        grid.get(s).setPos(grid.get(e).pos);
        grid.get(e).setPos(p);
      }
    }
  }
  
  boolean hasWinner()
  {
    int n = 1;
    for(int y = 0; y < rows; y++)
    {
      for(int x = 0; x < rows; x++)
      {
        int nm = getNum(new PVector(x, y));
        if(nm >= 0)
        {
          if(grid.get(nm).id != n)
          {
            return false;
          }
        }
        n++;
      }
    }
    
    if(!getEmptyPos().equals(new PVector(rows - 1, rows - 1)))
    {
      return false;
    }
    
    return true;
  }
}
