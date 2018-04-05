ArrayList<Rect> grid;
Rect base;
void settings(){
 size(800,800);
}
void setup(){
  grid = new ArrayList();
  base = new Rect(0,0,10);
  grid = base.fillGrid();
  
}
void draw(){
 background(0);
 
 for(Rect r: grid){
   r.show();
 }
 
 grid = base.nextFrame();
 
 
}
