import gohai.simpletweet.*;
import java.math.*;
SimpleTweet simpletweet;

int[] black = {0,0,0};
int[] brown = {150,102,51};
int[] red = {255,0,0};
int[] orange = {255,150,0};
int[] yellow = {255,255,0};
int[] green = {0,255,0};
int[] blue = {0,0,255};
int[] violet = {255,0,255};
int[] grey = {204,204,204};
int[] white = {255,255,255};
int[] gold = {255,215,0};
int[] silver = {192,192,192};
int[] firstDigit = {0,1,2,3,4,5,6,7,8,9};
int[] secondDigit = {0,1,2,3,4,5,6,7,8,9};
int[] thirdDigit = {0,1,2,3,4,5,6,7,8,9};
int[][] digitColours = {black,brown,red,orange,yellow,green,blue,violet,grey,white};
double[] multiplier = {0.01,0.1,1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000};
int[][] multiplierColours = {silver,gold,black,brown,red,orange,yellow,green,blue,violet,grey,white};
double[] tolerance = {10,5,1,2,0.5,0.25,0.1,0.05};
int[][] toleranceColours = {silver,gold,brown,red,green,blue,violet,grey};
int[] temperatureCoefficient = {100,50,15,25};
int[][] temperatureCoefficientColours = {brown,red,orange,yellow};
double resistorValue;
double resistorTolerance;
double tempCoef;
long count = 12;
  
double round(double value, int places){
    if (places < 0) throw new IllegalArgumentException();

    BigDecimal bd = new BigDecimal(value);
    bd = bd.setScale(places, RoundingMode.HALF_UP);
    return bd.doubleValue();
}

int getHourInSeconds(){
  return hour()*3600+minute()*60+second();
}

boolean isTheTenthMinute(){
  return minute()%10==0;
}

boolean isTheTirthyFirstSecond(){
  return second()%31==0;
}


void setup(){
  size(200, 100);
  frameRate(1);
  simpletweet = new SimpleTweet(this);

  simpletweet.setOAuthConsumerKey("8Htu2FxcNcg2DlzMYTksa3WF6");
  simpletweet.setOAuthConsumerSecret("tqGeHPv8sk6IfLqV7b2kHAFGp9ZdiQLPOTVF5uh80lWYN1vK7J");
  simpletweet.setOAuthAccessToken("735237998-MhzepvvH1UY587w1QlnesaM6NYqRP3rIBBK9qxQj");
  simpletweet.setOAuthAccessTokenSecret("OqeIHCqgfXM7anFLolZgU4RNN8eAtqInEuUlsyTX4BFmf");
}

void draw(){
  background(0,200,220);
  noStroke();
  fill(200,150,20);
  ellipse(width/2-40,height/2,60,60);//left
  ellipse(width/2+40,height/2,60,60);//right
  rect(width/2-25,height/2-25,50,50);//center piece
  stroke(0);
  fill(0,0,00);
  line(width/2+70,height/2,width/2+width,height/2);//rigth
  line(width/2-70,height/2,width/2-width,height/2);//left
  noStroke();
  rectMode(RADIUS);
  int digit1 = round(random(9));
  int digit2 = round(random(9));
  int digit3 = round(random(9));
  int multi = round(random(11));
  int tol = round(random(7));
  int temp = round(random(3));
  
  fill(digitColours[digit1][0],digitColours[digit1][1],digitColours[digit1][2]);//first color
  rect(width/2-40,height/2,6,30,5,5,5,5);
  
  fill(temperatureCoefficientColours[temp][0],temperatureCoefficientColours[temp][1],temperatureCoefficientColours[temp][2]);//sixth color
  rect(width/2+40,height/2,6,30,5,5,5,5);
  
  rectMode(CORNER);
  fill(digitColours[digit2][0],digitColours[digit2][1],digitColours[digit2][2]); //second color
  rect(width/2-20,height/2-25,6,50);
  fill(digitColours[digit3][0],digitColours[digit3][1],digitColours[digit3][2]);//third color
  rect(width/2-10,height/2-25,6,50);
  fill(multiplierColours[multi][0],multiplierColours[digit3][1],multiplierColours[digit3][2]);//fourth color
  rect(width/2,height/2-25,6,50);
  fill(toleranceColours[tol][0],toleranceColours[tol][1],toleranceColours[tol][2]); //fifth color
  rect(width/2+10,height/2-25,6,50);
  resistorValue =10*(digit1*100+digit2*10+digit3)*multiplier[multi];
  resistorTolerance = tolerance[tol];
  tempCoef = temperatureCoefficient[temp];
  
  if(getHourInSeconds()>6*3600&&getHourInSeconds()<24*3600&&isTheTenthMinute()&&isTheTirthyFirstSecond()){
    count++;
    String tweet = simpletweet.tweetImage(get(), 
    "Resistor Value: "+round(resistorValue,2)+
    "Ω\nResistor Tolerance: "+round(resistorTolerance,2)+"%\n"+
    "Resistor Temperature Coefficient: "+tempCoef+"ppm"+"\nCircuits Love Count: " + count+"\n #IloveCircuits");
    println("Posted " + tweet);

  }
  
}

/*

void mousePressed() {
  String tweet = simpletweet.tweetImage(get(), 
  "Resistor Value: "+round(resistorValue,2)+
  "Ω\nResistor Tolerance: "+round(resistorTolerance,2)+"%\n"+
  "Resistor Temperature Coefficient: "+tempCoef+"ppm\n #IloveCircuits");
  println("Posted " + tweet);
}
*/
