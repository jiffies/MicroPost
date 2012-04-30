class NotificationsController < ApplicationController
	
	def show
		notification = Notification.find_by_id(params[:id])		
		notification.read_notify
		redirect_to checkout_notify_path(notification)
	end

	def index
		@user = User.find(params[:user_id])
		@notifications = @user.notifications		
		render 'show_notify'
	end
end
