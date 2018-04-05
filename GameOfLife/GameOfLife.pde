ArrayList<Rect> grid;
Rect base;
void settings(){
 size(800,800);
}
void setup(){
  frameRate(10);
  grid = new ArrayList();
  base = new Rect(0,0,50);
  grid = base.fillGrid();
  
}
void mouseClicked(){
  grid = base.fillGrid();
}
void draw(){
 background(0);
 for(Rect r: grid){
   r.show();
 }
 
 grid = base.nextFrame();
 
 
}
