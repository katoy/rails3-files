# -*- coding: utf-8 -*-

# Selenium Builderで生成した ruby をベースにして作成する。
#    http://sebuilder.github.io/se-builder/

require 'selenium-webdriver'
require_relative './shots'
require_relative './story000'
require_relative './story001'
require_relative './story002'

SCREENSHOTS_DIR = 'selenium-screenshots'
HTMLSHOTS_DIR = 'selenium-htmlpshots'

DRIVER = Selenium::WebDriver.for :firefox

class StoryAll

  include Story000
  include Story001
  include Story002

  def self.story(wd, shots)
    # Story000.story wd, shots
    Story001.story wd, shots
    Story002.story wd, shots
  end
end

# --- mein ----
driver = DRIVER
shots = Shots.new(SCREENSHOTS_DIR, HTMLSHOTS_DIR)

StoryAll.story driver, shots

driver.close
driver.quit

# --- End of File ---
