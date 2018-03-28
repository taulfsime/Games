class game
{
  int w;
  int h;
  
  boolean[][] map;
  
  game(int w, int h)
  {
    this.w = w;
    this.h = h;
    
    map = new boolean[w][h];
  }
  
  boolean[][] getMap()
  {
    return map;
  }
  
  void load()
  {
    for(int a = 0; a < h; a++)
    {
      for(int q = 0; q < w; q++)
      {
        map[q][a] = true;
      }
    }
    map[0][0] = false;
  }
  
  void render()
  {
    int w = width / this.w;
    int h = height / this.h;
    int c = 0;
    
    for(int a = 0; a < this.h; a++)
    {
      for(int q = 0; q < this.w; q++)
      {
        if(getMap()[q][a])
        {
          noFill();
          stroke(0);
          strokeWeight(1);
          rect(q * w, a * h, w, h);
          
          textSize(32);
          fill(0);
          text(++c, (q + 0) * w + w/3, (a + 0) * h + h/2);
        }
      }
    }
  }
  
  void mousePressed()
  {
    int w = width / this.w;
    int h = height / this.h;
    int x = mouseX / w;
    int y = mouseY / h;
    
    if(x > 0 && !getMap()[x - 1][y])
    {
      map[x][y] = true;
      map[x - 1][y] = false;
    }
    else if(y > 0 && !getMap()[x][y - 1])
    {
      
    }
    else if(x < w - 1 && !getMap()[x + 1][y])
    {
      
    }
    else if(y < h + 1 && !getMap()[x][y + 1])
    {
      
    }
  }
}
