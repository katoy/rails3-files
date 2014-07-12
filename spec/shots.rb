# -*- coding: utf-8 -*-

class Shots
  def initialize
    @seq_no = 0
  end

  def action_and_screenshot(wd, name, sub_no)
    sleep 0.5

    png_name = "#{SCREENSHOTS_DIR}/#{format('%04d', @seq_no)}-#{name}_#{sub_no}.png"
    puts "----- capture #{png_name}"
    wd.save_screenshot png_name

    http_name = "#{HTMLSHOTS_DIR}/#{format('%04d', @seq_no)}-#{name}_#{sub_no}.html"
    File.write http_name, wd.page_source

    @seq_no += 1
  end
end
