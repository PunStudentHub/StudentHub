module FiltersHelper
  def get_class_year_ids
    session[:class_year_ids] || []
  end

end
