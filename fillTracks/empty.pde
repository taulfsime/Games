class empty extends block
{
  empty(PVector pos, int w)
  {
    super(pos, w);
  }
  
  void render()
  {
    strokeWeight(1);
    stroke(180, 80, 30);
    fill(200, 100, 50);
    rect(pos.x * w, pos.y * w, w, w);
  }
}
