
[![Build Status](https://travis-ci.org/katoy/rails3-files.png?branch=master)](https://travis-ci.org/katoy/rails3-files)
[![Dependency Status](https://gemnasium.com/katoy/rails3-files.png)](https://gemnasium.com/katoy/rails3-files)

    $ rake db:drop
	$ rake db:migrate
	$ rake db:seed
	$ rails s

db:seed で投入されるデータ数は db/seed.rb を編集して調整すること。  

procudtion mode で走らせる場合は

    $ rake assets:precompile
    $ RAILS_ENV rake db:migrate
    $ RAILS_ENV rake db:seed
    $ rails s -e production

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
