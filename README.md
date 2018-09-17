# README

## TasKill - タスキル -
「ふわっとした仕事」を「具体的なタスク」へ
個人で制作中のサービス

### 環境構築
```
git clone git@github.com:ken840619/Taskill.git
docker-compose build
docker-compose up
```

### 環境へのアクセス
railsコマンド
```
docker ps # コンテナのIDを調べる
docker exec -it [springのcontainer ID]
```
