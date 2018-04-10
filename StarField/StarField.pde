Star[] stars = new Star[800];
float speed;

void settings(){
  size(1080,1920);
}
void setup(){
  for(int i = 0; i< stars.length; i++){
    stars[i]= new Star();
  }
}
void draw(){
  speed = 15;
  background(0);
  translate(width/2,height/2);
  
  for(int i = 0; i< stars.length; i++){
    stars[i].update();
    stars[i].show();
  }
  
}
