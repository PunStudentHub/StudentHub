module AnnouncementsHelper
  def filter_announcements_class_years
    class_year_ids = session[:class_year_ids].map{|s| s.to_i}
    Announcement.joins(:class_years)
                .distinct
                .where(class_years: { id: class_year_ids})


  end
end
