class Reply < ActiveRecord::Base
	attr_accessible :content

	belongs_to :user
	belongs_to :micropost

	validates :content, length: {maximum:140}
	validates :user_id, presence:true
	validates :micropost_id, presence:true


	default_scope order: "replies.created_at DESC"
end
