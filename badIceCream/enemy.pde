class enemy extends object
{
  facing cFacing = facing.DOWN;
  boolean canMove = true;
  
  enemy(int x, int y)
  {
    super(x, y);
  }
  
  void logic(){}
  void render() {}
  void keyClicked(){}
}

class enemyFirst extends enemy
{
  int timer = 0;
 
  enemyFirst(int x, int y)
  {
    super(x, y);
  }
  
  void render()
  {
    tint(255, 255);
    image(drawEnemy(enemyTypes.FIRST, cFacing), x*grid, y*grid, grid, grid);
  }
  
  void logic()
  { 
    if(timer > 25 && cFacing != null)
    {
      switch(cFacing)
      {
        case UP:
        {
          if(system.getMove(x, y).contains(facing.UP))
          {
            y--;
          }
        }
        break;
        
        case DOWN:
        {
          if(system.getMove(x, y).contains(facing.DOWN))
          {
            y++;
          }
        }
        break;
        
        case LEFT:
        {
          if(system.getMove(x, y).contains(facing.LEFT))
          {
            x--;
          }
        }
        break;
        
        case RIGHT:
        {
          if(system.getMove(x, y).contains(facing.RIGHT))
          {
            x++;
          }
        }
        break;
      }
      timer = 0;
    }
    else
    {
      timer++;
    }
    
    ArrayList<facing> move = system.getMove(x, y);
    
    if(move.size() > 0)
    {
      if((x == 0 && cFacing == facing.LEFT) || (x == 14 && cFacing == facing.RIGHT) || (y == 0 && cFacing == facing.UP) || (y == 12 && cFacing == facing.DOWN) ||
          (x > 0 && cFacing == facing.LEFT && system.getBlock(x - 1, y).hasCollision) || (x < 14 && cFacing == facing.RIGHT && system.getBlock(x + 1, y).hasCollision) ||
          (y > 0 && cFacing == facing.UP && system.getBlock(x, y - 1).hasCollision) || (y < 12 && cFacing == facing.DOWN && system.getBlock(x, y + 1).hasCollision))
      {
        float rand = (float) (random(0, move.size()));
        cFacing = move.get((int) rand);
      }
      else if((int) (random(0, 20)) == 3)
      { //<>//
        float rand = (float) (random(0, move.size()));
        cFacing = move.get((int) rand);
      }
    }
    else
    {
     canMove = false;
    } //<>//
  }
}
