class shape
{
  private final int[] COLORS = //new ArrayList<Integer>(7) 
  {
    color(176, 176, 176),
    color(0, 255, 1),
    color(0, 0, 254),
    color(205, 255, 0),
    color(44, 255, 246),
    color(254, 0, 0),
    color(255, 125, 213)
  };
  private ArrayList<block> els;
  
  public shape(int x, int y, blockPos... blocks)
  {
    els = new ArrayList<block>();
    color c = getRandomColor();
    
    for(blockPos b : blocks)
    {
      b.add(new blockPos(x, y));
      block block = new block(b, c);
      els.add(block);
    }
  }
  
  public void update(blockPos vel)
  {
    for(block b : els)
    {
      b.update(vel);
    }
  }
  
  public void render()
  {
    for(block b : els)
    {
      b.render();
    }
  }
  
  public ArrayList<block> getBlocks()
  {
    return els;
  }
  
  private color getRandomColor()
  {
    int random = int(random(COLORS.length + 1));
    
    return color(COLORS[random]);
  }
}
