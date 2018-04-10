int [][]grid;
int cols;
int rows;
int resolution = 20;
int time;
void settings(){
  size(width,height);
}
void setup(){
  frameRate(10);
  cols = width/resolution;
  rows = height/resolution;
  grid = new int[cols][rows];
  reset();
}

void draw() {
  background(0);
  for(int i = 0; i<cols; i++){
    for(int j = 0; j<rows; j++){
     
      int w = width;
      int x = i*resolution;
      int y = j*resolution;

       if(grid[i][j] == 1){
         fill(255);
         //stroke(255);
         rect(x,y,resolution,resolution);
      }  
    }
  }
  
  int[][]next = new int[cols][rows];
  
  for(int i = 0; i<cols; i++){
    for(int j = 0; j<rows; j++){
    
       
      
       int neighbors = countNeighbors(grid,i,j);
       int state = grid[i][j];
       
       if(state == 0 && neighbors == 3){
         next[i][j] = 1;
       }else if(state == 1 && (neighbors < 2 || neighbors > 3)){
         next[i][j] = 0;
       }
       else{
         next[i][j] = state;
       }

      
    }
  }
  
  grid = next;
  
}
int countNeighbors(int[][]grid,int x,int y){
  int sum = 0;
  for(int i = -1; i<2; i++){
    for(int j = -1; j<2; j++){
      
      int c = (x+i+cols)%cols;
      int r = (y+j+rows)%rows;
      
      sum += grid[c][r];
    }
  }
  sum-=grid[x][y];
  return sum;
}


void mousePressed(){
  if(hasFinished()){
    reset();
  }
}
void reset(){
  for(int i = 0; i<cols; i++){
    for(int j = 0; j<rows; j++){
       grid[i][j] = floor(random(2)); 
    }
  }
}
boolean click = false;
boolean hasFinished() {
    
    if (click){  
        if (millis() < time + 200)
        {
          click = false;
          return true;
        }
        else{click=false; return false;}
       
    }
    else{time = millis(); click=true;return false;}
}
