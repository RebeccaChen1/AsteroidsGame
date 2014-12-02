SpaceShip rebecca= new SpaceShip(); 
Stars[] manyStars = new Stars[40];
ArrayList <Bullet> lotsOfBullets=new ArrayList <Bullet>();
ArrayList <Asteroids> cluster;
boolean gameOver;



  public void setup() 
  {
    gameOver=false;
    size(500,500);
    background(0);
    noStroke();
    for(int i=0;i<manyStars.length;i++)
    {
      manyStars[i]= new Stars();
    }
    cluster= new ArrayList <Asteroids>();
    for(int i=0;i<20;i++)
    {
      cluster.add(new Asteroids());
    }
    
    
  }
  public void draw() 
  {
    background(0);
    if(gameOver==true)
    {
      for(int i=0;i<cluster.size();i++)
      {
        cluster.get(i).setDirectionX(0);
        cluster.get(i).setDirectionY(0);
        rebecca.setDirectionX(0);
        rebecca.setDirectionY(0);
        textSize(30);
        textAlign(CENTER);
        text("Game Over", 250, 250);
      }
    }
    rebecca.show();
    rebecca.move();
    for(int i=0;i<manyStars.length;i++)
    {
      manyStars[i].show();
    }
    for(int i=0;i<lotsOfBullets.size();i++)
    {
      lotsOfBullets.get(i).show();
      lotsOfBullets.get(i).move();
    }
   
    for(int i=0;i<cluster.size();i++)
    {

      if(dist(cluster.get(i).getX(),cluster.get(i).getY(),rebecca.getX(),rebecca.getY())<20)
      {
        cluster.remove(i);
        gameOver=true;
      }
      else 
      {
      cluster.get(i).show();
      cluster.get(i).move();
    }
    }
    for(int j=0;j<cluster.size();j++)
    {
    for(int i=0;i<lotsOfBullets.size();i++)
    {
      if(dist(cluster.get(j).getX(),cluster.get(j).getY(),lotsOfBullets.get(i).getX(),lotsOfBullets.get(i).getY())<20)
      {
        cluster.remove(j);
        lotsOfBullets.remove(i);
        cluster.add(new Asteroids());
      }
    }
    }
    
  }
   public void keyPressed()
      {
        if(key=='r')
        {
          gameOver=false;
        }
        if(keyCode==UP)
        {
         rebecca.accelerate(.1);
       }
       if(keyCode==DOWN)
       {
        rebecca.accelerate(-.1);
       }
       if(keyCode==RIGHT)
       {
       rebecca.rotate(5);
       }
       if(keyCode==LEFT)
       {
        rebecca.rotate(-5);
       }
       if(key=='h')
       {
        rebecca.setX((int)(Math.random()*500));
        rebecca.setY((int)(Math.random()*500));
        rebecca.setPointDirection((int)(Math.random()*360));
       }
       if(key==' ')
       {
         lotsOfBullets.add(new Bullet(rebecca));
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

 class Bullet extends Floater
 {
  private int myColor;
  private double dRadians;
  public Bullet(SpaceShip theShip)
  {
    myCenterX=theShip.getX();
    myCenterY=theShip.getY();
    myPointDirection=theShip.getPointDirection();
    dRadians =myPointDirection*(Math.PI/180);
    myDirectionX=3*Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY=3*Math.sin(dRadians) + theShip.getDirectionY();
    myColor=color(0,255,0);
  }
  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse((int)myCenterX,(int)myCenterY,10,10);

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
   
    if(Math.random()<.5)
    {
      rotSpeed=2;
    }
    else 
    {
      rotSpeed=-2;      
    }
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
    if(Math.random()>.5)
    {
      myDirectionX=1;
    }
    else
    {
      myDirectionX=-1;    
    }
    if(Math.random()>.5)
    {
      myDirectionY=1;
    }
    else
    {
      myDirectionY=-1;
    }
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

