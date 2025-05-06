class Background
{
  PImage bg;

  Background()
  {
  }

  void load()
  {
    bg = loadImage("bg.jpg"); // Load the image after setup
    if (bg != null) {
      bg.resize(1600, 1600); // the background image here resized to fit
    }
  }

  void display()
  {
    if (bg != null)
    {
      image(bg, 0, 0);
    }
  }
}
