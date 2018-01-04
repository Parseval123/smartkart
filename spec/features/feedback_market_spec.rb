feature "test feedmarket markets" do

before(:each) do

	@user = FactoryGirl.create(:user3)	

	@market1 = FactoryGirl.create(:market, address: 'via alessandro manzoni, 31, 03031 Aquino FR', group: 'Conad', info: 'Aperto dal lunedi al sabato//08.00-20.00', manager: nil)
	@market2 = FactoryGirl.create(:market, address: 'via risorgimento, 4, 03030 Piedimonte San Germano FR', group: 'Gecop', info: 'Aperto dalla Domenica al venerdi//08.00-20.00', manager: nil)
	@market3 = FactoryGirl.create(:market, address: 'corso achille spatuzzi, 1, 03047 San Giorgio A Liri FR', group: 'Sigma', info: 'Aperto dal lunedi al sabato//08.00-20.00 martedi riposo', manager: nil)
	@market4 = FactoryGirl.create(:market, address: 'strada statale casilina, 1, 03030 Piedimonte San Germano FR', group: 'Carrefour', info: 'si rispetteranno gli orari del centro commerciale', manager: nil)
	@market5 = FactoryGirl.create(:market, address: 'via melfi urbana, 1, 03037 Pontecorvo FR', group: 'Lidl', info: 'Aperto dal lunedi al sabato//08.00-20.30', manager: nil)
	
	      visit login_path
	      fill_in "session_email" , with: @user.email 
	      fill_in "session_password" , with: @user.password
	      click_button('Log in')
	      expect(page.status_code).to be 200
	      assert page.has_content?("Welcome Flavio!!!!")
	      assert page.has_content?("What do you want to do?")
	      fill_in "session_address2", with: "via saudoni, 42, 03030 Castrocielo FR"
	      fill_in "session_range2", with: 15
	      click_button('FEEDBACK MARKET')
	      expect(page.status_code).to be 200
	      save_and_open_page('test_feedbackmarket1.html')

end

it "test social capabilities" do


 click_link ('Conad via alessandro manzoni, 31, 03031 Aquino FR')
 expect(page.status_code).to be 200
 assert page.has_title?("Conad | SMART KART")
 assert page.has_content?("Release a micropost")
 save_and_open_page('test_feedbackmarket2.html')
 click_link('Release a micropost') 
 expect(page.status_code).to be 200
 assert page.has_title?("ComposeYourMicropost | SMART KART")
 assert page.has_content?("Hi Flavio, COMPOSE YOUR MICROPOST")
 fill_in "micropost_content", with: "this is a test"
 fill_in "micropost_vote", with: 5
 click_button('Post')
 expect(page.status_code).to be 200
 assert page.has_title?("Conad | SMART KART")
 assert page.has_content?("Flavio Forlini")
  assert page.has_content?("this is a test")
  assert page.has_content?("vote:5/5")
 save_and_open_page('feedbacktest_concluded.html')
  

end

end
