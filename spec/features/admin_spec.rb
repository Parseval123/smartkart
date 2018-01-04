feature "admin test" do

before(:each) do

@admin = FactoryGirl.create(:admin, name: 'pablo', surname: 'navarro', email: 'navarro@gmail.com', password: 'foobar10', password_confirmation: 'foobar10')
@manager = FactoryGirl.create(:manager, name: 'Mario', surname: 'Rossi', yearofbirth: 1958, tel: '3395625489', email: 'rossi@gmail.com', curriculum: 'CurriculumRossi', password: 'foobar10')
@market1 = FactoryGirl.create(:market, address: 'via alessandro manzoni, 31, 03031 Aquino FR', group: 'Conad', info: 'Aperto dal lunedi al sabato//08.00-20.00', manager: @manager, status: nil)
@creationreport = FactoryGirl.create(:creationreport, market: @market1, manager: @manager)
@market2 = FactoryGirl.create(:market, address: 'via alessandro manzoni, 31, 03031 Aquino FR', group: 'Conad', info: 'Aperto dal lunedi al sabato//08.00-20.00', manager: @manager, status: nil)

end

	it "admins denying market" do

	visit logina_path
	assert page.has_content?("Log in as Admin")
	assert page.has_title?("Log in as ADMIN | SMART KART")
	fill_in "session_email", with: "navarro@gmail.com"	
	fill_in "session_password", with: "foobar10"
	click_button('Log in')
	save_and_open_page("admin_dashboard_with_one_report.html")
	expect(page.status_code).to be 200
	assert page.has_content?("Manager : Mario is waiting for his market to be approved")
	click_button('deny')
	expect(page.status_code).to be 200
	assert page.has_content?("There are no Creation reports at this moment")
	save_and_open_page("admin_dashboard_without_reports.html")
	click_link('Log Out')
	#i'm going to test if a market has been really denied from the manager point of view
	visit loginm_path 
	assert page.has_content?("Log in as Manager")
	assert page.has_title?("Log in as Manager")
	fill_in "session_email", with: "rossi@gmail.com"	
	fill_in "session_password", with: "foobar10"
	click_button('Log in')
	expect(page.status_code).to be 200
	assert page.has_content?("We're sorry Mario but your market has been refused")
	save_and_open_page("manager_market_refused.html")

	end

	it "admins accepting market" do

	visit logina_path
	assert page.has_content?("Log in as Admin")
	assert page.has_title?("Log in as ADMIN | SMART KART")
	fill_in "session_email", with: "navarro@gmail.com"	
	fill_in "session_password", with: "foobar10"
	click_button('Log in')
	expect(page.status_code).to be 200
	assert page.has_content?("Manager : Mario is waiting for his market to be approved")
	click_button('confirm')
	expect(page.status_code).to be 200
	assert page.has_content?("There are no Creation reports at this moment")
	click_link('Log Out')
	#i'm going to test if a market has been really confirmed from the manager point of view
	visit loginm_path 
	assert page.has_content?("Log in as Manager")
	assert page.has_title?("Log in as Manager")
	fill_in "session_email", with: "rossi@gmail.com"	
	fill_in "session_password", with: "foobar10"
	click_button('Log in')
	expect(page.status_code).to be 200
	assert page.has_content?("add products to your supermarket")

	end

end
