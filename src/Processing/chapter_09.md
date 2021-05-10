# Chapter 9:クラスとメンバ

## 配列からクラスへ
配列は便利ですが，複数の情報を持つものが複数あると少しかさばります．具体的には座標，速度，加速度の3要素を持つ直線上の物体が10個あるときに，

```java
int x[]=new int [10];//座標
int v[]=new int [10];//速度
int a[]=new int [10];//加速度
```

このようにコードをかくことができますが，少し冗長ですよね．というのも，x[i]とy[i]とa[i]は同じ物体についての情報であるのに別の配列に入っているという点で少し不便です．そこでそれらをまとめて扱う"クラス"というものを紹介します．

```java
class object{
    double x;
    double v;
    double a;
}
```

これでobjectというデータの型が使えるようになります．

```java
object ball;
ball=new object();
```

上のコードで，ballという名前のobject型の変数(のようなもの)が宣言されます．普通のint型などの変数とは違って`=new クラス名();`があることに注意です

参照と代入は次のように行えます．


```java
ball.x=2.2;
ball.v=-3.2;
ball.a=0.1;
print(ball.x);
```

配列にする場合，少し手順が複雑になります．

```java
object ball[]=new object[100];
for(int i=0;i<100;i++)ball[i]=new object();

ball[0].x=2.2;
ball[0].v=-3.2;
ball[0].a=0.1;

```
