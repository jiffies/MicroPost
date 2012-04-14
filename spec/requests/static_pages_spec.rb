require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
			visit '/static_pages/home'
			page.should have_content('Sample App')
    end
		
		it "should have the title 'Home'" do
			visit '/static_pages/home'
			page.should_not have_selector('title',
							:text => "| Home")
		end
		it "should have the base title" do
			visit '/static_pages/home'
			page.should have_selector('title',
							:text => "Ruby on Rails Tutorial Sample App")
		end
  end
  describe "Help page" do
    it "should have content 'Help'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
			visit '/static_pages/help'
			page.should have_content('Help')
    end
		it "should have the title 'Help'" do
			visit '/static_pages/help'
			page.should have_selector('title',
							:text => "Ruby on Rails Tutorial Sample App | Help")
		end
  end
  describe "About page" do
    it "should have content 'About Us'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
			visit '/static_pages/about'
			page.should have_content("About Us")
    end
		it "should have the title 'about us'" do
			visit '/static_pages/about'
			page.should have_selector('title',
							:text => "Ruby on Rails Tutorial Sample App | About Us")
		end
	end
	describe "contact us" do
		it "should have content 'Contact Us'" do
# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
			visit '/static_pages/contact'
			page.should have_content('Contact Us')
		end
		it "should have the title 'Contact Us'" do
			visit '/static_pages/contact'
			page.should have_selector('title',
			:text => "Ruby on Rails Tutorial Sample App | Contact Us")
		end
  end
end
