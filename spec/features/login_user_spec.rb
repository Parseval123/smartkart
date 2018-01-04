require 'rails_helper'

feature "login user" do

	before(:each) do
		  @user = FactoryGirl.create(:user0)
	end

	it "people make login in order to use app functionalities"  do 

	      visit login_path
	      fill_in "session_email" , with: @user.email 
	      fill_in "session_password" , with: @user.password
	      click_button('Log in')
	      expect(page.status_code).to be 200
	      assert page.has_content?("Welcome Flavio!!!!")
	      assert page.has_content?("What do you want to do?")

	end

end
