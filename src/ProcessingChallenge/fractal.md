# 再帰でフラクタル図形

フラクタル図形(構造)とは，その図形自身の一部が自身の相似な図形となっている図形や構造のことです．

```java

void rerect(int x,int y,int side,int cnt){
  if(cnt<=0)return;
  rect(x,y,side,side);
  side/=3;
  for(int dx=0;dx<=1;dx++){
    for(int dy=0;dy<=1;dy++){
      rerect(x+dx*side,y+dy*side,side,cnt-1);
    }
  }
}

void setup(){
  size(800,800);
  frameRate(10);
}

void draw(){
  background(0,0,0);
  stroke(255);
  noFill();
  rerect(100,100,600,7);
}

```



```java
int cnt=0;
float t=0;

void setup(){
  size(1100,800);
  frameRate(30);
}

void tree(float x,float y,float s,float r,int c){
  if(c<=0)return;
  for(int i=-2;i<=2;i+=2){
    float nr=i*0.15+r;
    float dx=cos(nr)*s;
    float dy=sin(nr)*s;
    line(x,y,x+dx,y+dy);
    tree(x+dx,y+dy,s*0.9,nr,c-1);
  }
}

void draw(){
  background(0);
  strokeWeight(2);
  stroke(255);
  tree(width/2,height,150,-PI/2,6);
}

```