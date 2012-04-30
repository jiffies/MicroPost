class ApplicationController < ActionController::Base
  protect_from_forgery
	include SessionsHelper
	include UsersHelper
	
	before_filter :notify_read_count

	def notify_read_count
		if signed_in?
			@notify_read_count = current_user.notifications.where(read:false).size
			
		else
				##
		end
	end
		def send_notify(receiver,source)
			receiver.each do |r|
				notify=r.notifications.build(source: source.class.to_s)
				notify.source_id = source.id
				notify.save
			end
		end
end
