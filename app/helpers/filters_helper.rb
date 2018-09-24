module FiltersHelper
  def get_class_year_ids
    session[:class_year_ids] || ClassYear.all.map { |c| c.id.to_s }
  end

end
