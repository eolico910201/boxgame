club first=new club();
int[][] a=new int[30][20]; 

void setup()
{
  first.build();
  size(400,600);
  
}
void draw()
{
  background(255);
  box();
  fill(0);
  if (keyPressed)
  {
    if((key== 's'||key== 'S')&&!first.check_D()) 
    {
      for(int i=0;i<4;i++)
      {
        first.y[i]+=20;
      }
    }
    else if((key== 'A'||key== 'a')&&!first.check_L()) 
    {
      for(int i=0;i<4;i++)
      {
        first.x[i]-=20;
      }
    }
    else if((key== 'd'||key== 'D')&&!first.check_R()) 
    {
      for(int i=0;i<4;i++)
      {
        first.x[i]+=20;
      }
    }
  }
  first.appear();
  if(first.check_D())
  {
    first.build();
  }
  else 
  {
    first.drop();
  }
}
void box()
{
  for(int i=1;i<20;i++)
  {
    line(i*20,0,i*20,600);
  }
  for(int i=1;i<30;i++)
  {
    line(0,i*20,400,i*20);
  }
}

class club
{
  int[] x=new int[4];
  int[] y=new int[4];
  void build()
  {
    int num=floor(random(1,1));
    if(num==1)
    {
      x[0]=180; y[0]=0;
      x[1]=200; y[1]=0;
      x[2]=180; y[2]=20;
      x[3]=200; y[3]=20;
    }
  }
  void appear()
  {
    fill(0);
    for(int i=0;i<4;i++)
    {
      rect(x[i],y[i],20,20);
    }
  }
  void drop()
  {
    for(int i=0;i<4;i++)
    {
      y[i]+=20;
    }
    delay(100);
  }
  boolean check_D()
  {
    for(int i=0;i<4;i++)
    {
      if(y[i]==580)
        return true;
    }
    return false;
  }
  boolean check_L()
  {
    for(int i=0;i<4;i++)
    {
      if(x[i]==0)
        return true;
    }
    return false;
  }
  boolean check_R()
  {
    for(int i=0;i<4;i++)
    {
      if(x[i]==380)
        return true;
    }
    return false;
  }
}
