# README

## About
* HackBowl-201910のチーム「なんでやねん、いやそれペリカンやろ！！」のサーバーサイド開発のリポジトリです。


## Version
* ruby-version `ruby 2.6.3`
* rbenv `rbenv 1.1.2`
* Rails `Rails 6.0.0`
* node `v12.10.0`
* yarn `1.17.3`
* postgresql `psql (PostgreSQL) 11.5`
* Bundlr `Bundler version 2.0.2`
* Docker `Docker version 19.03.2`

## Setup
```
$ git clone https://github.com/IidaTakuma/HackBowl_NIPY_server.git
$ cd [app_directory]
$ bundle install
$ yarn install --check-files
$ docker-compose build
$ docker-compose up -d
$ bin/rails db:create
$ bin/rails db:migrate
$ bin/rails server
```

## development
* 画像は ` app/assets/images ` の中に格納
* スタイルは ` app/javascript/stylesheets `に記載