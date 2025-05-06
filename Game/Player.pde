class Player
{
  PImage[] images;
  int x, y, speedX = 5, speedY = 5;
  boolean upPressed = false, downPressed = false, leftPressed = false, rightPressed = false;
  int direction = 4;
  int lives = 3; // Add lives to the player
  int score;
  boolean isInvincible = false; // To prevent continuous damage
  int invincibilityTimer = 0; // To track invincibility duration

  Player(int x, int y)
  {
    this.x = x;
    this.y = y;
    images = new PImage[5];
    images[0] = loadImage("player_up.png");
    images[1] = loadImage("player_down.png");
    images[2] = loadImage("player_left.png");
    images[3] = loadImage("player_right.png");
    images[4] = loadImage("player.png");
  }

  void display()
  {
    // Display the image corresponding to the current direction
    imageMode(CENTER);
    image(images[direction], x, y, 100, 100); // Resized to 100x100
  }

  void move()
  {
    if (keyPressed) {
      if (upPressed) {
        y -= speedY;
        direction = 0; // Up
      } else if (downPressed) {
        y += speedY;
        direction = 1; // Down
      } else if (leftPressed) {
        x -= speedX;
        direction = 2; // Left
      } else if (rightPressed) {
        x += speedX;
        direction = 3; // Right
      }
    } else {
      // No keys are pressed; set to standing image
      direction = 4;
    }
  }

  // Add a method to check collision with a zombie
  boolean checkCollision(Obstacle zombie)
  {
    float distance = dist(x, y, zombie.x, zombie.y);
    return distance < 50;
  }

  // Method to handle getting hit
  void getHit()
  {
    if (!isInvincible)
    {
      lives--; //lose lives by subtracting one
      print("Player hit! Remaining lives: " + lives + "\n");

      // Implement invincibility after being hit
      isInvincible = true;
      invincibilityTimer = 60; // 1 second of invincibility (60 frames at 60 FPS)
    }
  }

  void update()
  {
    move();
    displayLives();
    displayScore();
    display();

    // Manage invincibility timer
    if (isInvincible) 
    {
      invincibilityTimer--;
      if (invincibilityTimer <= 0) 
      {
        isInvincible = false;
      }
    }
  }

  void displayLives()
  {
    textSize(20);
    fill(255);
    text("Lives: " + lives, 50, 30);
  }

  void displayScore()
  {
    textSize(20);
    fill(255);
    text("Score: " + score, 50, 60);
  }
}
