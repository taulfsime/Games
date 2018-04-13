enum FACING 
{
  UP, 
  RIGHT, 
  DOWN, 
  LEFT
};

class block
{
  PVector pos;
  int w;
  boolean isStatic = false;
  
  block(PVector pos, int w)
  {
    this.pos = pos;
    this.w = w;
  }
  
  void render()
  {
    stroke(10, 30, 80);
    strokeWeight(1);
    fill(10, 30, 80);
    rect(pos.x * w, pos.y * w, w, w);
  }
  
  void setStatic(boolean s)
  {
    isStatic = s;
  }
  
  void connect(FACING f){}
}
