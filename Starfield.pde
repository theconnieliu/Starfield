Particle[] particles; 
void setup()
{
  size(700,700);
  particles = new Particle[500];
  for(int i = 50; i < particles.length; i++)
  {
    particles[i] = new NormalParticle();
  }
  for(int i = 0; i < 40; i++)
  {
    particles[i] = new Oddball();
  }
  for(int i = 40; i <50; i++)
  {
    particles[i] = new Jumbo(); 
  }
}
void draw()
{
  background(0);
  for(int j = 0; j < particles.length; j++)
  {
    particles[j].move();
    particles[j].show();
  }   
}

class NormalParticle implements Particle
{
  int myColor;
  double myX, myY, dSpeed, dDirection;
  NormalParticle()
  {
    myX = width/2;
    myY = height/2;
    dDirection = (Math.random()*2*Math.PI);
    dSpeed = Math.random()*11;
  }
  void move()
  {    
    myX = myX + Math.cos(dDirection)*dSpeed;
    myY = myY + Math.sin(dDirection)*dSpeed;
  }
  void show()
  {
    noStroke();
    fill(random(255), random(255), random(255));
    ellipse((float)myX, (float)myY, 3, 3);
  }
}
interface Particle
{
  public void show();
  public void move();
}
class Oddball implements Particle//uses an interface
{
  int myColor, dSpeed, dDirection;
  double myX, myY;
  Oddball()
  {
    myX = width/2;
    myY = height/2;
    dDirection = (int)(Math.random()*2*Math.PI);
    dSpeed = (int)(Math.random()*8);
  }
  public void move()
  {    
    myX = myX + Math.cos(dDirection)*dSpeed;
    myY = myY + Math.sin(dDirection)*dSpeed;
  }
  public void show()
  {
    noStroke();
    fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    ellipse((float)myX, (float)myY, 10, 10);
  }
}
class Jumbo extends NormalParticle //uses inheritance
{
  void show()
  {
    noStroke();
    fill(random(255));
    ellipse((float)myX, (float)myY, 20, 20);
  }
}