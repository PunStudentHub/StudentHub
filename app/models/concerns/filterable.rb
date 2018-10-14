module Filterable
  extend ActiveSupport::Concern

  included do
    scope :filter_class_years, -> (user) {
      joins(:class_years)
      .where(class_years: { id: user.smart_class_year_ids} )
      .distinct
    }
  end


end