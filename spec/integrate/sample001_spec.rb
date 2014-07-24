# -*- coding: utf-8 -*-

require 'rails_helper'

# indexKaminariTable のテスト

describe 'SAMPLE_001' do

  fixtures :downloads

  before(:all) do
    @wd = DRIVER
    @shots = SHOTS
    @name = 'sample001'
    @sub_no = 0
  end

  after(:all) do
  end

  def wait_loaded
    sleep 0.2
    # wait for a specific element to show up
    wait = Selenium::WebDriver::Wait.new(timeout: 20) # seconds
    wait.until { @wd.find_element(id: 'paginator-top') }
  end

  def check_pagenavs(driver, current, pages)
    current_pages = driver.find_elements(:css, 'nav.pagination > span.page.current')
    current_pages.each do |c|
      expect(c.text).to eq(current.to_s)
    end

    pagenations = driver.find_elements(:css, 'nav.pagination')
    pagenations.each do |p|
      expect(p.text).to eq(pages)
    end
  end

  def check_rows(driver, ids)
    ids2 = []
    tds = driver.find_elements(:xpath, '//table/tbody/tr/td[1]')
    tds.each do |td|
      ids2 << td.text.to_i
    end
    expect(ids).to eq(ids2)
  end

  example 'per_page 10' do
    @wd.get 'http://localhost:3000/downloads/indexKaminariTable'
    # 表示件数 10 にする
    wait_loaded
    unless @wd.find_element(:xpath, '//div[2]/table/thead/tr/th/select//option[1]').selected?
      @wd.find_element(:xpath, '//div[2]/table/thead/tr/th[4]/select//option[1]').click
    end

    # ページナビゲーションの内容のチェック
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_pagenavs @wd, 1, '1 2 3 4 5 ... 次ページ » 最後のページ'
    check_rows @wd, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    # 2 ページ目の表示
    @wd.find_element(:xpath, "//div[@id='paginator-top']//a[.='2']").click
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_pagenavs @wd, 2, '最初のページ « 前ページ 1 2 3 4 5 6 ... 次ページ » 最後のページ'
    check_rows @wd, [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

    # 5 ページ目の表示
    @wd.find_element(:xpath, "//div[@id='paginator-top']//a[.='5']").click
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_pagenavs @wd, 5, '最初のページ « 前ページ 1 2 3 4 5 6 7 8 9 ... 次ページ » 最後のページ'
    check_rows @wd, [41, 42, 43, 44, 45, 46, 47, 48, 49, 50]

    # 6 ページ目の表示
    @wd.find_element(:xpath, "//div[@id='paginator-top']//a[.='6']").click
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_pagenavs @wd, 6, '最初のページ « 前ページ ... 2 3 4 5 6 7 8 9 10 ... 次ページ » 最後のページ'
    check_rows @wd, [51, 52, 53, 54, 55, 56, 57, 58, 59, 60]

    # 前のページの表示
    @wd.find_element(:xpath, "//div[@id='paginator-top']//a[.='« 前ページ']").click
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_pagenavs @wd, 5, '最初のページ « 前ページ 1 2 3 4 5 6 7 8 9 ... 次ページ » 最後のページ'
    check_rows @wd, [41, 42, 43, 44, 45, 46, 47, 48, 49, 50]

    # 次のページの表示
    @wd.find_element(:xpath, "//div[@id='paginator-top']//a[.='次ページ »']").click
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_pagenavs @wd, 6, '最初のページ « 前ページ ... 2 3 4 5 6 7 8 9 10 ... 次ページ » 最後のページ'
    check_rows @wd, [51, 52, 53, 54, 55, 56, 57, 58, 59, 60]

    # 最初のページの表示
    @wd.find_element(:xpath, "//div[@id='paginator-top']//a[.='最初のページ']").click
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_pagenavs @wd, 1, '1 2 3 4 5 ... 次ページ » 最後のページ'
    check_rows @wd, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    # 最後のページの表示
    @wd.find_element(:xpath, "//div[@id='paginator-top']//a[.='最後のページ']").click
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_pagenavs @wd, 100, '最初のページ « 前ページ ... 96 97 98 99 100'
    check_rows @wd, [991, 992, 993, 994, 995, 996, 997, 998, 999, 1000]

    # id でソート (昇順)
    @wd.get 'http://localhost:3000/?direction=asc&sort=id'
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_rows @wd, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    # id でソート (降順)
    @wd.find_element(:link_text, 'id').click
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_rows @wd, [1000, 999, 998, 997, 996, 995, 994, 993, 992, 991]
    # id でソート (昇順)
    @wd.find_element(:link_text, 'id').click
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_rows @wd, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    # 公開日でソート (昇順)
    @wd.get 'http://localhost:3000/?direction=asc&sort=open_at'
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_rows @wd, [1000, 999, 998, 997, 996, 995, 994, 993, 992, 991]
    # 公開日でソート (降順)
    @wd.find_element(:link_text, '公開日').click
    wait_loaded
    check_rows @wd, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    # 公開日でソート (昇順)
    @wd.find_element(:link_text, '公開日').click
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_rows @wd, [1000, 999, 998, 997, 996, 995, 994, 993, 992, 991]

    # 名前でソート (昇順)
    @wd.get 'http://localhost:3000/?direction=asc&sort=name'
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_rows @wd, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    # 名前でソート (降順)
    @wd.find_element(:link_text, '名前').click
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_rows @wd, [1000, 999, 998, 997, 996, 995, 994, 993, 992, 991]
    # 名前でソート (昇順)
    @wd.find_element(:link_text, '名前').click
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_rows @wd, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  example 'per_page 20' do
    @wd.get 'http://localhost:3000/downloads/indexKaminariTable'
    # 表示件数 20 にする
    wait_loaded
    unless @wd.find_element(:xpath, '//div[2]/table/thead/tr/th/select//option[2]').selected?
      @wd.find_element(:xpath, '//div[2]/table/thead/tr/th[4]/select//option[2]').click
    end
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1

    # ページナビオゲーションの内容のチェック
    wait_loaded
    check_pagenavs @wd, 1, '1 2 3 4 5 ... 次ページ » 最後のページ'
    ids = []
    (1..20).each { |i| ids << i }
    check_rows(@wd, ids)
  end

  example 'per_page 50' do
    @wd.get 'http://localhost:3000/downloads/indexKaminariTable'
    # 表示件数 50 にする
    wait_loaded
    unless @wd.find_element(:xpath, '//div[2]/table/thead/tr/th/select//option[3]').selected?
      @wd.find_element(:xpath, '//div[2]/table/thead/tr/th[4]/select//option[3]').click
    end

    # ページナビオゲーションの内容のチェック
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1

    check_pagenavs @wd, 1, '1 2 3 4 5 ... 次ページ » 最後のページ'
    ids = []
    (1..50).each { |i| ids << i }
    check_rows(@wd, ids)
  end

  example 'per_page 100' do
    @wd.get 'http://localhost:3000/downloads/indexKaminariTable'
    # 表示件数 100 にする
    wait_loaded
    unless @wd.find_element(:xpath, '//div[2]/table/thead/tr/th/select//option[4]').selected?
      @wd.find_element(:xpath, '//div[2]/table/thead/tr/th[4]/select//option[4]').click
    end

    # ページナビオゲーションの内容のチェック
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_pagenavs @wd, 1, '1 2 3 4 5 ... 次ページ » 最後のページ'
    ids = []
    (1..100).each { |i| ids << i }
    check_rows(@wd, ids)
  end

  example 'per_page 200' do
    @wd.get 'http://localhost:3000/downloads/indexKaminariTable'
    # 表示件数 200 にする
    wait_loaded
    unless @wd.find_element(:xpath, '//div[2]/table/thead/tr/th/select//option[5]').selected?
      @wd.find_element(:xpath, '//div[2]/table/thead/tr/th[4]/select//option[5]').click
    end

    # ページナビオゲーションの内容のチェック
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_pagenavs @wd, 1, '1 2 3 4 5 次ページ » 最後のページ'
    ids = []
    (1..200).each { |i| ids << i }
    check_rows(@wd, ids)
  end

  example 'per_page 400' do
    @wd.get 'http://localhost:3000/downloads/indexKaminariTable'
    # 表示件数 400 にする
    wait_loaded
    unless @wd.find_element(:xpath, '//div[2]/table/thead/tr/th/select//option[6]').selected?
      @wd.find_element(:xpath, '//div[2]/table/thead/tr/th[4]/select//option[6]').click
    end

    # ページナビオゲーションの内容のチェック
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_pagenavs @wd, 1, '1 2 3 次ページ » 最後のページ'
    ids = []
    (1..400).each { |i| ids << i }
    check_rows(@wd, ids)
  end

  example 'per_page 1000' do
    @wd.get 'http://localhost:3000/downloads/indexKaminariTable'
    # 表示件数 1000 にする
    wait_loaded
    unless @wd.find_element(:xpath, '//div[2]/table/thead/tr/th/select//option[7]').selected?
      @wd.find_element(:xpath, '//div[2]/table/thead/tr/th[4]/select//option[7]').click
    end

    # ページナビオゲーションの内容のチェック
    wait_loaded
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
    check_pagenavs @wd, 1, ''
    ids = []
    (1..1000).each { |i| ids << i }
    check_rows(@wd, ids)
  end

end
