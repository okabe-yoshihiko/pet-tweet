![サンプル画像](app/assets/images/pet-tweet.png)
## http://pet-tweet.herokuapp.com/
# pet-tweet</br>

### 概要</br>
本アプリはペット専用のSNS型サイト</br>
自分の自慢のペットの写真を投稿して仲間とコミュニケーションが取れます！</br>
google map apiを使用しペットを捜索できるサービスがあります！</br>

### 本番環境
aws
testアカウント test_user@gmail.com</br>
testパスワード test_user</br>



### 制作背景
自分がペットを飼っていて、みんなと共有できるサイトが欲しかったのと、ペットが</br>
居なくなった時（逃げ出すなど）に役立つ捜索ができるサービスを作りたかったため。

### DEMO
![サンプル画像](app/assets/images/pet-find.png)
「迷子登録をする」からペットの情報を記入すると、住所情報から経度、緯度を</br>
取得してマップ上にアイコンが立ちます。</br>
アイコンをクリックすると</br>
![サンプル画像](app/assets/images/find.pets.png)</br>
上のようにアイコンと名前が表示されて迷子になったペットの詳細ページへ飛ぶことができます。</br>

### 工夫したポイント
.トップページはできるだけシンプルにして、写真をブロック状に配置することによりお洒落で見やすいサイトにしました。</br>
また、user登録時写真を登録したくない人のためにデフォルト画像を用意しました。</br>

### 使用技術(開発環境)
.Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code</br>

### 課題や今後実装したい機能
フォロー機能の実装、地域猫の登録とマップ表示。ペット飼っている人のためのアイテム紹介（amazon apiを使用し収益化)

### DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|profile|string|
|image|string|
|email|string|null: false|
|password|string|null: false|

### Association
  has_many :tweets</br>
  has_many :comments</br>
  has_many :likes, dependent: :destroy</br>
  has_many :likes, dependent: :destroy</br>
  has_many :like_tweets, through: :likes, source: :tweet</br>
  has_many :pets</br>



## tweetsテーブル
|Column|Type|Options|</br>
|------|----|-------|</br>
|text|string|</br>
|image|string|</br>
|user_id|integer|null: false|</br>

### Association
  belongs_to :user</br>
  has_many :comments</br>
  has_many :likes, dependent: :destroy</br>
  has_many :liking_users, through: :likes, source: :user</br>


## petsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|user_id|integer|null: false|
|name|string|
|text|string|
|charactaristic|string|
|find|string|
|tell|string|
|address|string|null: false|
|latitude|float|null: false|
|longitude|float|null: false|
### Association
  belongs_to :user</br>
  geocoded_by :address</br>
  after_validation :geocode, if: :address_changed?</br>



## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|tweet_id|integer|null: false|

### Association


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
|text|string|
### Association
  belongs_to :tweet</br>
  belongs_to :user</br>

