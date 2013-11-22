class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    cookies[:job].present? ? fine_job_steps_path : root_path
  end

  protected

    def admin!
      if current_user
       redirect_to root_path unless current_user.admin == 1
     else
       redirect_to root_path
      end
    end
end
