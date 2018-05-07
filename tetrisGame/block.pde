class block
{
  private blockPos pos;
  private static final int blockWidth = 50;
  private color blockColor;
  
  public block(blockPos pos, color c)
  {
    this.pos = pos;
    this.blockColor = c;
  }
  
  
  public void render()
  {
    tint(255, 255);
    strokeWeight(1);
    stroke(0);
    fill(blockColor);
    rect(pos.x * blockWidth, pos.y * blockWidth, blockWidth, blockWidth);
  }
  
  public void update(blockPos vel)
  {
    pos.add(vel);
  }
  
  public blockPos getPos()
  {
    return pos;
  }
  
  public int getBlockWidth()
  {
    return blockWidth;
  }
}
