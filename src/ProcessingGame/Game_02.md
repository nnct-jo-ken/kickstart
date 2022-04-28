# Chapter 2:バーとボールを作ろう

まず，自分のバーと相手のバーとボールの位置と大きさを決めます．

```java
float ballX=400; //ボールのx座標
float ballY=400; //ボールのy座標
float ballRad=20; //ボールの半径

float mybarX=200; //バーのx座標
float mybarY=700; //バーのy座標
float mybarW=100; //バーの幅
float mybarH=30; //バーの高さ

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

# 工事中