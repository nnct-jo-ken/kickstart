# Chapter 4:ボールを動かそう




```java
float ballX=400;
float ballY=400;
float ballRad=10;//半径
float ballAng=PI/6;//角度
float ballSpeed=6;//ボールのスピード

float mybarX=200;
float mybarY=700;
float mybarW=100;
float mybarH=30;

float combarX=170;
float combarY=100;
float combarW=100;
float combarH=30;

void setup(){
  size(800,800);
}

void draw(){
  clear();
  barMove();
  ballMove();
  ellipse(ballX,ballY,ballRad*2,ballRad*2);
  rect(mybarX,mybarY,mybarW,mybarH);
  rect(combarX,combarY,combarW,combarH);
}


void ballMove(){
  float newballX=ballX+cos(ballAng)*ballSpeed;
  float newballY=ballY+sin(ballAng)*ballSpeed;
  
  if(newballX<ballRad){
    newballX=ballRad-newballX;
    ballAng=PI-ballAng;
  }
  
  if(newballX>=width-ballRad){
    newballX=(width-ballRad)*2-newballX;
    ballAng=PI-ballAng;
  }
  
  if(newballY+ballRad>mybarY){
    if(mybarX<newballX+ballRad && newballX-ballRad<mybarX+mybarW){
      ballAng=-ballAng;
    }
  }
  
  if(newballY-ballRad<combarY+combarH){
    if(combarX<ballX+ballRad && newballX-ballRad<combarX+combarW){
      ballAng=-ballAng;
    }
  }
  
  ballX=newballX;
  ballY=newballY;
}

void barMove(){
  if(keyPressed == false)return;
  if(keyCode==LEFT)mybarX-=10;
  else if(keyCode==RIGHT)mybarX+=10;
}


```

# 工事中