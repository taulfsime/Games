tetris game;

void settings()
{
  size(600, 750);
}

void setup()
{
  game = new tetris(new grid(10, 12));
  game.add();
}

void draw()
{
  background(115, 115, 115);
  game.render();
}

void keyPressed()
{
  if(key == ' ')
  {
    game.add();
  }
  else if(key == 'r')
  {
    setup();
  }
  
  game.keyPressed(keyCode);
}

//color1 = 176 176 176
//color2 = 0 255 1
//color3 = 0 0 254
//color4 = 205 255 0
//color5 = 44 255 246
//color5 = 254 0 0
//color6 = 255 125 213
