# Chapter 2:バーとボールを作ろう


```java
float ballX=400;
float ballY=400;
float ballRad=20;

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
  ellipse(ballX,ballY,ballRad*2,ballRad*2);
  rect(mybarX,mybarY,mybarW,mybarH);
  rect(combarX,combarY,combarW,combarH);
}
```