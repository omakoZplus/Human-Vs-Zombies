abstract class Obstacle
{
  // Data members:
  public int x, y;
  public int speedX = 1, speedY = 10; // Initial speeds
  public color colour;
  public PImage images; // To store enemy images

  // timer for spawning zombies
  int lastSpawnTime = 0; 
  int spawnInterval = (int) random(5000, 10000); // Random interval between 10–20 seconds

  // Constructor:
  
  Obstacle()
  {
    this.x = 0;
    this.y = 0;
  }
  
  Obstacle(int x)
  {
    this.x = x;
  }
  
  Obstacle(int x, int y)
  {
    this.x = x;
    this.y = y;
  }

  abstract void display();

  void move() 
  {
    // Increase the speed for a more challenging enemy
    speedX = (int) random(-5, 6); 
    speedY = (int) random(-5, 6); 

    x += speedX; 
    y += speedY;  

    // Check for boundary collisions and reverse direction if necessary
    if (x >= width || x <= 0) 
    {
      speedX *= -1;
    }
    if (y >= height || y <= 0)
    {
      speedY *= -1;
    }
  }
  
    // Static method to check if a zombie should spawn
  boolean shouldSpawn() {
    if (millis() - lastSpawnTime >= spawnInterval) //uses millis for how many seconds the milliseconds for the zombie appear.
    {
      lastSpawnTime = millis(); // Reset timer
      spawnInterval = (int) random(5000, 10000); // New random interval
      return true;
    }
    return false;
  }

  void update() 
  { 
    display();
    move();
  }
}
