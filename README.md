# README

# アプリケーション名
まるしょく
# アプリケーション概要
子供と一緒に利用できる飲食店情報をユーザー同士で共有することができる。
# URL
http//00.00.000.000
# テスト用アカウント
- Basic認証パスワード :xxxx
- Basic認証ID :xxxx
- メールアドレス :xxx@xx.com
- パスワード :xxxxxx
# 利用方法
## 店舗情報投稿
1.トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う
2.店舗情報投稿ボタンから店舗情報を入力し投稿する
## コメント投稿
1.店舗詳細ページのテキストボックスにコメントを入力し投稿する

# アプリケーションを作成した背景
妻にヒアリングをし、「子供と一緒にご飯を食べに行きたいが一緒に行きやすいお店が分かりづらい」という課題を抱えていることが判明した。同じような課題を抱えているパパやママは沢山いるのではないかと仮説を立てた。お店発信の情報でなく実際に利用してオススメをしたい店舗情報をユーザー同士で共有することができるアプリケーションを開発することにした。
# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1iABKLD3xCEChRuWF0ij_pjwWzyzSDa0vmZ1VyGo-5Ws/edit?usp=sharing)
# 実装した機能についての画像やGIFおよびその説明
~開発次第記載~
# 実装予定の機能
ログイン時のSNS認証を実装予定
# データベース設計
[![Image from Gyazo](https://i.gyazo.com/52bf54811e1cf18712b0bb6437160661.png)](https://gyazo.com/52bf54811e1cf18712b0bb6437160661)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/803ac94c3d5e983e3442cb17fcf9970c.png)](https://gyazo.com/803ac94c3d5e983e3442cb17fcf9970c)
# 開発環境
- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディッタ
- タスク管理
# ローカルでの動作方法
以下のコマンドを順に実行
% git clone https://github.com/Yukkiyss/marushoku-38005
# 工夫したポイント
~開発次第記載~

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |

### Association

- has_many :stores
- has_many :comments

## stores テーブル

| Column                         | Type       | Options                        |
| ------------------------------ | ---------- | ------------------------------ |
| store_name                     | string     | null: false                    |
| store_environment              | integer    | null: false                    |
| category_id                    | integer    | null: false                    |
| recommendation                 | text       | null: false                    |
| user                           | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column                         | Type       | Options                        |
| ------------------------------ | ---------- | ------------------------------ |
| content                        | string     | null: false                    |
| store                          | references | null: false, foreign_key: true |
| user                           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :stores

