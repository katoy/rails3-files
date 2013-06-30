
    $ rake db:drop
	$ rake db:migrate
	$ rake db:seed
	$ rails s

db:seed で投入されるデータ数は db/seed.rb を編集して調整すること。  

procudtion mode で走らせる場合は

    $ rake assets:precompile
    $ RAILS_ENV rake db:migrate
    $ RAILS_ENV rake db:seed
    $ RAILS_ENV rails s

初期設定からの変更
===================

* 送信するコンテンツを gzip している。 
* log4r をつかっている。  

