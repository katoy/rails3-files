module DownloadsHelper

  def time_rand from = 0.0, to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
  end

  def datetime_to_str(dt)
    # dt.strftime("%Y年%m月%d日 %H:%M:%S")
    I18n.l dt, format: :long   # see "ja.time.formats.long" in config/locales/*.yml
  end

  def t_attr(attr, model = "download") 
    I18n.t(attr, {scope: :"activerecord.attributes.#{model}"})
  end

  def sortable(attr, at_sort, direction)

    def add_icon(attr, at_sort, direction)
      ans = ''
      if at_sort == attr
        # arrow = direction == 'desc'? 'down' : 'up'
        # ans = "<i class='icon-arrow-#{arrow}'></i>"
        arrow = direction == 'desc'? 'v' : '^'
        ans = arrow
      end
      ans
    end

    next_dir = (direction == 'asc')? 'desc' : 'asc'
    ans = link_to t_attr(attr), sort: attr, direction: next_dir
    ans += ' '
    ans += add_icon(attr, at_sort, direction).html_safe
  end
  
end
