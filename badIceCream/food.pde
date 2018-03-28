class food extends object
{
  food(int x, int y)
  {
    super(x, y);
    hasCollision = false;
  }
  
  void logic(){}
  void render(){}
  void keyClicked(){}
}

class foodBanana extends food
{
  foodBanana(int x, int y)
  {
    super(x, y);
  }
  
  void render()
  {
    if(isFrozen)
    {
      tint(255, 150);
    }
    else
    {
      tint(255, 255);
    }
    image(drawFood(foodTypes.BANANA), x*grid, y*grid, grid, grid);
  }
}
