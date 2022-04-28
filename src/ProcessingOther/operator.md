# 演算子

## 省略
```java
int apple=0;
apple=apple+2;
apple=apple-3;
apple=apple*5;
apple=apple/7;
apple=apple%11;
```

上の式のように自分自身に対する計算は，短く書くことができます．

```java
int apple=0;
apple+=2;
apple-=3;
apple*=5;
apple/=7;
apple%=11;
```

また，1を足すまたは引く場合はさらに短く書くことができます．

```java
int apple=0;
apple++;//apple=apple+1と同じ
apple--;//apple=apple-1と同じ
```

++を先に書くこともできます．これらは挙動が違います．

```java
int a=0;
print(a++);
print(a);
a=0;
print(++a);
print(a);
```


## bit演算子
bitにかかわる演算子です．

| すること | 演算子 |例|aの値 |
| :-: | :-: |:-:|:-:|
|AND|`&`|`a=1&3`|`1`|
|OR|`|`|`a=1|3`|`3`|
|XOR|`^`|`a=1^3`|`2`|
|左にビットシフト|`<<`|`a=1<<3`|`8`|
|右にビットシフト|`>>`|`a=4>>1`|`2`|

例えば，変数aの2ビット目(一番右を0ビット目とする)が1立っているかどうか(1であるか)を確かめるには，
```java
if((a&(1<<2))!=0)print("aの2ビット目は立っています");
```
で調べることができます．

応用すると，部分集合が全列挙できます．

```java
int a[]={0,1,2,3,4};
int size=5;

for(int i=0;i<(1<<size);i++){
  for(int k=0;k<size;k++){
    if((i&(1<<k))!=0){
      print(a[k]);
    }
  }
  print("\n");
}
```

