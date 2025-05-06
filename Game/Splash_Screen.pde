class SplashScreen //Added as a class to save time
{
  private int duration; // Duration of splash screen in milliseconds
  private int startTime; // Start time of the splash screen
  
  SplashScreen(int duration) 
  {
    this.duration = duration; //5 seconds
    this.startTime = millis(); //Good to use when it comes to start time of the splash screen
  }
  
  void display() 
  {
    background(0, 255, 0); // Blue background
    fill(2, 48, 38); // dark green text
    textSize(50);
    textAlign(CENTER);
    text("WELCOME TO HUMAN VS ZOMBIES", width / 2, height / 2 - 50);
    textSize(30);
    text("Score 100000 to win the game, or lose", width / 2, height / 2 + 30);
    textSize(20);
    text("Zombie 1 = 100 Score each, Zombie 2 = 200 Score each", width / 2, height / 2 + 90);
    textSize(20);
    text("Made by Omith (24824608)", width / 2 + 150, height / 2 + 350);
  }
  
  boolean isFinished() 
  {
    return millis() - startTime > duration; //Good to make the duration of the start time work
  }
}
