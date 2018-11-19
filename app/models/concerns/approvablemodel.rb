module ApprovableModel
  extend ActiveSupport::Concern

  included do
    scope :approved, -> {where(approved: true)}
    scope :rejected, -> {where(rejected: true)}
    scope :awaiting_approval, -> {where(approved: true).where(rejected: true)}
  end
end