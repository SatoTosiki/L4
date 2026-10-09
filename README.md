# README

## Userの登録

DBマイグレーションを実行後、Railsコンソールを起動します。

```sh
bin/rails db:migrate
bin/rails console
```

コンソール上でユーザーを登録します。

```ruby
User.create!(uid: "kindai", pass: BCrypt::Password.create("sanriko").to_s)
```

`pass`には平文ではなくBCryptのハッシュが保存されます。基礎課題２で登録した平文パスワードのユーザーが残っている場合は、ログインに使う前にコンソールで削除してください。

```ruby
User.destroy_all
```

登録したIDとパスワードが一致するとログインできます。ログイン後は「ログアウト」リンクからログアウトできます。

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
