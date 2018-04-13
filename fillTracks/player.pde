class player extends block
{
  ArrayList<FACING> connected = new ArrayList<FACING>();
  
  player(PVector pos, int w)
  {
    super(pos, w);
  }
  
  void render()
  {
    stroke(20, 20, 70);
    strokeWeight(1);
    
    fill(40, 40, 90);
    rect(pos.x * w, pos.y * w, w, w);
    
    float dw = w / 3;
    float dx = w / 2 - dw / 2;
    
    fill(255, 255, 255);
    stroke(255, 255, 255);
    if(connected.size() > 1)
    {
      rect(pos.x * w + dx, pos.y * w + dx, dw, dw);
    }
    else
    {
      rect(pos.x * w + dx - 2, pos.y * w + dx - 2, dw + 4, dw + 4);
    }
    
    if(connected.contains(FACING.UP))
    {
      rect(pos.x * w + dx, pos.y * w, dw, w - dx - dw);
    }
    
    if(connected.contains(FACING.DOWN))
    {
      rect(pos.x * w + dx, pos.y * w + dx + dw, dw, w - dw - dx);
    }
    
    if(connected.contains(FACING.RIGHT))
    {
      rect(pos.x * w + dx + dw, pos.y * w + dx, w - dw - dx, dw);
    }
    
    if(connected.contains(FACING.LEFT))
    {
      rect(pos.x * w, pos.y * w + dx, w - dw - dx, dw);
    }
  }
  
  void connect(FACING f)
  {
    for(FACING ft : connected)
    {
      if(ft == f)
      {
        return;
      }
    }
    
    connected.add(f);
  }
}
