class blockPos
{
  private int x;
  private int y;
  
  public blockPos(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  public int getX()
  {
    return x;
  }
  
  public int getY()
  {
    return y;
  }
  
  public void setX(int x)
  {
    this.x = x;
  }
  
  public void setY(int y)
  {
    this.y = y;
  }
  
  public void add(blockPos p)
  {
    this.x += p.getX();
    this.y += p.getY();
  }
  
  public boolean equals(blockPos p)
  {
    return (p.getX() == this.getX() && 
            p.getY() == this.getY());
  }
  
  public String toString()
  {
    return " -> " + getX() + ", " + getY();
  }
}
