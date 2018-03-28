abstract class object
{
  int x;
  int y;
  boolean hasCollision = true;
  boolean isFrozen = false;
  
  object(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  abstract void render();
  abstract void logic();
  abstract void keyClicked();
}

class pos
{
  int x;
  int y;
  
  pos(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void setPos(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  pos getPos()
  {
    return this;
  }
}
