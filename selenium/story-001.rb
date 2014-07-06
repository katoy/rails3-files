# -*- coding: utf-8 -*-

# Selenium Builderで生成した ruby をベースにして作成する。
#    http://sebuilder.github.io/se-builder/

require 'rubygems'
require 'selenium-webdriver'

$seq_no = 0
SCREENSHOTS_DIR = 'selenium-screenshots'
HTTPSHOTS_DIR = 'selenium-httpshots'

STORY_NAME = 'story-001'
DRIVER = Selenium::WebDriver.for :firefox

def init
  FileUtils.rm_rf SCREENSHOTS_DIR
  FileUtils.rm_rf HTTPSHOTS_DIR
  Dir.mkdir SCREENSHOTS_DIR
  Dir.mkdir HTTPSHOTS_DIR
end

def action_and_scrennshot(wd, name, sub_no)
  sleep 0.5

  png_name = "#{SCREENSHOTS_DIR}/#{format('%04d', $seq_no)}-#{name}_#{sub_no}.png"
  puts "----- capture #{png_name}"
  wd.save_screenshot png_name

  http_name = "#{HTTPSHOTS_DIR}/#{format('%04d', $seq_no)}-#{name}_#{sub_no}.html"
  File.write http_name, wd.page_source

  $seq_no += 1
end

def story(wd, name)

  sub_no = 0

  wd.get "http://localhost:3000/"
  action_and_scrennshot wd, name, sub_no += 1

  if not wd.find_element(:xpath, "//div[2]/table/thead/tr/th[4]/select//option[1]").selected?
    wd.find_element(:xpath, "//div[2]/table/thead/tr/th[4]/select//option[1]").click
  end
  action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, "id").click
  action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, "id").click
  action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, "公開日").click
  action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, "公開日").click
  action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, "名前").click
  action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, "名前").click
  action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, "2").click
  action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, "3").click
  action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, "最後のページ").click
  action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, "最初のページ").click
  action_and_scrennshot wd, name, sub_no += 1
end

# --- mein ----
init
driver = DRIVER
story driver, STORY_NAME
driver.close
driver.quit
