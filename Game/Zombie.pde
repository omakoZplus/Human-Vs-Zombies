class Zombie extends Obstacle
{
  
  Zombie(int x, int y)
  {
    super(x, y);
    // Load all images into the array
    images = loadImage("enemy.png");         // Standing
  }
  
  void display()
  {
     // Display the image corresponding to the current direction
    imageMode(CENTER);
    image(images, x, y, 100, 100);
  }
}  
