class menu
{
  int c;
  ArrayList<menuButton> buttons;
  
  menu(int c)
  {
    this.c = c;
    buttons = new ArrayList<menuButton>(c);
  }
  
  void render()
  {
    
  }
  
  void setOptions(menuButton b)
  {
    buttons.add(b);
  }
}

class menuButton
{
  int x;
  int y;
  String text;
  menuClick click;
  PFont font = loadFont("fillTracks-Font.vlw");
  
  menuButton(String text, menuClick click, int x, int y)
  {
    this.text = text;
    this.x = x;
    this.y = y;
    this.click = click;
  }
  
  void render()
  {
    textFont(font);
    fill(200, 140, 100);
    textSize(48);
    textMode();
    text(text, x, y);
  }
}

interface menuClick
{
  void click();
}
