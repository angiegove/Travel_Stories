class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authentication #like a before do, before anything happens this happens

  private #must go at bottom of file it effects everything after it.

    def authentication

      @current_user = User.find_by_id session[:user_id] unless session[:user_id].nil?


      # If we didn't log anyone in, clear out the sessions so we don't try again.
      if @current_user.nil?
        session[:user_id] = nil
      end
    end
end
