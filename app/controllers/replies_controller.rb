class RepliesController < ApplicationController
	before_filter :reply_author?,only: :destroy

  def index
		@micropost = Micropost.find_by_id(params[:micropost_id])
		@user = @micropost.user
		@replies = @micropost.replies
		@reply = Reply.new
  end

  def create
		reply = current_user.replies.build(content: params[:reply][:content])
		micropost = Micropost.find_by_id(params[:micropost_id])
		if micropost
			micropost.replies << reply
			send_notify([micropost.user],reply)
			redirect_to micropost_replies_path(micropost)
		else
			redirect_to root_path, notice[:error]="reply failed"
		end
		
  end

  def destroy
		micropost = Micropost.find_by_id(params[:micropost_id])
		reply = Reply.find_by_id(params[:id])
		micropost.replies.delete(reply) if micropost && reply
		redirect_to micropost_replies_path(micropost)
		
  end

  def update
  end

	private
		def reply_author?
			@micropost = Micropost.find_by_id(params[:micropost_id])
			@reply = Reply.find_by_id(params[:id])
			redirect_to root_path unless @reply.user == current_user
			
		end


end
