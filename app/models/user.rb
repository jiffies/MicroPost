# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean         default(FALSE)
#

class User < ActiveRecord::Base
	#access control
	attr_accessible :name, :email,:password, :password_confirmation
	#associations
	has_many :microposts, dependent: :destroy
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :replies
	has_many :notifications,dependent: :destroy

	has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

	has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"
	has_many :send_messages, class_name: "Message", foreign_key: "sender_id"

	#password magic
	has_secure_password

	#callback
	before_save :create_remember_token

	#validates
	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[\w\d\-.]+\.\w+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
						uniqueness: {case_sensitive: false}
	validates :password, length: {minimum:6}
	validates :password_confirmation, presence:true

	#methods
	def feed
		Micropost.from_users_followed_by(self)
	end

	def following?(other_user)
		relationships.find_by_followed_id(other_user.id)
	end

	def follow!(other_user)
		relationships.create!(followed_id: other_user.id)
	end

	def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
	

	private
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end




end
