game game;

void settings()
{
  size(600, 600);
}

void setup()
{
  game = new game();
}

void draw()
{
  game.render();
}

void keyPressed()
{
  game.keyPress(keyCode);
}

/*
 * 0 - empty 
 * 1 - map
 * 2 - obstacle
 * 3 - start point
*/
