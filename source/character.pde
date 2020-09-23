import java.util.Arrays;
import java.util.Collections;
import java.util.List;



class Characters {

  double x= 1920/2;
  double y = 1080/2;
int stepSize = 12;
  
  
  
  //                             da upgrades but here instead

double movementUPc=1;
int maxlifec = 5;
int ultc=1;
double bulletSc=1;
double reloadc=1;
int shieldc=1;
int bulletDc=1;
  



void display() {
 // fill(#123456);
// fill(#2d8dd6);
  ellipseMode(RADIUS);
    ellipse((float) x,(float)  y, 50,50);  
    textAlign(CENTER);
  fill(#000000);
  textSize(64);

  text(":)",(float)  x, (float) (y+20)); 

    
  }
void left() {
      x-=stepSize;
  
}
void right() {
      
 
        x+=stepSize;

}
void up() {
      
          y-=stepSize;

}
void down() {
              y+=stepSize;

  
}



}
