import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class AsteroidsGame extends PApplet {

SpaceShip rebecca= new SpaceShip();
Stars[] manyStars = new Stars[40];
Asteroids[] cluster=new Asteroids[20];

  public void setup() 
  {
    size(500,500);
    background(0);
    for(int i=0;i<manyStars.length;i++)
    {
      manyStars[i]= new Stars();
    }
    for(int i=0;i<cluster.length;i++)
    {
      cluster[i]=new Asteroids();
    }
  }
  public void draw() 
  {
    background(0);
    rebecca.show();
    rebecca.move();
    for(int i=0;i<manyStars.length;i++)
    {
      manyStars[i].show();
    }
    for(int i=0;i<cluster.length;i++)
    {
      cluster[i].show();
      cluster[i].move();
    }
    
  }
   public void keyPressed()
      {
        if(keyCode==UP)
        {
         rebecca.accelerate(.1f);
       }
       if(keyCode==DOWN)
       {
        rebecca.accelerate(-.1f);
       }
       if(keyCode==RIGHT)
       {
       rebecca.rotate(5);
       }
       if(keyCode==LEFT)
       {
        rebecca.rotate(-5);
       }
       if(key==' ')
       {
        rebecca.setX((int)(Math.random()*500));
        rebecca.setY((int)(Math.random()*500));
        rebecca.setPointDirection((int)(Math.random()*360));
       }
   }
   
  class SpaceShip extends Floater  
  {   
      public SpaceShip()
      {
        corners=4;
        xCorners= new int[corners];
        yCorners= new int[corners];
        xCorners[0] = -8;
        yCorners[0] = -8;
        xCorners[1] = 16;
        yCorners[1] = 0;
        xCorners[2] = -8;
        yCorners[2] = 8;
        xCorners[3] = -2;
        yCorners[3] = 0;
        myColor=color(255,255,255);
        myCenterX=250;
        myCenterY=250;
        myDirectionX=0;
        myDirectionY=0;
        myPointDirection=270;
        myColor=color(255,0,0);
      }
      public void setX(int x){myCenterX=x;}
      public int getX(){return (int)myCenterX;}
      public void setY(int y){myCenterY=y;}
      public int getY(){return (int)myCenterY;}
      public void setDirectionX(double x){myDirectionX=x;}
      public double getDirectionX(){return myDirectionX;}
      public void setDirectionY(double y){myDirectionY=y;}
      public double getDirectionY(){return myDirectionY;}
      public void setPointDirection(int degrees){myPointDirection=degrees;}
      public double getPointDirection(){return myPointDirection;}   
 }

 class Stars
 {
  private int myX;
  private int myY;
  private int size;
  private int myColor;
  public Stars()
  {
    myX=(int)(Math.random()*500);
    myY=(int)(Math.random()*500);
    size=5;
    myColor=color(255,255,255);
  }
  public void show()
  {
    fill(myColor);
    ellipse(myX,myY,size,size);
    
  }
 }

 class Asteroids extends Floater
 {
  private int rotSpeed;
  public Asteroids()
  {
    rotSpeed=5;
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = 7;
    yCorners[1] = -8;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 0;
    myCenterX=(int)(Math.random()*500);
    myCenterY=(int)(Math.random()*500);
    myDirectionX=(int)(Math.random()*3-2);
    myDirectionY=(int)(Math.random()*3-2);
    myPointDirection=(int)(Math.random()*360);
    myColor=color(255,255,255);
  }
  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX=x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection=degrees;}
  public double getPointDirection(){return myPointDirection;} 
  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }

 }

  abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
  {   
    protected int corners;  //the number of corners, a triangular floater has 3   
    protected int[] xCorners;   
    protected int[] yCorners;   
    protected int myColor;   
    protected double myCenterX, myCenterY; //holds center coordinates   
    protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
    protected double myPointDirection; //holds current direction the ship is pointing in degrees    
    abstract public void setX(int x);  
    abstract public int getX();   
    abstract public void setY(int y);   
    abstract public int getY();   
    abstract public void setDirectionX(double x);   
    abstract public double getDirectionX();   
    abstract public void setDirectionY(double y);   
    abstract public double getDirectionY();   
    abstract public void setPointDirection(int degrees);   
    abstract public double getPointDirection(); 
    
    //Accelerates the floater in the direction it is pointing (myPointDirection)   
    public void accelerate (double dAmount)   
    {          
      //convert the current direction the floater is pointing to radians    
      double dRadians =myPointDirection*(Math.PI/180);     
      //change coordinates of direction of travel    
      myDirectionX += ((dAmount) * Math.cos(dRadians));    
      myDirectionY += ((dAmount) * Math.sin(dRadians));       
    }   
    public void rotate (int nDegreesOfRotation)   
    {     
      //rotates the floater by a given number of degrees    
      myPointDirection+=nDegreesOfRotation;   
    }   
    public void move ()   //move the floater in the current direction of travel
    {      
      //change the x and y coordinates by myDirectionX and myDirectionY       
      myCenterX += myDirectionX;    
      myCenterY += myDirectionY;     

      //wrap around screen    
      if(myCenterX >width)
      {     
        myCenterX = 0;    
      }    
      else if (myCenterX<0)
      {     
        myCenterX = width;    
      }    
      if(myCenterY >height)
      {    
        myCenterY = 0;    
      }   
      else if (myCenterY < 0)
      {     
        myCenterY = height;    
      }   
    }   
    public void show ()  //Draws the floater at the current position  
    {             
      fill(myColor);   
      stroke(myColor);    
      //convert degrees to radians for sin and cos         
      double dRadians = myPointDirection*(Math.PI/180);                 
      int xRotatedTranslated, yRotatedTranslated;    
      beginShape();         
      for(int nI = 0; nI < corners; nI++)    
      {     
        //rotate and translate the coordinates of the floater using current direction 
        xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
        yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
        vertex(xRotatedTranslated,yRotatedTranslated);    
      }   
      endShape(CLOSE);  
    }   
  } 

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "AsteroidsGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
