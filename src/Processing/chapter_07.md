# Chapter 7:関数を作る

## 関数とは
実は今まで使ってきた`rect()`や`fill()`，`print()`などは関数と呼ばれるものです．

例えば，`rect(x,y,a,b)`を実行した場合，
座標(x,y)を左上の頂点として，横`a`縦`b`の長さである長方形が描かれます．`print(S);`(Sは文字列)は，文字列`S`がコンソールに表示されます．
このように，関数は0個以上の入力(`rect`の例だと`x,y,a,b`)に対して何かを行うものです．

そして，この関数は自分で作ることができます．

## 引数
`rect(x,y,a,b);`について，`x,y,a,b`をそれぞれ引数(ひきすう)と呼びます．
また，引数それぞれには型が決まっていて`rect`の場合は`float`型です

## 関数を作る
関数を次のようにして定義できます．
```java
void 関数名(型 仮引数名，型 仮引数名，......){
    //
}
```
例です．
```java
void setup(){
    size(600,600);
}

void draw(){
    face(100,100);
    face(300,100);
}

void face(int x,int y){//座標(x,y)に顔を描く
    fill(255,255,255);
    ellipse(x,y,200,200);
    fill(0,0,0);
    ellipse(x-50,y-20,50,50);
    ellipse(x+50,y-20,50,50);
    line(x-50,y+50,x+50,y+50);
}
```

この例では`face(x,y)`という関数を作っています．

![](img/voidfun.svg "")

引数は個数はいくつでもよいです．

```java
int x=0,y=0;

void setup(){
    size(600,600);
}

void draw(){
    clearScreen();
    face(x,y);
    x=x+4;y=y+3;
    if(x>700)x=-100;
    if(y>700)y=-100;
}

void clearScreen(){//引数が0個の関数
    fill(255,255,255);
    rect(0,0,600,600);
}


void face(int x,int y){//座標(x,y)に顔を描く
    fill(255,255,255);
    ellipse(x,y,200,200);
    fill(0,0,0);
    ellipse(x-50,y-20,50,50);
    ellipse(x+50,y-20,50,50);
    line(x-50,y+50,x+50,y+50);
}

```

`clearScreen()`という関数を作りました．引数が0個であり一見何の意味も成してないように見えますが，
```java
fill(255,255,255);
rect(0,0,600,600);
```
が
```java
clearScreen();
```
で，画面を真っ白にするという表現になったことで，何をしているかがわかりやすくなっています．
このように，関数の定義による一連の動作の抽象化はコードの可読性が増し，汎用性も高くなります．


## 戻り値のある関数
戻り値がある関数は次のように書けます．

```java
戻り値の型 関数名(型 仮引数名，型 仮引数名，......){
    return 戻り値;
}
```

使い方の例です．

```java
/*(x1,y1)と(x2,y2)のユークリッド距離を求める*/
float distance(float x1,float y1,float x2,float y2){
    float dif_x=x1-x2;
    float dif_y=y1-y2;
    return sqrt(dif_x*dif_x+dif_y*dif_y);
}

void setup(){
    float a=distance(0,0,1.4,1.4);
    println(a);
}
```
![](img/floatfun.svg "")


### 演習7-1
> `doubleCircle(x,y,r)`と実行したとき，中心の座標が`(x,y)`で，直径が`r`と`r/2`の円による二重丸が描画される関数を作成してみよ．

実行例
```java
void setup(){
  size(400,400);
}

void draw(){
  doubleCircle(100,100,100);
  doubleCircle(300,300,200);
}
```
![](img/fig7-3.png "")

### 解答

<details><summary>解答</summary><div>

演習 7-1:
```java
void doubleCircle(float x,float y,float r){
  ellipse(x,y,r,r);
  ellipse(x,y,r/2,r/2);
}
```

</div></details>

