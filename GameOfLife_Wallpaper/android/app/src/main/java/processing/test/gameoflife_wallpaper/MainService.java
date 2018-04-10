package processing.test.gameoflife_wallpaper;
        
import processing.android.PWallpaper;
import processing.core.PApplet;
        
public class MainService extends PWallpaper {  
  @Override
  public PApplet createSketch() {
    PApplet sketch = new GameOfLife_Wallpaper();
    
    return sketch;
  }
}
