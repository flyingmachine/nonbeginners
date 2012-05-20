include Nanoc3::Helpers::Blogging
require 'pp'

module CustomHelpers
  def format_date(date)
    Time.parse(date).strftime("%d %B %Y")    
  end

  def link_to(text, item, html_class = nil)
    "<a href='#{item.path}' class='#{html_class}'>#{text}</a>"
  end

  def kind?(item, kind)
    item[:kind] == kind
  end
  
  def article?(item)
    kind?(item, 'article')
  end

  def guide?(item)
    kind?(item, 'guide')
  end

  def guides
    @items.select{ |i| guide?(item) }.sort{|a, b| a[:title] <=> b[:title]}
  end

  def additional_stylesheets(item)
    @item[:additional_stylesheets] || []
  end
end

include CustomHelpers
