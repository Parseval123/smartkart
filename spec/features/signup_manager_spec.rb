require 'rails_helper'

feature "signup_manager_test" do

 include SessionsmHelper

before(:each) do

visit root_path 
click_link('Sign Up Manager')

assert page.has_title?("Sign up Manager")
fill_in "manager_name", with: "Francesco"
fill_in "manager_surname", with: "Gagliardo"
fill_in "manager_yearofbirth", with: "1993"
fill_in "manager_email", with: "gagliardo@gmail.com"
fill_in "manager_tel", with: 343352442
fill_in "manager_curriculum", with: "gagliardo CV"
fill_in "manager_password", with: "foobar10"
fill_in "manager_password_confirmation", with: "foobar10"
click_button('Create my account')
expect(page.status_code).to be 200
assert page.has_title?("AddMarket | SMART KART")

end


it "with right attributes a manager should wait for an admin to approve his market" do

fill_in "market[group]", with: "Lidl"
fill_in "market[address]", with: "via alessandro manzoni, 31, 03031 Aquino FR"
fill_in "market[info]", with: "aperto 24 ore su 24" 
click_button('add market')
expect(page.status_code).to be 200
assert page.has_content?("Your market needs the approvation of our admins. They're checking your informations right now.")

end



it "with a unexisting address " do

fill_in "market[group]", with: "Lidl"
fill_in "market[address]", with: "via unicorni celesti, 31, 03031 Aquino FR"
fill_in "market[info]", with: "aperto 24 ore su 24" 
click_button('add market')
assert page.has_content?("your address does not exist")

end

it "adding a market with group field blank" do

fill_in "market[group]", with: ""
fill_in "market[address]", with: "via unicorni celesti, 31, 03031 Aquino FR"
fill_in "market[info]", with: "aperto 24 ore su 24" 
click_button('add market')
assert page.has_content?("Group can't be blank")

end

it "adding a market with group field blank" do

fill_in "market[group]", with: "lidl"
fill_in "market[address]", with: "via unicorni celesti, 31, 03031 Aquino FR"
fill_in "market[info]", with: "" 
click_button('add market')
assert page.has_content?("Info can't be blank")

end


end

