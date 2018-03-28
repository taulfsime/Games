abstract class block
{
  boolean canBreak = false;
  boolean hasCollision = true;
  
  abstract void logic();
  abstract void render();
}

class air extends block
{
  air()
  {
    hasCollision = false;
  }
  
  void logic(){}
  void render()
  {
    //image(loadImage("textures/map.png"), system.getPos(this).x*grid, system.getPos(this).y*grid, grid, grid);
  }
}
