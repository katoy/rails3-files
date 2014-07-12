# -*- coding: utf-8 -*-

# Selenium Builderで生成した ruby をベースにして作成する。
#    http://sebuilder.github.io/se-builder/

require 'selenium-webdriver'
require_relative './shots'

module Story000

  NAME = 'story_000'

  # rubocop:disable Style/MethodLength
  def self.story(wd, shots)

    name = NAME
    sub_no = 0

    # wd.get 'http://localhost:3000/'
    wd.get 'http://localhost:3000/downloads'

    wd.execute_script("return alert(1);")
    alert = wd.switch_to.alert
    puts alert.text
    sleep 2
    alert.accept

    shots.action_and_screenshot wd, name, sub_no += 1

    # wd.find_element(:id, 'file-list').click
    unless wd.find_element(:xpath, "//table[@class='zebra_stripe']//select[normalize-space(.)='10 20 50 100 200 400 1000']//option[2]").selected?
      wd.find_element(:xpath, "//table[@class='zebra_stripe']//select[normalize-space(.)='10 20 50 100 200 400 1000']//option[2]").click
    end
    shots.action_and_screenshot wd, name, sub_no += 1

    unless wd.find_element(:xpath, "//table[@class='zebra_stripe']//select[normalize-space(.)='10 20 50 100 200 400 1000']//option[1]").selected?
      wd.find_element(:xpath, "//table[@class='zebra_stripe']//select[normalize-space(.)='10 20 50 100 200 400 1000']//option[1]").click
    end
    shots.action_and_screenshot wd, name, sub_no += 1

    wd.find_element(:link_text, 'No.').click
    shots.action_and_screenshot wd, name, sub_no += 1

    wd.find_element(:link_text, 'No.').click
    shots.action_and_screenshot wd, name, sub_no += 1

    wd.find_element(:link_text, '公開日').click
    shots.action_and_screenshot wd, name, sub_no += 1

    wd.find_element(:link_text, '公開日').click
    shots.action_and_screenshot wd, name, sub_no += 1

    wd.find_element(:link_text, '名前').click
    shots.action_and_screenshot wd, name, sub_no += 1

    wd.find_element(:link_text, '2').click
    shots.action_and_screenshot wd, name, sub_no += 1

    wd.find_element(:link_text, '3').click
    shots.action_and_screenshot wd, name, sub_no += 1

    wd.find_element(:link_text, '4').click
    shots.action_and_screenshot wd, name, sub_no += 1

    wd.find_element(:link_text, '1').click
    shots.action_and_screenshot wd, name, sub_no += 1
  end
end
# --- End of File ---
