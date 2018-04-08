enum FACING 
{
  UP, 
  RIGHT, 
  DOWN, 
  LEFT
};

class block
{
  int x;
  int y;
  int w;
  boolean isFill = false;
  boolean isStatic = false;
  boolean isObstacle = false;
  ArrayList<FACING> connected = new ArrayList<FACING>();
  
  block(int x, int y, int w)
  {
    this.x = x;
    this.y = y;
    this.w = w;
  }
  
  void render()
  {
    stroke(255);
    strokeWeight(0.1);
    
    if(isFill)
    {
      fill(40, 40, 90);
      rect(x * w, y * w, w, w);
      
      float dw = w / 3;
      
      fill(255, 255, 255);
      if(connected.size() < 2 || !isStatic)
      {
        stroke(255);
        rect(x * w + dw - 2, y * w + dw - 2, w - dw * 2 + 4, w - dw * 2 + 4);
      }
      
      if(connected.contains(FACING.UP))
      {
        stroke(255);
        rect(x * w + dw, y * w, w - dw * 2, dw * 2);
      }
      
      if(connected.contains(FACING.DOWN))
      {
        stroke(255);
        rect(x * w + dw, y * w + dw, w - dw * 2, w - dw);
      }
      
      if(connected.contains(FACING.RIGHT))
      {
        stroke(255);
        rect(x * w + dw, y * w + dw, w - dw, w - dw * 2);
      }
      
      if(connected.contains(FACING.LEFT))
      {
        stroke(255);
        rect(x * w, y * w + dw, w - dw, w - dw * 2);
      }
    }
    else if(isObstacle)
    {
      fill(30, 60, 110);
      rect(x * w, y * w, w, w);
    }
    else
    {
      fill(200, 100, 50);
      rect(x * w, y * w, w, w);
    }
  }
  
  void setObstacle(boolean b)
  {
    if(!isFill)
    {
      isObstacle = b;
    }
  }
  
  void setFill(boolean f)
  {
    if(!isObstacle)
    {
      isFill = f;
    }
  }
  
  void setStatic(boolean s)
  {
    isStatic = s;
  }
  
  void connect(FACING f)
  {
    for(FACING ft : connected)
    {
      if(f == ft)
      {
        return;
      }
    }
    
    connected.add(f);
  }
}
