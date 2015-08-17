
[![Build Status](https://travis-ci.org/katoy/rails3-files.png?branch=master)](https://travis-ci.org/katoy/rails3-files)
[![Dependency Status](https://gemnasium.com/katoy/rails3-files.png)](https://gemnasium.com/katoy/rails3-files)

    $ rake db:drop
    $ rake db:migrate
    $ rake db:seed
    $ rails s

db:seed で投入されるデータ数は db/seed.rb を編集して調整すること。  

procudtion mode で走らせる場合は

    $ rake assets:precompile
    $ RAILS_ENV=prodution rake db:migrate
    $ RAILS_ENV=production rake db:seed
    $ rails s -e production

selenium webdriver の利用
=========================

rails を走らせる。

    $ rake db:drop
    $ rake db:migrate
    $ rake db:fixtures:load
    $ rake s

別の端末で以下を行う。

    $ rake spec
    $ rake tidy
    $ rake diff_images


kaminari での ページネション操作を行い、そのスクリーンショットを selenoum-screenshots/*.png に撮る。  
paage の http 内容を selenoum-htmlshots/*.html に撮る。  
selenoum-htmlshots/*.html の内容を tidy を利用して、チェックする。  
selenium_scurennshots/*.png とselenium_scurennshots-rev/*.png の画像の差分を  ./diffs/*.png に生成する。  

初期設定からの変更
===================

* 送信するコンテンツを gzip している。
* log4r をつかっている。
* テーブルのページング例を４つ。
- クライアントサイドでの paging/sort/foltering
- サーバーサイドでの paging/sort (more using kaminari, remote:true)
- サーバーサイドでの paging/sort (table using kaminari, remote:true)
- サーバーサイドでの paging/sort (table using Wicegrid)
* autopage に対応 (Kaminari での more 操作例)
* ダウンロードボタンで、ファイルダンロードをさせる例

TODO:
* テストを書くこと。


ライセンス： MIT

参考：
- https://github.com/amatsuda/kaminari_example

scrennshots

[pict001](./screenshots/pict001.png)  
[pict002](./screenshots/pict002.png)  
[pict003](./screenshots/pict003.png)  
[pict004](./screenshots/pict004.png)  
