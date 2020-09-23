import java.util.Arrays;
import java.util.Collections;
import java.util.List;



class Nongamer {
  int t;
  int l;
  double xPos;
  double yPos;
  double xS;
  double yS;
  double rise;
  double run;
  double slope;
  double distance;
  double dx;
  double dy;
  int eFrame=0;
  ArrayList<EnemyBullet> eB = new ArrayList<EnemyBullet>();
  boolean alive=true;
  int hp;
  boolean spawned=false;
  int spawnCountdown=60;
  
  
 Nongamer(int tt,int ll) {
   t = tt;
   l=ll;
   xS=random(0,1920);
   yS=random(0,1080);
   xPos = xS;
   yPos = yS;
   distance = 5+(1*ll);
   hp=(ll*3)+1+(0);
//   hp=500;
   
 }
  
   void update(double charX,double charY) {
     if(spawned==true) {
       //if(alive) {
    // List<Point> a = bls(new Point(xPos,yPos),new Point(charX,charY),new Point(charX,charY),100.0);
    //  rise=(double)(yPos-a.get(0).y);
    //  run=(double)(xPos-a.get(0).x);
     rise= yPos-charY;
     run= xPos-charX;
     slope = rise/run;
     dx=Math.sqrt((distance*distance)/((slope*slope)+1));
     dy=dx*slope;
     
     if(t==1) {
     
   
 
 if(xPos>charX&&yPos>charY) {
   xPos-=dx;
   yPos-=dy;
 }
 if(xPos<charX&&yPos>charY) {
   xPos+=dx;
   yPos+=dy;
 }
 if(xPos<charX&&yPos<charY) {
   xPos+=dx;
   yPos+=dy;
 }
 if(xPos>charX&&yPos<charY) {
   xPos-=dx;
   yPos-=dy;
 }
 
 if(dy==0||dx==0) {
      if(charX-xPos==0&&charY-yPos>0) yPos+=distance;
             if(charX-xPos==0&&charY-yPos<0) yPos-=distance;
                if(charX-xPos>0&&charY-yPos==0) xPos+=distance;
                   if(charX-xPos<0&&charY-yPos==0) xPos-=distance;
 }
 
     } // 1
 if(t==2) {
  if(eFrame==120/l||eFrame<0) {  
  eFrame=0; 
    
  if(alive) eB.add(new EnemyBullet(xPos,yPos,charX,charY,l));
  
}
   else eFrame++;
   for(int i=0;i<eB.size();i++) {
    eB.get(i).update();
    eB.get(i).dsiplay(); 
   } 
 
 
 }
 
 
       //}
     } 
 }// end update
   
 
   
 
 
 
    
void display() {
  
  
  if(spawned==true) {
  
  ellipseMode(RADIUS);
 if(t==1) {
  fill(#a742f5);
    ellipse((float) xPos, (float) yPos, (float) 50,50);  
    textAlign(CENTER);
  fill(#000000);
  textSize(64);

  text(Integer.toString(hp), (float) xPos, (float) yPos+20); 
 }
  if(t==2) {
  fill(#fa7541);
    ellipse((float) xPos, (float) yPos, (float) 50,50);  
    textAlign(CENTER);
  fill(#000000);
  textSize(64);

  text(Integer.toString(hp), (float) xPos, (float) yPos+20); 
 }
  }
  
  else {
   if(spawnCountdown<=0) {
       eFrame=-1000; 

     spawned=true; 

   }
    else {
      
      fill(#8c0b10);
    ellipse((float) xPos, (float) yPos, (float) 50,50);
    spawnCountdown--;
    }
    
  }
  
  
} //                                                                                                  display

boolean contact(Characters h) {
 /* if(Math.abs(h.x-xPos)<25) return true;
    if(Math.abs(h.y-yPos)<25) return true;

  
 return false; */
double b= Math.sqrt(((h.x-xPos)*(h.x-xPos))+((h.y-yPos)*(h.y-yPos)));
if(b<=100) {
  
 return true; 
}
return false;

}



  
  

}
  
  
  
   
  
  
