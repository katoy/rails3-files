# -*- coding: utf-8 -*-

# Selenium Builderで生成した ruby をベースにして作成する。
#    http://sebuilder.github.io/se-builder/

require 'selenium-webdriver'

module Story_001

  NAME = 'story_001'

  # rubocop:disable Style/MethodLength
  def self.story(wd, shots)

    name = NAME
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
end

# --- End of File ---
