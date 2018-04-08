enum move 
{
  UP, 
  DOWN, 
  LEFT, 
  RIGHT
}

class block
{
  PVector pos;
  int w;
  int dx;
  int dy;
  PImage image = null;
  int id;
  int anm;
  move fAnm;

  block(PVector pos, int w, int id, PImage image)
  {
    this.pos = pos;
    this.w = w;
    this.id = id;
    this.image = image;
    anm = 0;
    fAnm = null;
    dx = 0;
    dy = 0;
  }

  block(PVector pos, int w, int id)
  {
    this.pos = pos;
    this.w = w;
    this.id = id;
    this.image = null;
    anm = 0;
    fAnm = null;
    dx = 0;
    dy = 0;
  }

  void setup()
  {
    if(image == null)
    {
      PGraphics img = createGraphics(w, w);
      img.beginDraw();
      
      img.fill(0, 0, 0);
      img.textSize(w / 3);
      img.text(id, w / 2, w / 2);
      
      img.endDraw();
      
      image = img;
    }
  }

  void render()
  {  
    if(fAnm != null)
    {
      switch(fAnm)
      {
        case UP:
        {
          dy = -(w / anm);
        }
        break;
        
        case DOWN:
        {
          dy = w / anm;
        }
        break;
        
        case LEFT:
        {
          dx = -(w / anm);
        }
        break;
        
        case RIGHT:
        {
          dx = w / anm;
        }
        break;
      }
      
      anm--;
      
      if(anm == 1)
      { 
        
        anm = 1;
        if(fAnm == move.LEFT || fAnm == move.RIGHT)
        {
          pos.add((dx > 0 ? 1 : -1), 0);
        }
        
        if(fAnm == move.UP || fAnm == move.DOWN)
        {
          pos.add(0, (dy > 0 ? 1 : -1));
        }
        dx = 0;
        dy = 0;
        game.canMove = true;
        fAnm = null;
      }
    }
    
    stroke(0);
    strokeWeight(0.1);
    
    fill(0);
    rect(pos.x * w + dx, pos.y * w + dy, w, w);
    
    fill(255, 255, 255);
    rect(pos.x * w + 1 + dx, pos.y * w + 1 + dy, w - 2, w - 2);
    
    if(image != null)
    {
      image(image, pos.x * w + 1.5 + dx, pos.y * w + 1.5 + dy, w - 4, w - 4);
    }
  }
  
  void move(move m, int n)
  {
    if(fAnm == null)
    {
      fAnm = m;
      anm = n;
    }
  }
  
  void setPos(PVector pos)
  {
    this.pos = pos;
  }

  boolean isOver()
  {
    return (mouseX > pos.x * w && mouseX < pos.x * w + w && mouseY > pos.y * w && mouseY < w * pos.y + w);
  }
}
