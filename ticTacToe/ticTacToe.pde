game game;

void setup()
{
  game = new game();
  size(500, 500);
  
  game.setup();
}

void draw()
{
  game.draw();
}

void mousePressed()
{
  game.mouseClicked();
}
