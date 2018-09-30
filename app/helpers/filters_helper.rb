module FiltersHelper
  def get_class_year_ids
    session[:class_year_ids] || ClassYear.all.map { |c| c.id.to_s }
  end

  def filter_class_years object
    if logged_in?
      object.joins(:class_years)
            .distinct
            .where(class_years: { id: current_user.smart_class_year_ids})
    else
      object.all
    end
  end

end
