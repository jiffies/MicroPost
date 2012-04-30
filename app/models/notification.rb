# == Schema Information
#
# Table name: notifications
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  source     :string(255)
#  source_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  read       :boolean         default(FALSE)
#

class Notification < ActiveRecord::Base
	attr_accessible :source
	belongs_to :user



	####method######
	def read_notify
		update_attribute :read, true
	end
end
