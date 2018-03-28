import processing.net.*;
int sC = 0;

public enum STAGE {GAME, MENU,  CREATELEVEL, SELECTLEVEL, FINISHLEVEL}

final int grid = 54;

Server server;
Client client;
createLevel createLevel;
system system;
STAGE stage;

//TODO: MENU AND DEAD SCREEN

void setup()
{
  size(810, 702);
  
  stage = STAGE.GAME;
  system = new system();
  createLevel = new createLevel();
  
  system.loadMap("levelTest");
}

void draw()
{
  switch(stage)
  {
    case GAME:
    {
      //background(loadImage("textures/testMap.png"));
      background(0);
      system.render();
      surface.setTitle(frameRate + "fps");
    }
    break;
    
    case MENU:
    {
      background(0);
      menu();
    }
    break;
    
    case SELECTLEVEL:
    {
      
    }
    break;
    
    case CREATELEVEL:
    {
      createLevel.render();
    }
    break;
    
    case FINISHLEVEL:
    {
      
    }
    break;
  }
}

void keyPressed()
{
  //if(key == 'q')
  //{
  //  server = new Server(this, 9080);
    
  //  if(server.clientCount != sC)
  //  {
  //    for(object o : system.map)
  //    {
  //      server.write(o.getClass().toString() + "&" + o.x + "&" + o.y);
  //      println(o.getClass().toString() + "&" + o.x + "&" + o.y);
  //    }
      
  //    sC = server.clientCount;
  //  }
  //}
  
  if(key == 'r')
  {
    system.debig();
  }
  createLevel.keyClicked();
  system.keyClicked();
}

void mouseWheel(MouseEvent event)
{
  createLevel.scroll(event.getCount() > 0);
}
