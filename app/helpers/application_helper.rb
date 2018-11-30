require 'redcarpet'

module ApplicationHelper
  

  def markdown (text)
    renderer = Redcarpet::Render::HTML.new(filter_html: true, no_images: true, prettify: true, hard_wrap: true, space_after_headers: true, autolink: true)
    mdcarpet = Redcarpet::Markdown.new(renderer, {disable_indented_code_blocks: true, autolink: true})
    mdcarpet.render(text).html_safe
  end

  def get_background_color_for_partial object
    if object.approved && object.final
      ""
    elsif object.approved
      "yellow lighten-3"
    elsif object.rejected
      "red lighten-4"
    else
      "grey lighten-3"
    end
  end

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

  def has_permission(user, permission)
    permission_array = user.roles.map{ |r| r.send(permission)} 
    permission_array.include? true
  end

  def get_highest_rank_color user
    first_id = user.roles.map {|r| r.id}.sort[0]
    if first_id
      Role.find(first_id).color
    else
      ""
    end

  end

  # I did not write this.
  def distance_of_time_in_words(from_time, to_time = 0, options = {})
    options = {
      scope: :'datetime.distance_in_words'
    }.merge!(options)

    from_time = normalize_distance_of_time_argument_to_time(from_time)
    to_time = normalize_distance_of_time_argument_to_time(to_time)
    from_time, to_time = to_time, from_time if from_time > to_time
    distance_in_minutes = ((to_time - from_time) / 60.0).round
    distance_in_seconds = (to_time - from_time).round

    I18n.with_options locale: options[:locale], scope: options[:scope] do |locale|
      case distance_in_minutes
      when 0..1
        return distance_in_minutes == 0 ?
               locale.t(:less_than_x_minutes, count: 1) :
               locale.t(:x_minutes, count: distance_in_minutes) unless options[:include_seconds]

        case distance_in_seconds
        when 0..4   then locale.t :less_than_x_seconds, count: 5
        when 5..9   then locale.t :less_than_x_seconds, count: 10
        when 10..19 then locale.t :less_than_x_seconds, count: 20
        when 20..39 then locale.t :half_a_minute
        when 40..59 then locale.t :less_than_x_minutes, count: 1
        else             locale.t :x_minutes,           count: 1
        end

      when 2...45           then locale.t :x_minutes,      count: distance_in_minutes
      when 45...90          then locale.t :about_x_hours,  count: 1
        # 90 mins up to 24 hours
      when 90...1440        then locale.t :about_x_hours,  count: (distance_in_minutes.to_f / 60.0).round
        # 24 hours up to 42 hours
      when 1440...2520      then locale.t :x_days,         count: 1
        # 42 hours up to 30 days
      when 2520...43200     then locale.t :x_days,         count: (distance_in_minutes.to_f / 1440.0).round
        # 30 days up to 60 days
      when 43200...86400    then locale.t :about_x_months, count: (distance_in_minutes.to_f / 43200.0).round
        # 60 days up to 365 days
      when 86400...525600   then locale.t :x_months,       count: (distance_in_minutes.to_f / 43200.0).round
      else
        from_year = from_time.year
        from_year += 1 if from_time.month >= 3
        to_year = to_time.year
        to_year -= 1 if to_time.month < 3
        leap_years = (from_year > to_year) ? 0 : (from_year..to_year).count { |x| Date.leap?(x) }
        minute_offset_for_leap_year = leap_years * 1440
        # Discount the leap year days when calculating year distance.
        # e.g. if there are 20 leap year days between 2 dates having the same day
        # and month then the based on 365 days calculation
        # the distance in years will come out to over 80 years when in written
        # English it would read better as about 80 years.
        minutes_with_offset = distance_in_minutes - minute_offset_for_leap_year
        remainder                   = (minutes_with_offset % MINUTES_IN_YEAR)
        distance_in_years           = (minutes_with_offset.div MINUTES_IN_YEAR)
        if remainder < MINUTES_IN_QUARTER_YEAR
          locale.t(:about_x_years,  count: distance_in_years)
        elsif remainder < MINUTES_IN_THREE_QUARTERS_YEAR
          locale.t(:over_x_years,   count: distance_in_years)
        else
          locale.t(:almost_x_years, count: distance_in_years + 1)
        end
      end
    end
  end
end

