game game;

void setup()
{
  size(400, 400);
  
  game = new game(5, 5);
  
  game.load();
}

void draw()
{
  game.render();
}

void mousePressed()
{
  game.mousePressed();
}
