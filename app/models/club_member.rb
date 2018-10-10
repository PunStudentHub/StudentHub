class ClubMember < ApplicationRecord
  belongs_to :club
  belongs_to :user

  scope :accepted_members, -> {where(accepted: true)}
  scope :pending_members, -> {where(accepted: false)}
end
