class UserNotifier < ActionMailer::Base
  include ActionController::UrlWriter
  default_url_options[:host] = 'CHANGE_THIS'
  
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
  
    @body[:url]  = url_for(:controller => "users", :action => "activate") + "/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = url_for(:controller => "homes", :action => "show")
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "video@filmprmail.com"
      @subject     = "[Video Upload] Welcome to our site"
      @sent_on     = Time.now
      @body[:user] = user
    end
end
