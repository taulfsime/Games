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
 * 0 - block 
 * 1 - empty
 * 2 - obstacle
 * 5 - logic
 * 4 - start point
*/
