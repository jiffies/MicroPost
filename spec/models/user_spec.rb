# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe User do
	before {@user = User.new(name:"Example User", email:"user@example.com",
						password:"foobar",password_confirmation:"foobar")}
	
	subject {@user}
	it {should respond_to(:name)}
	it {should respond_to(:password_digest)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}
	it {should respond_to(:email)}
	it {should respond_to(:remember_token)}
	it {should be_valid}
	describe "when name is blank" do
		before {@user.name =""}
		it {should_not be_valid}
	end

	describe "when email is not present" do
		before {@user.email=""}
		it {should_not be_valid}
	end
	describe "when name is too long " do
		before {@user.name="a" *51}
		it {should_not be_valid}
	end
	
	describe "when email format is invalid" do
		it "should be invalid" do
			address = %w[user@foo,com user_at_goo.org example.user@foo.]
			address.each do |ia|
				@user.email = ia
				@user.should_not be_valid
			end
		end
	end
	describe "when email format is valid" do
		it "should be valid" do
			address = %w[user@foo.com A_USER@f.org first.lsd@foo.jp a+b@baz.cn]
			address.each do |ia|
				@user.email = ia
				@user.should be_valid
			end
		end
	end

	describe "when email is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.save
		end
		it {should_not be_valid}
	end

	describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end







end
