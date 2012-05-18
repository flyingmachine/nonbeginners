include Nanoc3::Helpers::Blogging
require 'pp'

module CustomHelpers
  def format_date(date)
    Time.parse(date).strftime("%d %B %Y")    
  end

  def link_to(text, item, html_class = nil)
    "<a href='#{item.path}' class='#{html_class}'>#{text}</a>"
  end

  class << self
    def kinds(*list)
      
    end
  end
  
  def article?(item)
    kind?(item, 'article')
  end

  def guide?(item)
    kind?(item, 'guide')
  end

  def kind?(item, kind)
    item[:kind] == kind
  end

  def additional_stylesheets(item)
    @item[:additional_stylesheets] || []
  end
end

include CustomHelpers
