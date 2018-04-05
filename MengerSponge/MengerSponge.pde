float a = 0;
ArrayList<Box> sponge;
Box box;


void settings(){
  size(400,400,P3D);
}
void setup(){
  box = new Box(0,0,0,200);
  sponge = new ArrayList<Box>();
  sponge.add(box);
  
}
void draw(){
  background(51);
  
  translate(width/2,height/2);
  lights();
  rotateX(a);
  rotateY(a*0.5);
  rotateZ(a*0.3);
  
  
  for(Box b: sponge){
    b.show();
  }
 
  a+= 0.01;
 }
 void mousePressed(){
   ArrayList<Box> next = new ArrayList<Box>();
   
   for(Box b : sponge){
     ArrayList<Box> newBoxes = b.generate();
     next.addAll(newBoxes);
   }
   sponge = next;
 }
