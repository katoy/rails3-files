# -*- coding: utf-8 -*-

class Shots
  def initialize(screenshots, htmlshots)
    Dir.mkdir screenshots  unless File.exist? screenshots
    Dir.mkdir htmlshots    unless File.exist? htmlshots
    @screenshots = screenshots
    @htmlshots = htmlshots
    @seq_no = 0
  end

  def action_and_screenshot(wd, name, sub_no)
    sleep 0.5

    png_name = "#{@screenshots}/#{format('%04d', @seq_no)}-#{name}_#{sub_no}.png"
    puts "----- capture #{png_name}"
    wd.save_screenshot png_name

    http_name = "#{@htmlshots}/#{format('%04d', @seq_no)}-#{name}_#{sub_no}.html"
    File.write http_name, wd.page_source

    @seq_no += 1
  end
end
