# -*- coding: utf-8 -*-

class Shots
  def initialize
    Dir.mkdir SCREENSHOTS_DIR  unless File.exist? SCREENSHOTS_DIR
    Dir.mkdir HTTPSHOTS_DIR    unless File.exist? HTTPSHOTS_DIR
    @seq_no = 0
  end

  def action_and_scrennshot(wd, name, sub_no)
    sleep 0.5

    png_name = "#{SCREENSHOTS_DIR}/#{format('%04d', @seq_no)}-#{name}_#{sub_no}.png"
    puts "----- capture #{png_name}"
    wd.save_screenshot png_name

    http_name = "#{HTTPSHOTS_DIR}/#{format('%04d', @seq_no)}-#{name}_#{sub_no}.html"
    File.write http_name, wd.page_source

    @seq_no += 1
  end
end
