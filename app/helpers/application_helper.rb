module ApplicationHelper
  
  def title
    base_title = "Sodalis | Life! Time! Place!"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Sodalis", :class => "round" )
  end
end
