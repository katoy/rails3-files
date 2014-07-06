# -*- coding: utf-8 -*-

# Selenium Builderで生成した ruby をベースにして作成する。
#    http://sebuilder.github.io/se-builder/

require 'selenium-webdriver'
require_relative './shots'

SCREENSHOTS_DIR = 'selenium-screenshots'
HTTPSHOTS_DIR = 'selenium-httpshots'

STORY_NAME = 'story_001'
DRIVER = Selenium::WebDriver.for :firefox

# rubocop:disable Style/MethodLength
def story(wd, name)

  shots = Shots.new

  sub_no = 0

  wd.get 'http://localhost:3000/'
  shots.action_and_scrennshot wd, name, sub_no += 1

  unless wd.find_element(:xpath, '//div[2]/table/thead/tr/th[4]/select//option[1]').selected?
    wd.find_element(:xpath, '//div[2]/table/thead/tr/th[4]/select//option[1]').click
  end
  shots.action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, 'id').click
  shots.action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, 'id').click
  shots.action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, '公開日').click
  shots.action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, '公開日').click
  shots.action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, '名前').click
  shots.action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, '名前').click
  shots.action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, '2').click
  shots.action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, '3').click
  shots.action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, '最後のページ').click
  shots.action_and_scrennshot wd, name, sub_no += 1

  wd.find_element(:link_text, '最初のページ').click
  shots.action_and_scrennshot wd, name, sub_no += 1
end

# --- mein ----
driver = DRIVER
story driver, STORY_NAME
driver.close
driver.quit

# --- End of File ---
