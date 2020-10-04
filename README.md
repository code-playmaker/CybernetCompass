# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## What
いわゆる回覧アプリ。
### 内容
* 送信者はメッセージ・データ送信時に重要度をつける。
* 閲覧者は送られたメッセージ・データにお気に入り保存することで各々が必要だと考えた情報をすぐに閲覧し直せるようにする。
* 係内、部内、全組織とそれぞれ分けることで、情報が埋もれるのを防ぐ。
* スケジュール機能も加え、組織メンバーの予定も確認できるようにする。

## Why
情報過多な時代、会社や官公庁などの組織に入ってくる情報量も非常に多くなってきています。１つのフォルダに多種多様のデータが入る、もしくは紙に埋もれて整理・検索が上手くできない組織が多いのではないかと考えました。メール・回覧等、様々な形式で情報が回ってきます。データを分けて入られるアプリがあれば情報を集約することができ、確認漏れを防いだり、情報の利便性が増すと考え作成しました。また、スケジュール機能も加え、自分だけでなく職場全体の予定も目視で瞬時に確認できる機能を加えました。

## トップページ
![Image from Gyazo](https://gyazo.com/fd5a035d63998ccfa91794f7c1cb0e76.png)
(https://gyazo.com/fd5a035d63998ccfa91794f7c1cb0e76)

## メッセージ・回覧・お知らせ作成画面
![Image from Gyazo](https://i.gyazo.com/c9fcbec3f15616c512ef18199de966fa.gif)
(https://i.gyazo.com/c9fcbec3f15616c512ef18199de966fa)

## スケジュール管理(gem 'fullcalendar-rails')
![Image from Gyazo](https://gyazo.com/bb81f7d72f2e3cb2ca1c1ae96c151bd9.png)
(https://gyazo.com/bb81f7d72f2e3cb2ca1c1ae96c151bd9)


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|number|string|null: false, unique: ture|
|password|string|null: false|
|name|string|null: false|
### Association
belongs_to :assignment
has_many :messages
has_many :circulations
has_many :notices
has_many :task

## assignmentsテーブル
|Column|Type|Options|
|------|----|-------|
|department|string|null: false|
|division|string|null: false|
|charge|string|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
has_many :users

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|string|null: false|
|upload_file_name|string|
|upload_file|binary|-|
|date|datetime|-|
|user_id|references|null: false, foreign_key: true|
### Association
belongs_to :user

## circulationsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|string|null: false|
|upload_file_name|string|
|upload_file|binary|-|
|date|datetime|-|
|user_id|references|null: false, foreign_key: true|
### Association
belongs_to :user

## noticesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|string|null: false|
|upload_file_name|string|
|upload_file|binary|-|
|date|datetime|-|
|user_id|references|null: false, foreign_key: true|
### Association
belongs_to :user

## eventsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null:false|
|body|string|null: false|
|start_date|datetime|null: false|
|end_date|datetime|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
belongs_to :user

## 今後の予定

### お気に入り機能の実装
メッセージ・データにお気に入り保存することで各々が必要だと考えた情報をすぐに閲覧し直せるようにする。

### gem 'fullcallender'の導入
カレンダー機能をつける。
※googleカレンダーは個人が特定される恐れがあるため、導入しない。