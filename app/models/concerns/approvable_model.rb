module ApprovableModel
  extend ActiveSupport::Concern

  included do
    FILTER_OPTIONS = ["All", "Pending", "Approved", "Rejected", "My Class"]

    scope :approved, -> {where(approved: true)}
    scope :rejected, -> {where(rejected: true)}
    scope :awaiting_approval, -> {where(approved: false).where(rejected: false)}
  end
end