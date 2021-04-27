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
