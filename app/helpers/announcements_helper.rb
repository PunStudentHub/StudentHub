module AnnouncementsHelper
  def filter_announcements_class_years
    Announcement.joins(:class_years)
                .distinct
                .where(class_years: { id: get_class_year_ids})
  end
end
