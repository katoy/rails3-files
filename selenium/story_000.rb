# -*- coding: utf-8 -*-

# Selenium Builderで生成した ruby をベースにして作成する。
#    http://sebuilder.github.io/se-builder/

require 'selenium-webdriver'
require_relative './shots'

module Story_003

  NAME = 'story_000'

  # rubocop:disable Style/MethodLength
  def self.story(wd, shots)

    wd.get "http://localhost:3000/downloads"
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:id, "file-list").click
    if not wd.find_element(:xpath, "//table[@class='zebra_stripe']//select[normalize-space(.)='10 20 50 100 200 400 1000']//option[2]").selected?
      wd.find_element(:xpath, "//table[@class='zebra_stripe']//select[normalize-space(.)='10 20 50 100 200 400 1000']//option[2]").click
    end
    shots.action_and_scrennshot wd, name, sub_no += 1

    if not wd.find_element(:xpath, "//table[@class='zebra_stripe']//select[normalize-space(.)='10 20 50 100 200 400 1000']//option[1]").selected?
      wd.find_element(:xpath, "//table[@class='zebra_stripe']//select[normalize-space(.)='10 20 50 100 200 400 1000']//option[1]").click
    end
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:link_text, "No.").click
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:link_text, "No.").click
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:link_text, "公開日").click
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:link_text, "公開日").click
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:link_text, "名前").click
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:link_text, "2").click
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:link_text, "3").click
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:link_text, "4").click
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:link_text, "5").click
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:link_text, "50").click
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:link_text, "49").click
    shots.action_and_scrennshot wd, name, sub_no += 1

    wd.find_element(:link_text, "1").click
    shots.action_and_scrennshot wd, name, sub_no += 1
  end
end
# --- End of File ---
