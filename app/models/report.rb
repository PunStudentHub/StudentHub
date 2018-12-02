class Report < ApplicationRecord
  belongs_to :user
  belongs_to :responder, class_name: "User", foreign_key: "responder_id", optional: true
end
