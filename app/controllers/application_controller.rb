class ApplicationController < ActionController::Base
 #require 'logger'
 #@dnevnik = Logger.new("#{Rails.root}/log/dnevnik.log")
 before_action :log_actions
  protect_from_forgery with: :exception
  include SessionsHelper
  

  def shortbrowser(mybrowser)
    case mybrowser 
      when /MSIE/     then "ie"
      when /Chrome/   then "chrome"
      when /Firefox/  then "firefox"
      when /Safari/   then "safari"
      else mybrowser
    end
  end 
  


  #def before_save
   # _logger.info("Creating user with name #{self.name}")
  #end
  def log_actions
    CUSTOM_LOGGER.debug "#{request.path} #{shortbrowser(request.user_agent)}"
  end
  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        #store_location
        #lash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
