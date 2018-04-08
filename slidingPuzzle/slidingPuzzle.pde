game game;
int n = 0;
int[] level = {3, 5, 8, 10};

void setup()
{
  size(400, 400);
  
  surface.setTitle("Sliding Puzzle by taulfsime");
  
  int l = level[n];
  game = new game(l);
  
  game.setup();
  game.randomize();
}

void draw()
{
  background(200, 200, 200);
  game.render();
}

void mousePressed()
{
  game.mousePressed();
}

void keyPressed()
{  
  if(keyCode == UP)
  {
    if(n >= level.length - 1)
    {
      n = 0;
    }
    else
    {
      n++;
    }
    
    setup();
  }
  else if(keyCode == DOWN)
  {
    if(n < 1)
    {
      n = level.length - 1;
    }
    else
    {
      n--;
    }
    setup();
  }
}
