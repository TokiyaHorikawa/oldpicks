# README

## Newspicksを目コピで作ったアプリケーションです。

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|add_index, null:false|
|email|string|null:false|
|password|string|null:false|
|avatar_image|string|

### Association
- has_many :articles
- has_many :comments
- has_many :likes

## articlesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|add_index, null:false|
|user|references|index: true, foreign_key: true|
|like_counts|integer|

### Association
- belongs_to :user
- has_many :comments
- has_many :likes, dependent: :destroy

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|add_index, null: false|
|user|references|index: true, foreign_key: true|
|article|references|index: true, foreign_key: true|
|like_counts|integer|

### Association
- bolongs_to :user
- belongs_to :article
- has_many :likes, dependent: :destroy

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|index: true, foreign_key: true|
|article|references|index: true, foreign_key: true|
|comment|references|index: true, foreign_key: true|

### Association
- belongs_to user
- belongs_to article, counter_cache: :like_counts
- belongs_to comment, counter_cache: :like_counts
