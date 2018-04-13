class logic extends block
{
  logic(PVector pos, int w)
  {
    super(pos, w);
  }
  
  void render()
  {
    stroke(200, 100, 50);
    strokeWeight(1);
    fill(220, 120, 70);
    rect(pos.x * w, pos.y * w, w, w);
    
    float dw = w * 0.6;
    float dx = w / 2 - dw / 2;
    
    fill(230, 230, 70);
    rect(pos.x * w + dx, pos.y * w + dx, dw, dw);
    
    fill(220, 120, 70);
    
    dx *= 1.5;
    dw = w - dx * 2;
    
    rect(pos.x * w + dx, pos.y * w + dx, dw, dw);
  }
}
