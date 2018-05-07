class tetris
{
  private grid grid;
  private final blockPos[] shape_L = 
  {
    new blockPos(0, 0),
    new blockPos(0, 1),
    new blockPos(0, 2),
    new blockPos(1, 2)
  };
  
  public tetris(grid grid)
  {
    this.grid = grid;
  }
  
  public void render()
  {
    grid.render();
  }
  
  public void add()
  {
    grid.add(new shape(2, 2, getShape(SHAPES.shape_L)));
  }
  
  public void keyPressed(int code)
  {
    grid.setMove(code == LEFT, code == RIGHT);
  }
  
  public blockPos[] getShape(SHAPES s)
  {
    switch(s)
    {
      case shape_L: return shape_L;
    }
    
    return null;
  }
}

public enum SHAPES 
{
  shape_L,
  shape_J,
  shape_I,
  shape_O,
  shape_Z,
  shape_T,
  shape_S
}
