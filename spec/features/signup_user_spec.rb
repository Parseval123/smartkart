require 'rails_helper'

feature "signup" do

it "people should reach the sign up page and have a valid sign up with right attributes" do

visit root_path 
click_link('Sign Up User')
assert page.has_content?("Sign up User")
assert page.has_title?("Sign up User")
fill_in "user_name", with: "christian"
fill_in "user_surname", with: "alonsi"
fill_in "user_address", with: "via alessandro severo, 71, 00145 Roma RM"
fill_in "user_yearofbirth", with: "1993"
fill_in "user_email", with: "alonsi@gmail.com"
fill_in "user_password", with: "foobar10"
fill_in "user_password_confirmation", with: "foobar10"
click_button('Create my account')
expect(page.status_code).to be 200
assert page.has_content?("Welcome christian")
assert page.has_content?("Smart Shopping")
assert page.has_content?("Feedback Market")

end

end

