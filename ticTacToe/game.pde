class game
{
  game(){}
    
  int[][] map = new int[3][3];
  
  void setup()
  {
    for(int a = 1; a <= 2; a++)
    {
      strokeWeight(4);
      stroke(0);
      line((width/3)*a, 0, (width/3)*a, height);
    }
    
    for(int a = 1; a <= 2; a++)
    {
      strokeWeight(4);
      stroke(0);
      line(0, (height/3)*a, width, (height/3)*a);
    }
    
    reset();
  }
  
  void draw()
  {
    if(hasWinner())
    {
     println("WINNER");
    }
  }
  
  void mouseClicked()
  {
    int x = (int) (mouseX / (width/3));
    int y = (int) (mouseY / (height/3));
    
    if(mouseButton == LEFT)
    {
      if(map[x][y] == 0)
      {
        drawX(x, y);
        map[x][y] = 2;
        
        logic();
      }
    }
    //else
    //{
    //  if(map[x][y] == 0)
    //  {
    //    drawO(x, y);
    //    map[x][y] = 1;
    //  }
    //}
  }
  
  void reset()
  {
    for(int a = 0; a < 3; a++)
    {
      for(int q = 0; q < 3; q++)
      {
        map[a][q] = 0;
      }
    }
  }
  
  void logic()
  {
    for(int q = 0; q < 3; q++)
    {
      for(int a = 0; a < 3; a++)
      {
        int s = 0;
        int correct = -1;
        
        for(int w = 0; w < 3; w++)
        {
          s += map[w][q];
          if(correct >= 0 && map[w][q] == 0)
          {
            s = 0;
            correct = -1;
            break;
          }
          else if(map[w][q] == 0)
          {
            correct = w;
          }
        }
        
        if(correct >= 0 && s == 3)
        {
          drawO(correct, q);
          map[correct][q] = 1;
        }
      }
    }
  }
  
  int sum(int[] s)
  {
    int q = 0;
    for(int a : s)
    {
      q += a;
    }
    
    return q;
  }
  
  boolean hasWinner()
  {
    for(int a = 0; a < 3; a++)
    {
      if(map[0][a] != 0 && map[0][a] == map[1][a] && map[1][a] == map[2][a])
      {
        return true;
      }
      
      if(map[a][0] != 0 && map[a][0] == map[a][1] && map[a][1] == map[a][2])
      {
        return true;
      }
    }
      
    if(map[0][0] != 0 && map[0][0] == map[1][1] && map[1][1] == map[2][2])
    {
      return true;
    }
    
    if(map[2][0] != 0 && map[2][0] == map[1][1] && map[1][1] == map[0][2])
    {
      return true;
    }
    
    return false;
  }
  
  void drawX(int x, int y)
  {
    if(map[x][y] == 0)
    {
      int bx = width/3;
      int by = height/3;
      strokeWeight(4);
      stroke(0);
      line(x * bx + 20, y * by + 20, x * bx + width/3 - 20, y * by + height/3 - 20);
      line(x * bx + width/3 - 20, y * by + 20, x * bx + 20, y * by + height/3 - 20);
    }
  }
  
  void drawO(int x, int y)
  {
    int bx = width/3;
    int by = height/3;
    
    if(map[x][y] == 0)
    {
      strokeWeight(4);
      stroke(0);
      noFill();
      ellipse(x * bx + (width/3)/2, y * by + (height/3)/2, width/3 - 20, height/3 - 20);
    }
  }
  
  void printMap()
  {
    println("===========================");
    for(int a = 0; a < 3; a++)
    {
      for(int q = 0; q < 3; q++)
      {
        print(map[q][a] + ", ");
      }
      println();
    }
    println("===========================");
  }
}
