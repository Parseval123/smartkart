feature "manager test" do

it "with a market with status on false, manager should read that his market has been refused" do

@manager = FactoryGirl.create(:manager, name: 'Mario', surname: 'Rossi', yearofbirth: 1958, tel: '3395625489', email: 'rossi@gmail.com', curriculum: 'CurriculumRossi', password: 'foobar10')
@market1 = FactoryGirl.create(:market, address: 'via alessandro manzoni, 31, 03031 Aquino FR', group: 'Conad', info: 'Aperto dal lunedi al sabato//08.00-20.00', manager: @manager, status: false)

	visit loginm_path 
	assert page.has_content?("Log in as Manager")
	assert page.has_title?("Log in as Manager")
	fill_in "session_email", with: "rossi@gmail.com"	
	fill_in "session_password", with: "foobar10"
	click_button('Log in')
	expect(page.status_code).to be 200
	assert page.has_content?("We're sorry Mario but your market has been refused")

end

it "with a market with status on true, manager should read that his market has been accepted " do

@manager = FactoryGirl.create(:manager, name: 'Mario', surname: 'Rossi', yearofbirth: 1958, tel: '3395625489', email: 'rossi@gmail.com', curriculum: 'CurriculumRossi', password: 'foobar10')
@market1 = FactoryGirl.create(:market, address: 'via alessandro manzoni, 31, 03031 Aquino FR', group: 'Conad', info: 'Aperto dal lunedi al sabato//08.00-20.00', manager: @manager, status: true)

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
