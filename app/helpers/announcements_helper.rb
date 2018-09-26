module AnnouncementsHelper
  def filter_class_years object
    object.joins(:class_years)
          .distinct
          .where(class_years: { id: get_class_year_ids})
  end
end
