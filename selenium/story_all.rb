# -*- coding: utf-8 -*-

# Selenium Builderで生成した ruby をベースにして作成する。
#    http://sebuilder.github.io/se-builder/

require 'selenium-webdriver'
require_relative './shots'
require_relative './story_000'
require_relative './story_001'
require_relative './story_002'

SCREENSHOTS_DIR = 'selenium-screenshots'
HTTPSHOTS_DIR = 'selenium-httpshots'

DRIVER = Selenium::WebDriver.for :firefox

class Story_all

  include Story_000
  include Story_001
  include Story_002

  def self.story wd
    shots = Shots.new

    Story_000.story wd, shots
    Story_001.story wd, shots
    Story_002.story wd, shots
  end
end

# --- mein ----
driver = DRIVER

Story_all.story driver 

driver.close
driver.quit

# --- End of File ---
