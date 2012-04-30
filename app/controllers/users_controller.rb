#encoding : utf-8
class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:index,:edit, :update, :destroy,
									:following, :followers]
	before_filter :correct_user, only: [ :edit, :update]
	before_filter :admin_user ,only: :destroy


	def following
    @title = "关注"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "粉丝"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
	
	def index
		@users = User.paginate(page: params[:page])
	end
  def new
		@user = User.new

  end

	def show
		@user = User.find(params["id"])
		@microposts = @user.microposts.paginate(page: params[:page])
	end
	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "欢迎来到扯谈团！"
			redirect_back_or @user	
		else
			render 'new'
		end
	end


	def edit
		@user= User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated"
			sign_in @user
			redirect_to @user

		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User destroyed."
		redirect_to users_path
	end

	private

		def correct_user
			user = User.find(params[:id])
			#user == current_user
			redirect_to(root_path) unless current_user?(user)
		end

		def admin_user
			redirect_to(root_path) unless current_user.admin? && current_user.id.to_s != params[:id]
		end
end
