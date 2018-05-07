class grid
{
  private int rows;
  private int cols;
  private ArrayList<shape> shapes;
  private blockPos vel;
  private int timer = 0;
  private int curB = -1;
  
  public grid(int rows, int cols)
  {
    this.rows = rows;
    this.cols = cols;
    this.shapes = new ArrayList<shape>(this.rows * this.cols);
    vel = new blockPos(0, 1);
    timer = 0;
  }
  
  public void render()
  {
    for(shape b : shapes)
    {
      b.render();
    }
    
    if(++timer > 40)
    {
      this.update();
      
      timer = 0;
    }
  }
  
  private void update()
  {
    if(canMove(shapes.get(curB), vel))
    {
      shapes.get(curB).update(vel);
    }
    else
    {
      vel.setX(0);
      if(canMove(shapes.get(curB), vel))
      {
        shapes.get(curB).update(vel);
      }
    }
    
    vel = new blockPos(0, 1);
  }
  
  public void setMove(boolean left, boolean right)
  {
    vel.setX(left ? -1 : (right ? 1 : 0));
  }
  
  public void add(shape s)
  {
    for(block b : s.getBlocks())
    {
      if(!isEmpty(b.getPos()))
      {
        return;
      }
    }
    
    curB++;
    shapes.add(s);
  }
  
  public boolean canMove(shape s, blockPos vel)
  {
    for(block block : s.getBlocks())
    {
      int x = block.getPos().getX() + vel.getX();
      
      if(x + 1 > width / block.getBlockWidth() || x <= -1) return false;
      
      int y = block.getPos().getY() + vel.getY();
      
      if(y + 1 > height / block.getBlockWidth()) return false;
      
      blockPos pos = new blockPos(x, y);
      
      println(isEmpty(pos));
      if(!isEmpty(pos))
      {
        return false;
      }
    }
    
    return true;
  }
  
  public boolean isEmpty(blockPos pos)
  {
    for(shape s : shapes)
    {
      for(block b : s.getBlocks())
      {
        if(b.getPos().equals(pos))
        {
          return false;
        }
      }
    }
    
    return true;
  }
}
