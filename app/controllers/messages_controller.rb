class MessagesController < ApplicationController
  def index
  end

  def new
		@message = Message.new
  end

  def show
  end

  def destroy
  end

  def create
		message=send_message(params[:message][:receiver], params[:message][:content])
		receiver = User.find_by_name(params[:message][:receiver])
		send_notify([receiver], message)
		redirect_to messages_path
		
  end

	private
		def send_message(receiver, content)
			receiver = User.find_by_name(receiver)
			if receiver
				message = current_user.send_messages.build(
					content: content)
				receiver.received_messages << message
				message
			else
				false
			end
			
		end	
			
			
end
