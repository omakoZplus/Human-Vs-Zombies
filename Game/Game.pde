// Enum for game states
enum GameState 
{
  PLAYING, GAME_OVER, WON, RETRY
}

Player player1;
Background background1;
ArrayList<Obstacle> zombies = new ArrayList<>();
ArrayList<Bullet> bullets = new ArrayList<>();
Obstacle spawnController;
SplashScreen splashScreen;

// Current game state
GameState gameState = GameState.PLAYING;

void setup() {
  size(800, 800);
  initializeGame(); //Save time to initialize your game by putting it there
}

void initializeGame() 
{
  player1 = new Player(width / 2, height / 2);
  background1 = new Background();
  background1.load();
  spawnController = new Zombie(width / 2, height / 2);
  splashScreen = new SplashScreen(5000);
  zombies.clear();
  bullets.clear();

  for (int i = 0; i < (int) random(1, 10); i++) 
  {
    Zombie zombie = new Zombie((int) random(width), (int) random(height));
    Zombie2 zombie2 = new Zombie2((int) random(width), (int) random(height));
    zombies.add(zombie);
    zombies.add(zombie2);
  }

  gameState = GameState.PLAYING;
}

void draw() //Using enum saves time when it comes to using procedures to the case to display and break after that
{
  if (!splashScreen.isFinished()) {
    splashScreen.display();
  } else {
    switch (gameState) 
    {
      case PLAYING:
        playGame();
        break;

      case GAME_OVER:
        displayGameOver();
        break;

      case WON:
        displayWinScreen();
        break;

      case RETRY:
        initializeGame(); //Starts the game again
        break;
    }
  }
}

void playGame() 
{
  background(0);
  background1.display();

  player1.update();

  if (spawnController.shouldSpawn())
  {
    int zombieCount = (int) random(5, 11);
    for (int i = 0; i < zombieCount; i++) {
      if (random(1) > 0.5) {
        Zombie zombie = new Zombie((int) random(width), (int) random(height));
        zombies.add(zombie);
      } else {
        Zombie2 zombie2 = new Zombie2((int) random(width), (int) random(height));
        zombies.add(zombie2);
      }
    }
  }

  for (int i = bullets.size() - 1; i >= 0; i--) 
  {
    Bullet b = bullets.get(i);
    b.update();

    for (int j = zombies.size() - 1; j >= 0; j--) {
      Obstacle zombie = zombies.get(j);
      if (dist(b.x, b.y, zombie.x, zombie.y) < 50 && b.isActive) {
        if (zombie instanceof Zombie2) {
          player1.score += 200;
        } else if (zombie instanceof Zombie) {
          player1.score += 100;
        }
        zombies.remove(j);
        b.isActive = false;
        break;
      }
    }

    if (!b.isActive) 
    {
      bullets.remove(i);
    }
  }

  for (Obstacle zombie : zombies)
  {
    zombie.update();
    zombie.display();
    if (player1.checkCollision(zombie)) {
      player1.getHit();
    }
  }

  if (player1.lives <= 0) {
    gameState = GameState.GAME_OVER;
  }

  if (player1.score >= 100000) {
    gameState = GameState.WON;
  }
}

void displayGameOver() 
{
  background(255, 0, 0);
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text("GAME OVER!", width / 2, height / 2);
  textSize(20);
  text("Your score is: " + player1.score, width / 2, height / 2 + 50);
  textSize(30);
  text("Press R to Retry", width / 2, height / 2 + 100);
}

void displayWinScreen() 
{
  background(0);
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text("YOU WON THE GAME CONGRATS", width / 2, height / 2);
  textSize(20);
  text("Your score is: " + player1.score, width / 2, height / 2 + 50);
  textSize(30);
  text("Press R to Retry", width / 2, height / 2 + 100);
}

void keyPressed() {
  if (keyCode == UP) {
    player1.upPressed = true;
  } else if (keyCode == DOWN) {
    player1.downPressed = true;
  } else if (keyCode == LEFT) {
    player1.leftPressed = true;
  } else if (keyCode == RIGHT) {
    player1.rightPressed = true;
  } else if (key == ' ') 
  {
    float angle = 0;
    if (player1.direction == 0) {
      angle = -PI / 2;
    } else if (player1.direction == 1) {
      angle = PI / 2;
    } else if (player1.direction == 2) {
      angle = PI;
    } else if (player1.direction == 3) {
      angle = 0;
    }
    Bullet bullet = new Bullet(player1.x, player1.y, angle);
    bullets.add(bullet);
  } 
  else if (key == 'R' || key == 'r') {
    if (gameState == GameState.GAME_OVER || gameState == GameState.WON)
    {
      gameState = GameState.RETRY;
    }
  }
}

void keyReleased()
{
  if (keyCode == UP) {
    player1.upPressed = false;
  } else if (keyCode == DOWN) {
    player1.downPressed = false;
  } else if (keyCode == LEFT) {
    player1.leftPressed = false;
  } else if (keyCode == RIGHT) {
    player1.rightPressed = false;
  }
}
