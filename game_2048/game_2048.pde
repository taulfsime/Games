game game;

void settings()
{
  size(400, 400);
}

void setup()
{
  game = new game(4);
}

void draw()
{
  game.render();
}

void keyTyped()
{ 
  game.keyTyped();
}
