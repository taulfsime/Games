class obstacle extends block
{  
  obstacle()
  {
    hasCollision = true;
  }
  
  void render(){}
  void logic(){}
}

class obstacleIce extends obstacle
{
  obstacleIce()
  {
    this.canBreak = true;
  }
  
  void render()
  {
    tint(255, 255);
    image(drawObstacle(obstacleTypes.ICE), system.getPos(this).x * grid, system.getPos(this).y * grid, grid, grid);
  }
}
