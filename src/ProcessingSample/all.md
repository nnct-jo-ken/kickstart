# サンプルプログラム

全てShibaken28によって書かれました．一部コードの可読性が著しく低いものがあります．

だれかgif画像貼って><

## 時計

<details><summary>ソースコード</summary><div>

```java
void setup(){
  size(600,600);
}

void draw(){
  fill(0);
  rect(0,0,width,height);
  int hy=height/24;
  int my=height/60;
  int sy=height/60;
  stroke(170);
  fill(255);//白色
  for(int i=1;i<=hour();i++)rect(0,600-hy*i,200,hy);
  for(int i=1;i<=minute();i++)rect(200,600-my*i,200,my);
  for(int i=1;i<=second();i++)rect(400,600-sy*i,200,sy);
}
```
</div></details>

## フルスクリーン
<details><summary>ソースコード</summary><div>

```java
int r=40;
void setup(){fullScreen();}
void draw(){
  clear();noStroke();
  float X=mouseX,Y=mouseY;
  for(int x=0;x<=width;x+=r){
    for(int y=0;y<=height;y+=r){
      float tx=x,ty=y,d=PI/2;
      float dx=X-x,dy=Y-y;
      float l=sqrt(dx*dx+dy*dy);
      if(X-x!=0)d=atan(dy/dx);
      else if(Y>y)d=-d;
      if(X-x>0)d=d-PI;
      
      tx+=cos(d)*r*log(l);ty+=sin(d)*r*log(l);
      circle(tx,ty,r);
    }
  }
}
```
</div></details>



## wave
<details><summary>ソースコード</summary><div>

```java
int w=100;
float wave[]=new float[w];
float y=400;
float t=0;
float x;

void setup(){
  fullScreen();
  x=displayWidth;
}

void draw(){
  float ww=x/w;
  background(0);
  strokeWeight(ww-1);
  stroke(0,255,255);
  for(int i=0;i<w;i++){
    wave[i]=0;
    float T=120,la=630;
    float A=25;
    wave[i]+=A*sin(2*PI*(t/T-i*ww/la));
    T=70;la=450;
    A=30;
    wave[i]+=A*sin(2*PI*(t/T-i*ww/la));
    T=-200;la=1050;
    A=20;
    wave[i]+=A*sin(2*PI*(t/T-i*ww/la));
    line(i*ww,wave[i]+y,i*ww,displayHeight);
  }
  t++;
}
```

</div></details>


## 波動
<details><summary>ソースコード</summary><div>

```java
int r=30;
int X, Y, R;
void setup() {
  fullScreen();
}
void draw() {
  background(0);
  fill(255);
  noStroke();
  R+=10;
  if (mousePressed) {
    X=mouseX;
    Y=mouseY;
    R=0;
  }
  for (int x=0; x<2000; x+=r) {
    for (int y=x%7; y<1500; y+=r) {
      float d=dist(x, y, X, Y);
      circle(x, y, r-(R<d+500&&d<R?(-R+d)/10+50:0));
    }
  }
}
```
</div></details>

## cafewall
<details><summary>ソースコード</summary><div>


```java
float t=0;
void setup(){
  size(800,900);
}

void draw(){
  background(105);
  int w=30;
  for(int y=0;y<height;y+=w){
    noStroke();
    for(int x=-w;x<width+w;x+=w){
      fill(((x/w)%2==0?255:0));
      rect(x+sin(t+y/w*PI/2)*10,y,x+w,y+w);
    }
    stroke(200);
    line(0,y,width,y);
  }
  if(!mousePressed)t+=0.1;
}
```
</div></details>

## 弾避け
<details><summary>ソースコード</summary><div>


```java
float player_x,player_y;//自機の座標
float player_r=60;//自機の半径(radius)
//敵
int enemy_max=1000;//敵の最大個数
int enemy_now=0;//現在の最先端
int enemy_r=50;//半径
float enemy_x[]=new float [enemy_max];//x座標
float enemy_y[]=new float [enemy_max];//y座標
float enemy_v[]=new float [enemy_max];//下向きの速度
int enemy_sta[]=new int [enemy_max];//状態(status)
//0:未使用,1:使用中(跳ね返る前),2:使用中(跳ね返り後)

float g=0.4;//重力
float e=0.9;//跳ね返り係数

int time=60;//次のenemy出現までの時間
int score=0;//スコア

boolean gameover=false;

void setup(){
  size(800,800);
  //配列初期化
  for(int i=0;i<enemy_max;i++){
    enemy_x[i]=0;
    enemy_y[i]=0;
    enemy_v[i]=0;
    enemy_sta[i]=0;
  }
  player_x=width/2;
  player_y=height/2;
}

void draw(){
  cls();
  addEnemy();
  playerMove();
  enemyMove();
  hit();
  if(gameover)exit();
}

void cls(){
  //fill(0);
  fill(0,60);//黒くする
  rect(0,0,width,height);
}

void playerMove(){
  noStroke();//枠をかかない
  fill(255);//白色
  player_x+=(mouseX-player_x)/5;
  player_y+=(mouseY-player_y)/5;//ぬるぬる動く
  ellipse(player_x,player_y,player_r,player_r);//自機描画
}

void enemyMove(){
  for(int i=0;i<enemy_max;i++){
    if(enemy_sta[i]==0)continue;//未使用ならとばす
    enemy_v[i]+=g;//重力で加速
    enemy_y[i]+=enemy_v[i];//y座標を動かす
    if(enemy_y[i]>height){
      if(enemy_sta[i]==1){//まだ跳ね返ってなかったら
        enemy_v[i]=-enemy_v[i]*(e-random(0.2));//跳ね返る
        enemy_y[i]=height;//ちょっと上の方に
        enemy_sta[i]=2;//一度跳ね返ったので書き換える
      }else if(enemy_sta[i]==2){//跳ね返り済みだったら
        enemy_sta[i]=0;//未使用にする
      }
    }
    noStroke();//枠をかかない
    fill(0,255,255);//白色
    ellipse(enemy_x[i],enemy_y[i],enemy_r,enemy_r);//描画
  }
}

void addEnemy(){
  time--;//時間がたつ
  if(time==0){
    enemy_sta[enemy_now]=1;
    enemy_x[enemy_now]=random(width);
    enemy_y[enemy_now]=0;
    enemy_v[enemy_now]=0;
    enemy_now++;
    if(enemy_now==enemy_max)enemy_now=0;
    time=40-int(random(20));
    //time=60-(score<50?score:50);
    //score++;
  }
}

void hit(){
  for(int i=0;i<enemy_max;i++){
    float dx=player_x-enemy_x[i];
    float dy=player_y-enemy_y[i];
    if(player_r*player_r>dx*dx+dy*dy){
      gameover=true;
    }
  }
}
```
</div></details>


## 弾幕避け

<details><summary>ソースコード</summary><div>

```java
class Point{
  float x;
  float y;
  float d;
  float s;
  float far;
  float r;
  int t_f=1;
  color col;
  Point(float p,float q,float t,float v,float h,color c)
  {
    x=p;
    y=q;
    d=t;
    s=v;
    r=h;
    col=c;
  }
  
  void go(float p,float q,float t,float v,float h)
  {
    x=p;
    y=q;
    d=t;
    s=v;
    r=h;
  }
  
  void move()
  {
    if(s!=0){
      x=x+cos(radians(d))*s;
      y=y+sin(radians(d))*s;
    }
  }
  
  void hit()
 {
   if(time>10)
   {
     far=sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y));
     if(far<5){t_f=0;}else{t_f=1;}
   }
 }
 
 void away()
 {
   if(x>width){d=180-d;}
   else if(x<0){d=180-d;}
   else if(y>height){d=-d;}
   else if(y<0){d=-d;}
 }
  
}

Point[] zahyo=new Point[512];
int use_n=0;
int rad=0;
int level=1;
float time=0; 
float speed=3;
int hankei=10;
int ran=0;

void setup()
{
  size(512,512);
  background(200);
  noStroke();
  for(int i=0; i<zahyo.length ;i++)
  {
    zahyo[i]=new Point(-64,-64,0,0,-1,color(i,random(255),255));
  }
  run();
}

void draw()
{
  fill(255,255,255);
  rect(0,0,width,height);
  fill(0,0,0);
  for(int i=0; i<zahyo.length ;i++)
  {
    fill(zahyo[i].col);
    zahyo[i].move();
    zahyo[i].away();
    ellipse(zahyo[i].x,zahyo[i].y,zahyo[i].r,zahyo[i].r);
  }
  fill(0,255,0);
  ellipse(width/2,height/2,40,40);
  fill(255,0,0);
  ellipse(mouseX,mouseY,10,10);
  for(int i=0; i<zahyo.length ;i++)
  {
    zahyo[i].hit();
    if(zahyo[i].t_f==0)
    {
      noLoop();
      textSize(64);
      text("GAME OVER", 0, 300);
    }
  }
  time += 1;
  textSize(32);
  text("balls:"+level, 00, 32);
  if (time/(20-level/15)==int(time/(20-level/15)))
  {
    level+=1;
    run();
  }
}

void incuse()
{
  zahyo[use_n].go(width/2,height/2,rad,speed,hankei);
  use_n += 1;
  if (use_n>=zahyo.length){use_n=0;}
}

void run()
{
  speed=1.5;
  hankei=10+int(random(0,10));
  rad+=7;
  zahyo[use_n].go(width/2,height/2,rad,speed,hankei);
  incuse();
}
```
</div></details>


## カージオイド

<details><summary>ソースコード</summary><div>

```java
float t=0,x,y;
void setup(){fullScreen();x=displayWidth/2;y=displayHeight/2;}
void draw(){
clear();stroke(255);strokeWeight(3);
for(float i=0;i<6.28;i+=.0523){
float r=200*(1+cos(i)*sin(t)*2),s=200*(1+cos(i+.0523)*sin(t)*2);
for(float j=0;j<6.28;j+=0.419)line(x+r*cos(i+j),y+r*sin(i+j),x+s*cos(i+.0523+j),y+s*sin(i+.0523+j));
}t+=.03;
}
```
</div></details>

## フラクタル

<details><summary>ソースコード</summary><div>

```java
float t=1;
int cnt=0;
void setup(){
  fullScreen();
}

void d(float cx,float cy,float s,int c,float rd){
  cnt++;
  int r=255,g=255,b=255;
  fill(r,g,b);
  float x1=cx+cos(0+rd)*s,y1=cy+sin(0+rd)*s;
  float x2=cx+cos(PI*2/3+rd)*s,y2=cy+sin(PI*2/3+rd)*s;
  float x3=cx+cos(PI*4/3+rd)*s,y3=cy+sin(PI*4/3+rd)*s;
  triangle(x1,y1,x2,y2,x3,y3);
  
  s/=2;
  x1=cx+cos(0+rd)*s;y1=cy+sin(0+rd)*s;
  x2=cx+cos(PI*2/3+rd)*s;y2=cy+sin(PI*2/3+rd)*s;
  x3=cx+cos(PI*4/3+rd)*s;y3=cy+sin(PI*4/3+rd)*s;
  if(c>0){
    //d(cx,cy,s,c-1,rd);
    d(x1,y1,s,c-1,rd);
    d(x2,y2,s,c-1,rd);
    d(x3,y3,s,c-1,rd);
  }
}

void draw(){
  cnt=0;
  textSize(100);
  background(0);
  fill(255);
  d(displayWidth/2,displayHeight/2,1000,6,PI/6);
  t=PI/3;
}
```
</div></details>