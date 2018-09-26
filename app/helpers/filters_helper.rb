module FiltersHelper
  def get_class_year_ids
    session[:class_year_ids] || ClassYear.all.map { |c| c.id.to_s }
  end

  def filter_class_years object
    object.joins(:class_years)
          .distinct
          .where(class_years: { id: get_class_year_ids})
  end

end
