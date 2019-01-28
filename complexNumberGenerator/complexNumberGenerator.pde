import gohai.simpletweet.*;
import java.math.*;
SimpleTweet simpletweet;

double round(double value, int places) {
  if (places < 0) throw new IllegalArgumentException();

  BigDecimal bd = new BigDecimal(value);
  bd = bd.setScale(places, RoundingMode.HALF_UP);
  return bd.doubleValue();
}

int getHourInSeconds() {
  return hour()*3600+minute()*60+second();
}

boolean isTheTenthMinute() {
  return minute()%10==0;
}

boolean isTheTirthyFirstSecond() {
  return second()%31==0;
}
long count = 0;
long angleS = 0;
void setup() {
  size(800, 800);
  frameRate(1);
  simpletweet = new SimpleTweet(this);

  simpletweet.setOAuthConsumerKey("8Htu2FxcNcg2DlzMYTksa3WF6");
  simpletweet.setOAuthConsumerSecret("tqGeHPv8sk6IfLqV7b2kHAFGp9ZdiQLPOTVF5uh80lWYN1vK7J");
  simpletweet.setOAuthAccessToken("735237998-MhzepvvH1UY587w1QlnesaM6NYqRP3rIBBK9qxQj");
  simpletweet.setOAuthAccessTokenSecret("OqeIHCqgfXM7anFLolZgU4RNN8eAtqInEuUlsyTX4BFmf");
}

void draw() {
  //background(204,102,255);
  background(255);
  noStroke();
  fill(200, 150, 20);

  stroke(200f);
  for (int i=0; i<=50; i++) {
    line(0, 16*i, width,16*i);
    line(16*i, 0, 16*i, height);
  }
  stroke(0);
  line(0,height/2, width, height/2);
  line(width/2, 0, width/2, height);
  textSize(24);
  fill(0);
  text("imaginary axis",width/2+5,25);
  text("real axis", width-100,height/2+20);
  int xCoord = 16*floor(random(1,50)), yCoord = 16*floor(random(1,50));

  fill(0);
  line(width/2,height/2,xCoord,yCoord);
  fill(255,0,0);
  ellipse(xCoord,yCoord,20,20);
  noFill();
  float magnitude = sqrt(pow(xCoord-width/2,2)+pow(yCoord-height/2,2));
  float yLen = (height/2-yCoord)/16;
  float xLen = (xCoord-width/2)/16;
  float angle = (yCoord>width/2?360+180/PI*atan2(yLen,xLen):180/PI*atan2(yLen,xLen));
  
  angleS+=angle;
  print("x: "+xLen+" y: "+yLen+" angle: ");
  print(angle+" count: "+count+++" angle avg: "+angleS/count+"\n");
  
  if(xCoord<width/2&&yCoord<height/2)
    arc(width/2,height/2,magnitude,magnitude,PI,PI+PI-angle*PI/180);
  else if(xCoord>width/2&&yCoord<height/2)
    arc(width/2,height/2,magnitude,magnitude,2*PI-angle*PI/180,2*PI);
  else if(xCoord>width/2&&yCoord>height/2)
    arc(width/2,height/2,magnitude,magnitude,0,2*PI-angle*PI/180);
  else if(xCoord<width/2&&yCoord>height/2)
    arc(width/2,height/2,magnitude,magnitude,2*PI-angle*PI/180,PI);
 
}
