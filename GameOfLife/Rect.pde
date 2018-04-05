class Rect{
  boolean alive = true;
  float l;
  float x;
  float y;
  ArrayList<Rect> current = new ArrayList<Rect>();
  ArrayList<Rect> next = new ArrayList<Rect>();;
  
  Rect(float x_,float y_,float l_){
    x=x_;
    y=y_;
    l=l_;
    if(random(0,1)>0.5){alive=true;}
    else{alive = false;}
  }
  
  void show(){
    pushMatrix();
     rect(x,y,l,l);
     if(alive){fill(255);}
     else{fill(0);}
          
     popMatrix();
     
  }
  
  ArrayList<Rect> fillGrid(){
    next = new ArrayList<Rect>();
    current = new ArrayList<Rect>();
   for(int i = 0;i<width/l;i++){
     for(int j = 0;j<width/l;j++){
       
       Rect r = new Rect(i*l,j*l,l); 
       current.add(r);
       
     }
   }
   return current;
  }
  
  ArrayList<Rect> nextFrame(){
    
    next = new ArrayList<Rect>();
    int c=0;
    for(int i = 0;i<width/l;i++){
     for(int j = 0;j<height/l;j++){
       
         Rect r = current.get(c);
          r = changeAlive(r);
          next.add(r);
          c++;
       
     }
   }
   current = new ArrayList<Rect>();
   current= next;
    return current;
  }
  
  Rect changeAlive(Rect r){
    int count = 0;
     int i = (int)(r.x/l);
     int j = (int)(r.y/l);
     int up = ((j*10)-1);
     int down = ((j*10)+1);
     int left = (i-1);
     int right = i+1;
     boolean passUp = false;
     boolean passDown = false;
     boolean passLeft = false;
     boolean passRight = false;
     boolean passUl = false;
     boolean passUr = false;
     boolean passDl = false;
     boolean passDr = false;
     
     if(j>0){passUp=true;}
     if(j<height){passDown=true;}
     if(i<width){passRight=true;}
     if(i>0){passLeft=true;}
     if(passUp && passLeft){passUl = true;}
     if(passUp && passRight){passUr = true;}
     if(passDown && passLeft){passDl = true;}
     if(passDown && passRight){passDr = true;}
     
     if(passUp){if(current.get(i+up).alive){count++;}} //up
     if(passDown){if(current.get(i+down).alive){count++;}} //down
     if(passLeft){if(current.get(left+j).alive){count++;}}//left
     if(passRight){if(current.get(right+j).alive){count++;}}//right
     if(passUl){if(current.get(left+up).alive){count++;}}//ul
     if(passUr){if(current.get(right+up).alive){count++;}}//ur
     if(passDl){if(current.get(left+ down).alive){count++;}}//dl
     if(passDr){if(current.get(right + down).alive){count++;}}//dr
       
     if(r.alive && (count > 3 || count <= 1)){
       r.alive=false;
     }else if(!r.alive && count==3){
       r.alive=true;
     }
    
    
   
    return r;
  }

}
