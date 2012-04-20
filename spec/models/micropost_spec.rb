# == Schema Information
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Micropost do
	let(:user) {FactoryGirl.create(:user)}
	before do
		@micropost = user.microposts.build(content: "Lorem ipsum")
	end

	subject {@micropost}

	it {should respond_to(:content)}
	it {should respond_to(:user_id)}
end
