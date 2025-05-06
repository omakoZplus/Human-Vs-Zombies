// Bullet Class
class Bullet {
  int x, y;
  int speed = 10; // Speed of the bullet
  float angle; // Direction of the bullet
  boolean isActive = true; // Checks if the bullet is active

  Bullet(int x, int y, float angle)
  {
    this.x = x;
    this.y = y;
    this.angle = angle;
  }

  void move() {
    // Move the bullet in the direction of its angle, it does quite make sense adding this as a example.

    x += speed * cos(angle); //add x + speed times cos angle
    y += speed * sin(angle); //add y + speed times sin angle

    // Deactivate the bullet if it goes out of bounds using false boolean
    if (x < 0 || x > width || y < 0 || y > height)
    {
      isActive = false;
    }
  }

  void display() //Is active = true
  {
    if (isActive)
    {
      fill(0); // Black bullet for this.
      rect(x, y, 10, 10); // Draw the bullet as a rect
    }
  }


  void update() //It checks when it is active is used when adding function methods here to update and add isActive to check True
  {
    if (isActive)
    {
      move();
      display();
    }
  }
}
