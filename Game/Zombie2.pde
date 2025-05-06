class Zombie2 extends Obstacle
{
  Zombie2(int x, int y)
  {
    super(x, y);
    // Load all images into the array
    images = loadImage("enemy2.png");         // Standing
  }
  
  void display()
  {
     // Display the image corresponding to the current direction
    imageMode(CENTER);
    image(images, x, y, 100, 100);
  }
}
