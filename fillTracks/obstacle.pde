class obstacle extends block
{
  obstacle(PVector pos, int w)
  {
    super(pos, w);
  }
  
  void render()
  {
    strokeWeight(1);
    stroke(10, 40, 90);
    fill(30, 60, 110);
    rect(pos.x * w, pos.y * w, w, w);
  }
}
