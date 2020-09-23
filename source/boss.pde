import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import java.math.BigDecimal;

class Boss {
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
  boolean spawned=true;
  int spawnCountdown=180;
  int ap;
  int crash=1;
  BigDecimal xaim;
  BigDecimal yaim;
  double xaim2;
  double yaim2;
  int shoot=0;
  int shoot2=0;
  boolean firstcheck=true;
  boolean secondcheck=false;

  boolean firstcheck2=false;
  boolean secondcheck2=true;
  boolean idunnowhyineedthis= false;

  int charge =3;
  int chargeCooldown = 120;
  int shots =0;
  int shotsCooldown = 0;
  double playerX;
  double playerY;
  double playerX2;
  double playerY2;
  boolean upright=false;
  boolean downright=false;
  boolean upleft=false;
  boolean downleft=false;
  boolean moving=false;


  double slopeside;
  double aside;
  double bside;
  double cside;
  double sidedistance;
  double s1x;
  double s1y;
  double s2x;
  double s2y;
  double apDuration=600;

  boolean todacenter=true;
  int toDacenter=120;
  int halfWidth= 1920/2;
  int halfHeight= 1080/2;

  double chargeToX;
  double chargeToY;
  boolean targetAcquired=false;
  boolean corner=false;
  boolean shootOn=false;
  int shotsLeft;
  boolean outOfCorner=true;
  int cycles;

  Boss(int tt, int ll) {
    t = tt;
    l=ll;


    xS= 1920/2 +1;
    yS= 250;



    // xS=random(0,1920);
    // yS=random(0,1080);

    //  xS=200;
    //  yS=1080-200;

    xPos = xS;
    yPos = yS;
    distance = 6;
    //  hp=(ll*3)+1+(0);
    hp=2000*ll;
    ap=0;
  }

  void update(double charX, double charY) {           ////////                            start of update
    playerX2=charX;
    playerY2=charY;

    if (spawnCountdown<=-1) {

      if (ap==0) {     // start of ap0

        distance=6;

        if (Math.abs(xPos - 1920/2)>=10||Math.abs(yPos - 1080/2)>=10) {

          rise= yPos-1080/2;
          run= xPos-1920/2;
          slope = rise/run;
          dx=Math.sqrt((distance*distance)/((slope*slope)+1));
          dy=dx*slope;


          if (xPos>halfWidth&&yPos>halfHeight) {
            xPos-=Math.abs(dx);
            yPos-=Math.abs(dy);
          }
          if (xPos<halfWidth&&yPos>halfHeight) {
            xPos+=Math.abs(dx);
            yPos-=Math.abs(dy);
          }
          if (xPos<halfWidth&&yPos<halfHeight) {
            xPos+=Math.abs(dx);
            yPos+=Math.abs(dy);
          }
          if (xPos>halfWidth&&yPos<halfHeight) {
            xPos-=Math.abs(dx);
            yPos+=Math.abs(dy);
          }

          xaim= new BigDecimal("1000");
        } ///                end moving to da center


        else { // start of shooty shooty

          eB.add(new EnemyBullet(xPos, yPos, xPos-(((xaim.divide(new BigDecimal("1000"))).remainder(new BigDecimal("2"))).subtract(new BigDecimal("1"))).doubleValue(), yPos-Math.sqrt(1-Math.pow((((xaim.divide(new BigDecimal(1000))).remainder(new BigDecimal("2"))).subtract(new BigDecimal("1"))).doubleValue(), 2)), 10));  

          eB.add(new EnemyBullet(xPos, yPos, xPos+(((xaim.divide(new BigDecimal("1000"))).remainder(new BigDecimal("2"))).subtract(new BigDecimal("1"))).doubleValue(), yPos+Math.sqrt(1-Math.pow((((xaim.divide(new BigDecimal(1000))).remainder(new BigDecimal("2"))).subtract(new BigDecimal("1"))).doubleValue(), 2)), 10));  

          if (shoot<=0) { 
            eB.add(new EnemyBullet(xPos, yPos, random(0, 1920), random(0, 1080), 1));  
            shoot=10;
          }

          xaim=xaim.add(new BigDecimal("10"));
          apDuration--;
        } // end of shooty shooty

        shoot--;
        if (apDuration<=0) {
          ap=1;
          toDacenter=120;
          targetAcquired=false;
          cycles=2;
        }
      } // end of ap0


      if (ap==1) {
        System.out.println("shots left: " + shotsLeft + " cycles: " + cycles);
        if(toDacenter>0) {  // go up a little
        
        yPos-=2;
        toDacenter--;
        } // stop going up
        
        else { // is in the center, time to start charge/shooty
            if(targetAcquired==false) { //find where to charge to
               targetAcquired=true;
               chargeToX=playerX2;
               chargeToY=playerY2;
               
               distance=60;
               rise= yPos-chargeToY;
               run= xPos-chargeToX;
               slope = rise/run;
               dx=Math.abs(Math.sqrt((distance*distance)/((slope*slope)+1)));
               dy=Math.abs(dx*slope); 
               
                   if (xPos<chargeToX&&yPos<chargeToY) {
                    upleft=false;
                    upright=false;
                    downleft=false;
                    downright=false;
                    
                    upleft=true;
                    moving=true;
                    System.out.println("upleft");
                  }

                  if (xPos>chargeToX&&yPos<chargeToY) {
                    upleft=false;
                    upright=false;
                    downleft=false;
                    downright=false;
                    
                    upright=true;
                    moving=true;
                    System.out.println("upright");
                  }
                   if (xPos>chargeToX&&yPos>chargeToY) {
                    upleft=false;
                    upright=false;
                    downleft=false;
                    downright=false;
                    
                    downleft=true;
                    moving=true;
                    System.out.println("downleft");
                  }
                   if (xPos<chargeToX&&yPos>chargeToY) {
                    upleft=false;
                    upright=false;
                    downleft=false;
                    downright=false;
                    
                    downright=true;
                    moving=true;
                    System.out.println("downright");
                  }
              

                 
            
              }
            else {  //target has been acquired, time to charge
               if(upright) {       
                  xPos-=Math.abs(dx);
                  yPos+=Math.abs(dy); 

               }
               
               if(upleft) {
                   xPos+=Math.abs(dx);
                  yPos+=Math.abs(dy);

               }
               
               if(downleft) {
                  xPos-=Math.abs(dx);
                  yPos-=Math.abs(dy);

                 
               }
               
               if(downright) {
                  xPos+=Math.abs(dx);
                  yPos-=dy; 
               }
               if(!(xPos<=100||xPos>1920-100||yPos<=100||yPos>1080-100)) {
               outOfCorner=true;
               }
               if(outOfCorner&&(xPos<=100||xPos>1920-100||yPos<=100||yPos>1080-100)) {
                  downright=false;
                  downleft=false;
                  upleft=false;
                  upright=false;
                  outOfCorner=false;
                  corner=true;
                  shootOn=true;
                  shoot2=30;
                  shotsLeft=4;
                
               }
               // super sus
                if(((xPos<=100&&xPos>1920-100)||(yPos<=100&&yPos>1080-100)||(xPos<=100&&yPos<=100)||(xPos<=100&&yPos>1080-100)||(yPos<=100&&xPos>1920-100)||(yPos>1080-100&&xPos>1920-100))&&!idunnowhyineedthis) {
                  downright=false;
                  downleft=false;
                  upleft=false;
                  upright=false;
                  outOfCorner=false;
                  corner=true;
                  shootOn=true;
                  shoot2=30;
                  shotsLeft=4;
             //crash=0;
             idunnowhyineedthis=true;
             }
               
               
            } // end of charging
          if(shootOn) {
                          shoot2--;
                              System.out.println("shoot2: " + shoot2);
              if(shotsLeft>=0) {
                if(shoot2<=0) {
                              crash=crash/crash;
                    slopeside= (playerX2-xPos)/(yPos-playerY2);
                      shoot2=40;
                    sidedistance=150;
                    shotsLeft--;
                    
                    if(shotsLeft>0){
                    aside= slopeside*slopeside+1;
                    bside= -2*playerX2 - (2*playerX2)*(slopeside*slopeside);
                    cside= -sidedistance*sidedistance + playerX2*playerX2 + slopeside*slopeside*playerX2*playerX2;

                    s1x= (-bside + Math.sqrt(bside*bside - 4*aside*cside))/(2*aside);

                    s1y = slopeside*(s1x-playerX2) + playerY2;

                    s2x = (-bside - Math.sqrt(bside*bside - 4*aside*cside))/(2*aside);

                    s2y = slopeside*(s2x-playerX2) + playerY2;
                    // ellipse((float)s1x,(float)s1y,20,20);

                    eB.add(new EnemyBullet(xPos, yPos, playerX2, playerY2, 15));

//                    ellipse((float)s1x, (float)s1y, 20, 20);
  //                  ellipse((float)s2x, (float)s2y, 20, 20);

                    eB.add(new EnemyBullet(xPos, yPos, s1x, s1y, 15));
                    eB.add(new EnemyBullet(xPos, yPos, s2x, s2y, 15));

                    slopeside= (playerX2-xPos)/(yPos-playerY2);

                    sidedistance=300;

                    aside= slopeside*slopeside+1;
                    bside= -2*playerX2 - (2*playerX2)*(slopeside*slopeside);
                    cside= -sidedistance*sidedistance + playerX2*playerX2 + slopeside*slopeside*playerX2*playerX2;

                    s1x= (-bside + Math.sqrt(bside*bside - 4*aside*cside))/(2*aside);

                    s1y = slopeside*(s1x-playerX2) + playerY2;

                    s2x = (-bside - Math.sqrt(bside*bside - 4*aside*cside))/(2*aside);

                    s2y = slopeside*(s2x-playerX2) + playerY2;
                    // ellipse((float)s1x,(float)s1y,20,20);

                    ellipse((float)s1x, (float)s1y, 20, 20);
                    ellipse((float)s2x, (float)s2y, 20, 20);

                    eB.add(new EnemyBullet(xPos, yPos, s1x, s1y, 15));
                    eB.add(new EnemyBullet(xPos, yPos, s2x, s2y, 15));
                }
                  if(shotsLeft==-1) {
               
                    if(cycles>0) {
                    targetAcquired=false;
                    upleft=false;
                    upright=false;
                    downleft=false;
                    downright=false; 
                    cycles--;
                    idunnowhyineedthis=false;
                    }
                    else {
                      targetAcquired=false;
                    upleft=false;
                    upright=false;
                    downleft=false;
                    downright=false; 
                    cycles--;
                     apDuration=600; 
                      ap=0;
                    }
              }
            
            
                } // end of shooty invincibility frame thing
              }
              
              
          
          } // end of shooting
         } //  time to stop charge/shooty
        
      
    } // end of ap1
    
  

} else    spawnCountdown--;



    for (int k=0; k<eB.size(); k++) {             
      eB.get(k).update();
      eB.get(k).dsiplay();
    }
  }// end update







  void display() {


    if (spawned==true) {

      ellipseMode(RADIUS);
      if (ap==0) {
        fill(#b8021a);
        ellipse((float) xPos, (float) yPos, (float) 100, 100);  
        textAlign(CENTER);
        fill(#000000);
        textSize(80);

        text(Integer.toString(hp), (float) xPos, (float) yPos+30);
      }
      if (ap==1) {
        
        if(shotsLeft==0&&cycles==0){
           fill(#b8021a);
        ellipse((float) xPos, (float) yPos, (float) 100, 100);  
        textAlign(CENTER);
        fill(#000000);
        textSize(80);

        text(Integer.toString(hp), (float) xPos, (float) yPos+30);
          
        }
        
        
      else  if(shotsLeft>0) {
        
        fill(#fa7541);
        ellipse((float) xPos, (float) yPos, (float) 100, 100);  
        textAlign(CENTER);
        fill(#000000);
        textSize(80);

        text(Integer.toString(hp), (float) xPos, (float) yPos+30);
        }
        
        else {
        
           
             fill(#a742f5);
        ellipse((float) xPos, (float) yPos, (float) 100, 100);  
        textAlign(CENTER);
        fill(#000000);
        textSize(80);

        text(Integer.toString(hp), (float) xPos, (float) yPos+30);
           
          
          
          
          }
    
        }
    }
  } //                                                                                                  display

  boolean contact(Characters h) {
    /* if(Math.abs(h.x-xPos)<25) return true;
     if(Math.abs(h.y-yPos)<25) return true;
     
     
     return false; */
    double b= Math.sqrt(((h.x-xPos)*(h.x-xPos))+((h.y-yPos)*(h.y-yPos)));
    if (b<=150) {

      return true;
    }
    return false;
  }
}
