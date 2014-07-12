require 'rubygems'
require 'selenium-webdriver'

# wd = Selenium::WebDriver.for :firefox
wd = Selenium::WebDriver.for :chrome

wd.get "http://localhost:3000/downloads"
wd.find_element(:link_text, "2").click
wd.find_element(:link_text, "3").click
wd.find_element(:link_text, "4").click
wd.quit
