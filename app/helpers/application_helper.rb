module ApplicationHelper
  def get_title page_name
    default_title = "Punahou Student Hub"
    if page_name.empty?
      default_title
    else
      page_name + " | " + default_title
    end

  end  

  def navbar_current?(button, page_title = '')
    if button == page_title
      'nav-item nav-link active' 
    else
      'nav-item nav-link'
    end
  end
end
