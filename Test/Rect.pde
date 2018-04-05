class Rect{
  boolean alive;
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
    
   for(int i = 0;i<width/l;i++){
     for(int j = 0;j<width/l;j++){
       
       Rect r = new Rect(i*10,j*10,l); 
       current.add(r);
       
     }
   }
   return current;
  }
  
  ArrayList<Rect> nextFrame(){
    next = new ArrayList<Rect>();
    for(int i = 0;i<width/l;i++){
     for(int j = 0;j<width/l;j++){
       for(Rect r:current){
          r = changeAlive(r);
          next.add(r);
       }
     }
   }
   
    return next;
  }
  
  Rect changeAlive(Rect r){
    int count = 0;
      for(int i = 0;i<width/l;i++){
       for(int j = 0;j<width/l;j++){
         print(i+j*10);
         
         int up = ((j*10)-1);
         int down = ((j*10)+1);
         int left = (i-1);
         int right = i+1;
         
         boolean passi,passj;
         if(i>=0 && i<= width/l){passi=false;}else{passi=true;}
         if(j>=0 && j<= height/l){passj=false;}else{passj=true;}
         
         
         if(passj && current.get(i+up).alive){count++;} //up
         if(passj && current.get(i+down).alive){count++;} //down
         if(passi && current.get(left+j).alive){count++;}//left
         if(passi && current.get(right+j).alive){count++;}//right
         if(passi && passj && current.get(left+up).alive){count++;}//ul
         if(passi && passj && current.get(right+up).alive){count++;}//ur
         if(passi && passj && current.get(left+ down).alive){count++;}//dl
         if(passi && passj && current.get(right + down).alive){count++;}//dr
       }
     }
     if(r.alive && (count > 3 || count < 2)){
       r.alive=false;
     }else if(!r.alive && count==3){
       r.alive=true;
     }
    
    
    Rect nr = new Rect(0,0,0);
    return nr;
  }

}
