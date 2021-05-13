# Chapter 7:関数を作る

## 関数とは
実は今まで使ってきた`rect()`や`fill()`，`print()`などは関数と呼ばれるものです．

例えば，`rect(x,y,a,b)`を実行した場合，
座標(x,y)を左上の頂点として，横a縦bの長さである長方形が描かれます．`print(S);`(Sは文字列)は，文字列Sがコンソールに表示されます．
このように，関数はいくつかの入力(rectの例だとx,y,a,b)に対して何かを行うものです．

そして，この関数は自分で作ることができます．

## 引数
`rect(x,y,a,b);`について，x,y,a,bをそれぞれ引数(ひきすう)と呼びます．
また，引数は型が決まっていてrectの場合はfloat型です

## 関数を作る

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

上の例ではface(x,y)という関数を作っています．

```java
void 関数名(型 仮引数名，型 仮引数名，......){
    //
}
```

引数は個数はいくつでもよいです(0個以上)．

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