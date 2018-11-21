# To use this module:
# - add "approved" column to database model
# - make sure it shows up in the view as something
# - edit the create method accordingly
# 
module Approvable
  extend ActiveSupport::Concern

  included do

    before_action -> {has_permission :approve}, only: [:approve, :reject]

    def approve
      @object = linked_model.find_by_hash_id(params[:id])
      @object.update_attribute(:approved, true)
      @object.update_column(:rejected, false)
      #redirect_to request.referrer
    end

    def reject
      @object = linked_model.find_by_hash_id(params[:id])
      @object.update_attribute(:approved, false)
      @object.update_column(:rejected, true)
    end

    def get_partial
      render partial: linked_model.find_by_hash_id(params[:id])
    end
  end

end