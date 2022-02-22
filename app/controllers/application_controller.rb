class ApplicationController < ActionController::Base

    def current_user
        @current_user = User.first
        # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_login
        redirect_to login_path unless logged_in?
    end

    def log_user_in(user)
        session[:user_id] = user.id
        redirect_to root_path
    end

end
