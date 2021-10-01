# 発展:平方根

平方根は`sqrt`関数を使えば得られます．

```java
float a=sqrt(2);
print(a);
```

そもそも，どのようにして`sqrt`関数内で平方根を計算しているのでしょうか．もし`sqrt`関数が使えなかったらどうすればよいでしょうか．


例えば，次のように実装してみたとしましょう．
```java
float fun(float a){
    float ans=0;
    while(true){
        ans+=0.001f;
        if(ans*ans==a)break;
    }
    return ans;
}
```

このプログラムには問題点があり，
- aが大きな値(例えば40000)だと時間がかかる
- 平方根はだいたい無理数なのでans*ans==aになることはほとんどない→永久にwhile文を抜けださない
といった点で困ります．後者は`ans*ans`と`a`の差が十分に小さかったら，という処理で回避できるかもしれませんが前者はどうにもなりません．

## 二分探索
```java
float fun(float a){
    float l=0;
    float r=a;
    while(true){
        float m=(l+r)/2;
        if(m*m>a)r=m;
        else l=m;

        float d=m*m-a;
        if(d<0)d=-d;
        if(d<0.00000001f)break;
    }
    return (l+r)/2;
}
```

例えば，100の平方根を求めるときに50の