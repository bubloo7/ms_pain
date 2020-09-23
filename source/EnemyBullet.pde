import java.util.Arrays;
import java.util.Collections;
import java.util.List;


class EnemyBullet {
double xSTART;
double ySTART;
double xEND;
double yEND;
double xPos;
double yPos;
double rise;
double run;
double xRate;
double yRate;
double xPAIN;
double yPain;
double s;
double slope;
double dx;
double dy;
  EnemyBullet(double xStart,double yStart,double xEnd,double yEnd,int lvl) {
    
    xPos = xStart;
    yPos = yStart;
    xSTART = xStart;
    ySTART = yStart;
    xEND = xEnd;
    yEND = yEnd;
    rise= yEnd-yStart;
    run = xEnd- xStart;
    s=lvl*2+5;
 //   List<Point> a = bls(new Point(xSTART,ySTART),new Point(xEND,yEND),new Point(xSTART,ySTART),100.0);
       
/*

     rise= yPos-charY;
     run= xPos-charX;
     slope = rise/run;
     dx=Math.sqrt((distance*distance)/((slope*slope)+1));
     dy=dx*slope;
     
*/
     slope=rise/run;
     dx=Math.sqrt((s*s)/((slope*slope)+1));
     dy=dx*slope;


}
  void dsiplay() {
        fill(#ff00fb);

    ellipse((float) xPos,(float) yPos,(float) 25,25);
    
  }
  void update() {
    
    if(xEND<xSTART){     
    xPos-=dx;
    yPos-=dy;
    }
    else {
      xPos+=dx;
    yPos+=dy;
      
      
      
    }

}
  boolean contact(Characters h) {
 /* if(Math.abs(h.x-xPos)<25) return true;
    if(Math.abs(h.y-yPos)<25) return true;

  
 return false; */
double b= Math.sqrt(((h.x-xPos)*(h.x-xPos))+((h.y-yPos)*(h.y-yPos)));
if(b<=75) {
  
 return true; 
}
return false;

} ////////// end contact

  
  




}
