# -*- coding: utf-8 -*-

# Selenium Builderで生成した ruby をベースにして作成する。
#    http://sebuilder.github.io/se-builder/

require 'selenium-webdriver'
require_relative './shots'

module Story002

  NAME = 'story_002'

  # rubocop:disable Style/MethodLength
  def self.story(wd, shots)

    name = NAME
    sub_no = 0

    wd.get "http://localhost:3000/downloads/indexKaminari"
    shots.action_and_screenshot wd, name, sub_no += 1

    s = wd.find_element(:xpath, '//div/table/tbody/tr[1]/td[1]').text
    puts s
    s = wd.find_element(:xpath, '//div/table/tbody/tr[2]/td[1]').text
    puts s

    wd.find_element(:id, "more_link").click
    shots.action_and_screenshot wd, name, sub_no += 1

    wd.find_element(:css, "div.center").click
    shots.action_and_screenshot wd, name, sub_no += 1

    wd.find_element(:id, "more_link").click
    shots.action_and_screenshot wd, name, sub_no += 1
  end
end

# --- End of File ---
