class Message < ActiveRecord::Base
	attr_accessible :content
	belongs_to :sender, class_name:"User"
	belongs_to :receiver, class_name:"User"
end
