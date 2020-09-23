import java.util.Arrays;
import java.util.Collections;
import java.util.List;


class Bullet {
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
double distance;
double sped=1;

  Bullet(double xStart,double yStart,double xEnd,double yEnd ) {
    
    xPos = xStart;
    yPos = yStart;
    xSTART = xStart;
    ySTART = yStart;
    xEND = xEnd;
    yEND = yEnd;
    rise= yEnd-yStart;
    run = xEnd- xStart;
    List<Point> a = bls(new Point(xSTART,ySTART),new Point(xEND,yEND),new Point(xSTART,ySTART),100.0);
    rise=(double)(yStart-a.get(0).y);
        run=(double)(xStart-a.get(0).x);


}
  void display() {
    
    //e62939
    //a6e1ff
    //176082
    fill(#125634);

    ellipse((float) xPos,(float) yPos,(float) 25,25);
    
  }
  void update() {
    xPos+=run/2*sped;
    yPos+=rise/2*sped;
  }
  
  
  
  List<Point> bls(Point pointA,
            Point pointB, Point center, double radius) {
        double baX = pointB.x - pointA.x;
        double baY = pointB.y - pointA.y;
        double caX = center.x - pointA.x;
        double caY = center.y - pointA.y;

        double a = baX * baX + baY * baY;
        double bBy2 = baX * caX + baY * caY;
        double c = caX * caX + caY * caY - radius * radius;

        double pBy2 = bBy2 / a;
        double q = c / a;

        double disc = pBy2 * pBy2 - q;
        if (disc < 0) {
            return Collections.emptyList();
        }
        // if disc == 0 ... dealt with later
        double tmpSqrt = Math.sqrt(disc);
        double abScalingFactor1 = -pBy2 + tmpSqrt;
        double abScalingFactor2 = -pBy2 - tmpSqrt;

        Point p1 = new Point(pointA.x - baX * abScalingFactor1, pointA.y
                - baY * abScalingFactor1);
        if (disc == 0) { // abScalingFactor1 == abScalingFactor2
            return Collections.singletonList(p1);
        }
        Point p2 = new Point(pointA.x - baX * abScalingFactor2, pointA.y
                - baY * abScalingFactor2);
        return Arrays.asList(p1, p2);
    
  
}

  boolean contact(Nongamer f) {
    double b= Math.sqrt(((f.xPos-this.xPos)*(f.xPos-this.xPos))+((f.yPos-this.yPos)*(f.yPos-this.yPos)));
if(b<=75) {
  
 return true; 
}
return false;
    
  }

 boolean contact(Boss f) {
    double b= Math.sqrt(((f.xPos-this.xPos)*(f.xPos-this.xPos))+((f.yPos-this.yPos)*(f.yPos-this.yPos)));
if(b<=125) {
  
 return true; 
}
return false;
    
  }



}
