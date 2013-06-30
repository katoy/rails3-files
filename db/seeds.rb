# coding: utf-8

include DownloadsHelper

Download.delete_all

nowTime = Time.now

date = time_rand(nowTime.years_ago(10), nowTime.years_since(1))
Download.create(name: "file-001.txt", path: "files/foo/file-001.txt", open_at: date)

date = time_rand(nowTime.years_ago(10), nowTime.years_since(1))
Download.create(name: "file-002.txt", path: "files/foo/file-002.txt", open_at: date)

998.times do |t|
  a = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  name = Array.new(16){a[rand(a.size)]}.join
  name = "file-#{name}"
  date = time_rand(nowTime.years_ago(10), nowTime.years_since(1))
  Download.create(name: "#{name}", path: "files/foo/#{name}", open_at: date)
end
