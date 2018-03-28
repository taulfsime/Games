class system
{
  int w;
  int h;
  
  block[][] map;
  ArrayList<object> entities = new ArrayList<object>();
  
  ArrayList<object> removeEntities = new ArrayList<object>();
  ArrayList<object> addEntities = new ArrayList<object>();
  
  system()
  {
    w = width/grid;
    h = height/grid;
    
    map = new block[w][h];
        
    for(int a = 0; a < h; a++)
    {
      for(int q = 0; q < w; q++)
      {
        map[q][a] = new air();
      }
    }
  }
  
  void registerObject(object o)
  {
    addEntities.add(o);
  }
  
  void unregisterObject(object o)
  {
    removeEntities.add(o);
  }
  
  object getObject(int x, int y)
  {
    for(object o : entities)
    {
      if(o.x == x && o.y == y)
      {
        return o;
      }
    }
    
    return null;
  }
  
  block getBlock(int x, int y)
  {
    if(x < 0 || x > w - 1 || y < 0 || y > h - 1)
    {
      return null;
    }
    
    return map[x][y];
  }
  
  void setBlock(block b, int x, int y)
  {
    map[x][y] = b;
  }
  
  pos getPos(block o)
  {
    for(int a = 0; a < h; a++)
    {
      for(int q = 0; q < w; q++)
      {
        if(o.equals(map[q][a]))
        {
          return new pos(q, a);
        }
      }
    }
    
    return null;
  }
  
  void setPos(pos newPos, block cO, block o)
  {
    for(int a = 0; a < h; a++)
    {
      for(int q = 0; q < w; q++)
      {
        if(cO.equals(map[q][a]))
        {
          map[getPos(cO).x][getPos(cO).y] = o;
          map[newPos.x][newPos.y] = cO;
          
          return;
        }
      }
    }
  }
  
  void debig()
  {
    for(int a = 0; a < h; a++)
    {
      for(int q = 0; q < w; q++)
      {
        print(getBlock(q, a) instanceof obstacle ? '@' : ' ');
      }
      println();
    }
  }
  
  ArrayList<facing> getMove(int x, int y)
  {
    ArrayList<facing> r = new ArrayList<facing>();
            
    if(x > 0 && !(getBlock(x - 1, y) instanceof obstacle))  //!getBlock(o.x - 1, o.y).hasCollision) 
    {
      r.add(facing.LEFT);
    }
    
    if(x < this.w - 1 && !(getBlock(x + 1, y) instanceof obstacle))  //!getBlock(o.x + 1, o.y).hasCollision)
    {
      r.add(facing.RIGHT);
    }
    
    if(y > 0 && !(getBlock(x, y - 1) instanceof obstacle))  //!getBlock(o.x, o.y - 1).hasCollision)
    {
      r.add(facing.UP);
    }
    
    if(y < this.h - 1 && !(getBlock(x, y + 1) instanceof obstacle))  //!getBlock(o.x, o.y + 1).hasCollision)
    {
      r.add(facing.DOWN);
    }
    
    return r;
  }
  
  void render()
  {
    for(int a = 0; a < h; a++)
    {
      for(int q = 0; q < w; q++)
      {
        map[q][a].logic();
        map[q][a].render();
      }
    }
    
    if(addEntities.size() > 0)
    {
      for(object o : addEntities)
      {
        entities.add(o);
      }
      
      addEntities.clear();
    }
    
    if(removeEntities.size() > 0)
    {
      for(object o : removeEntities)
      {
        entities.remove(o);
      }
      
      removeEntities.clear();
    }
    
    for(object o : entities)
    {
      o.logic();
      o.render();
    }
  }
  
  void keyClicked()
  {
    for(object o : entities)
    {
      o.keyClicked();
    }
  }
  
  void loadMap(String name)
  {
    JSONArray lmap = loadJSONArray("data/levels/" + name + "/map.json");
    JSONArray lentity = loadJSONArray("data/levels/" + name + "/entity.json");
    
    for(int a = 0; a < lmap.size(); a++)
    {
      JSONObject o = lmap.getJSONObject(a);
      
      switch(o.getString("block"))
      {
        case "obstacle":
        {
          switch(o.getString("type"))
          {
            case "ice":
            {
              setBlock(new obstacleIce(), o.getInt("posX"), o.getInt("posY"));
            }
            break;
          }
        }
        break;
      }
    }
    
    for(int a = 0; a < lentity.size(); a++)
    {
      JSONObject o = lentity.getJSONObject(a);
      
      switch(o.getString("object"))
      {
        case "player":
        {
          switch(o.getString("type"))
          {
            case "brown":
            {
              registerObject(new player(o.getInt("posX"), o.getInt("posY"), playerTypes.BROWN));
            }
            break;
          }
        }
        break;
        
        case "food":
        {
          switch(o.getString("type"))
          {
            case "banana":
            {
              registerObject(new foodBanana(o.getInt("posX"), o.getInt("posY")));
            }
            break;
          }
        }
        break;
        
        case "enemy":
        {
          switch(o.getString("type"))
          {
            case "first":
            {              
              registerObject(new enemyFirst(o.getInt("posX"), o.getInt("posY")));
            }
            break;
          }
        }
        break;
      }
    }
  }
}
