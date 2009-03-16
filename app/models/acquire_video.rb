require 'mms2r'
require 'mms2r/media'
require 'tmail'

class AcquireVideo < ActionMailer::Base
  
  def receive(email)    
    user = User.find_by_login(email.to.first.strip.split(/@/).first)
    
    if user
      begin
        mms = MMS2R::Media.create(email, logger)    
        mms.process
        title = mms.get_subject
        title = "From my phone" if title.nil? || title.length == 0
        logger.info("title: #{title}")
        Clip.create!(:uploaded_data => mms.get_media, :user_id => user.id, :title => title)
      rescue => e
        logger.error("Error occurred: #{e.message}")
      ensure
        mms.purge
      end
    end
  end
end
