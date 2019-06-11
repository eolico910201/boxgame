cub first=new cub();
level back=new level();

void setup()
{
  first.build();
  size(300,600);
  back.seting();
}
void draw()
{
  background(255);
  box();
  fill(0);
  if (keyPressed)
  {
    if((key== 's'||key== 'S')&&!first.check_y()) 
    {
      for(int i=0;i<4;i++)
      {
        first.xy[1][i]+=30;
      }
    }
    else if((key== 'A'||key== 'a')&&!first.check_x()) 
    {
      for(int i=0;i<4;i++)
      {
        first.xy[0][i]-=30;
      }
    }
    else if((key== 'd'||key== 'D')&&!first.check_x()) 
    {
      for(int i=0;i<4;i++)
      {
        first.xy[0][i]+=30;
      }
    }
  }
  first.appear();
  back.appear();
  if(first.check_lv()||first.check_y())
  {
    first.stay();
    first.build();
  }
  else 
  {
    first.drop();
  }
}

void box()
{
  for(int i=1;i<10;i++)
  {
    line(i*30,0,i*30,600);
  }
  for(int i=1;i<20;i++)
  {
    line(0,i*30,300,i*30);
  }
}

class cub
{
  int[][] xy=new int[2][4];
  void build()
  {
    int num=floor(random(1,1));
    if(num==1)
    {
      xy[0][0]=120; xy[1][0]=0;
      xy[0][1]=150; xy[1][1]=0;
      xy[0][2]=120; xy[1][2]=30;
      xy[0][3]=150; xy[1][3]=30;
    }
  }
  void appear()
  {
    fill(0);
    for(int i=0;i<4;i++)
    {
      rect(xy[0][i],xy[1][i],30,30);
    }
  }
  void drop()
  {
    for(int i=0;i<4;i++)
    {
      xy[1][i]+=30;
    }
    delay(100);
  }
  void stay()
  {
    for(int i=0;i<4;i++)
    {
      back.xy[xy[0][i]/30][xy[1][i]/30]=true;
    }
  }
  boolean check_x()
  {
    for(int i=0;i<4;i++)
    {
      if(xy[0][i]==0||xy[0][i]==270)
        return true;
    }
    return false;
  }
  boolean check_y()
  {
    for(int i=0;i<4;i++)
    {
      if(xy[1][i]==570)
        return true;
    }
    return false;
  }
  boolean check_lv()
  {
    for(int i=0;i<4;i++)
    {
      if(back.xy[xy[0][i]/30][xy[1][i]/30])
        return true;
    }
    return false;
  }
  
}
class level
{
  boolean[][] xy=new boolean[10][20];
  void seting()
  {
    for(int i=0;i<10;i++)
    {
      for(int j=0;j<20;j++)
      {
        xy[i][j]=false;
      }
    }
  }
  void appear()
  {
    for(int i=0;i<10;i++)
    {
      for(int j=0;j<20;j++)
      {
        if(xy[i][j])
        {
          rect(i*30,j*30,30,30);
        }
      }
    }
  }
}
