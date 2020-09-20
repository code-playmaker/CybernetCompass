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

## ER図

[![Image from Gyazo](https://gyazo.com/b32763adb8130bc0823306260fc37956.png)]
(https://gyazo.com/b32763adb8130bc0823306260fc37956)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, unique: ture|
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

## circulationsテーブル

## noticesテーブル

## tasksテーブル
