class ApplicationController < ActionController::Base
  include SessionsHelper

  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to root_url
      end
    end

    def has_permission permission
      if not logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to root_url
      else
        if current_user.roles.any?
          if current_user.can_do permission
            return
          end
        end
        flash[:danger] = "You aren't allowed to do that!"
        redirect_to(root_url)
      end
    end

    def not_banned
      if not logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to root_url
      else
        if current_user.roles.any?
          if current_user.can_do :banned
            flash[:danger] = "You are currently banned."
            redirect_to(root_url)
          end
        end
      end
    end

    def correct_user permission_level
      if logged_in?
        @user = User.find_by_hash_id(params[:id])
        unless (current_user?(@user) || current_user.can_do(permission_level))
          flash[:danger] = "You aren't allowed to do that!"
          redirect_to root_url
        end
      else
        flash[:warning] = "Please log in!"
        redirect_to root_url
      end
    end


end
