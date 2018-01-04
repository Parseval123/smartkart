require 'rails_helper'

feature "core function test" do

#initializing a data environment for tests
before(:each) do

	#test User

	@user = FactoryGirl.create(:user0)

	#product used for tests

	@product1 = FactoryGirl.create(:product, name: 'Mezze Penne', label: 'Barilla', package:'500gr', id: 1)
	@product2 = FactoryGirl.create(:product, name: 'Olio Extra Vergine', label: 'Monini', package:'1L', id: 2)
	@product3 = FactoryGirl.create(:product, name: 'Passata Di Pomodoro', label: 'Mutti', package:'400gr', id: 3)
	@product4 = FactoryGirl.create(:product, name: 'Caffe', label: 'Lavazza', package:'250gr', id: 4)
	@product5 = FactoryGirl.create(:product, name: 'Birra', label: 'Peroni', package:'0.66L', id: 5)
	@product6 = FactoryGirl.create(:product, name: 'Dentifricio', label: 'Mentadent', package:'75ml', id: 6)
	@product7 = FactoryGirl.create(:product, name: 'Fazzoletti', label: 'Scala', package:'12 Pezzi', id: 7)
	@product8 = FactoryGirl.create(:product, name: 'Detergente Per Vetri', label: 'Vetril', package:'650ml', id: 8)
	@product9 = FactoryGirl.create(:product, name: 'Tovaglioli', label: 'Regina', package:'50 Pezzi', id: 9)
	@product10 = FactoryGirl.create(:product, name: 'Smacchiatore', label: 'Omino Bianco', package:'1L', id: 10)

	#markets used for tests

	@market1 = FactoryGirl.create(:market, address: 'via alessandro manzoni, 31, 03031 Aquino FR', group: 'Conad', info: 'Aperto dal lunedi al sabato//08.00-20.00', manager: nil)
	@market2 = FactoryGirl.create(:market, address: 'via risorgimento, 4, 03030 Piedimonte San Germano FR', group: 'Gecop', info: 'Aperto dalla Domenica al venerdi//08.00-20.00', manager: nil)
	@market3 = FactoryGirl.create(:market, address: 'corso achille spatuzzi, 1, 03047 San Giorgio A Liri FR', group: 'Sigma', info: 'Aperto dal lunedi al sabato//08.00-20.00 martedi riposo', manager: nil)
	@market4 = FactoryGirl.create(:market, address: 'strada statale casilina, 1, 03030 Piedimonte San Germano FR', group: 'Carrefour', info: 'si rispetteranno gli orari del centro commerciale', manager: nil)
	@market5 = FactoryGirl.create(:market, address: 'via melfi urbana, 1, 03037 Pontecorvo FR', group: 'Lidl', info: 'Aperto dal lunedi al sabato//08.00-20.30', manager: nil)

	#owners used for tests
	
	#owners of market1

	FactoryGirl.create(:owner, stock: 50, price: 0.75, market:@market1, product:@product1)
	FactoryGirl.create(:owner, stock: 50, price: 3.99, market:@market1, product:@product2)
	FactoryGirl.create(:owner, stock: 50, price: 0.99, market:@market1, product:@product3)
	FactoryGirl.create(:owner, stock: 50, price: 2.99, market:@market1, product:@product4)
	FactoryGirl.create(:owner, stock: 50, price: 0.89, market:@market1, product:@product5)
	FactoryGirl.create(:owner, stock: 50, price: 1.33, market:@market1, product:@product6)
	FactoryGirl.create(:owner, stock: 50, price: 0.51, market:@market1, product:@product7)
	FactoryGirl.create(:owner, stock: 50, price: 1.47, market:@market1, product:@product8)
	FactoryGirl.create(:owner, stock: 50, price: 2.00, market:@market1, product:@product9)
	#FactoryGirl.create(:owner, stock: 50, price: 0.75, market:@market1, product:@product10)
	
	#owner of market2

	FactoryGirl.create(:owner, stock: 50, price: 0.63, market:@market2, product:@product1)
	FactoryGirl.create(:owner, stock: 50, price: 3.99, market:@market2, product:@product2)
	FactoryGirl.create(:owner, stock: 50, price: 0.87, market:@market2, product:@product3)
	FactoryGirl.create(:owner, stock: 50, price: 3.25, market:@market2, product:@product4)
	FactoryGirl.create(:owner, stock: 50, price: 0.90, market:@market2, product:@product5)
	FactoryGirl.create(:owner, stock: 50, price: 1.34, market:@market2, product:@product6)
	FactoryGirl.create(:owner, stock: 50, price: 0.54, market:@market2, product:@product7)
	FactoryGirl.create(:owner, stock: 50, price: 1.90, market:@market2, product:@product8)
	FactoryGirl.create(:owner, stock: 50, price: 2.10, market:@market2, product:@product9)
	FactoryGirl.create(:owner, stock: 50, price: 3.00, market:@market2, product:@product10)

	#owner of market3

	FactoryGirl.create(:owner, stock: 50, price: 0.63, market:@market3, product:@product1)
	FactoryGirl.create(:owner, stock: 50, price: 2.99, market:@market3, product:@product2)
	FactoryGirl.create(:owner, stock: 50, price: 0.52, market:@market3, product:@product3)
	FactoryGirl.create(:owner, stock: 50, price: 2.78, market:@market3, product:@product4)
	FactoryGirl.create(:owner, stock: 50, price: 1.25, market:@market3, product:@product5)
	FactoryGirl.create(:owner, stock: 50, price: 1.35, market:@market3, product:@product6)
	FactoryGirl.create(:owner, stock: 50, price: 0.75, market:@market3, product:@product7)
	FactoryGirl.create(:owner, stock: 50, price: 2.00, market:@market3, product:@product8)
	FactoryGirl.create(:owner, stock: 50, price: 2.11, market:@market3, product:@product9)
	FactoryGirl.create(:owner, stock: 50, price: 4.00, market:@market3, product:@product10)

	#owner of market4

	FactoryGirl.create(:owner, stock: 50, price: 0.50, market:@market4, product:@product1)
	FactoryGirl.create(:owner, stock: 50, price: 5.99, market:@market4, product:@product2)
	FactoryGirl.create(:owner, stock: 50, price: 0.87, market:@market4, product:@product3)
	FactoryGirl.create(:owner, stock: 50, price: 4.00, market:@market4, product:@product4)
	FactoryGirl.create(:owner, stock: 50, price: 1.00, market:@market4, product:@product5)
	FactoryGirl.create(:owner, stock: 50, price: 1.29, market:@market4, product:@product6)
	FactoryGirl.create(:owner, stock: 50, price: 0.60, market:@market4, product:@product7)
	FactoryGirl.create(:owner, stock: 50, price: 1.87, market:@market4, product:@product8)
	FactoryGirl.create(:owner, stock: 50, price: 1.99, market:@market4, product:@product9)
	FactoryGirl.create(:owner, stock: 50, price: 5.00, market:@market4, product:@product10)

	#owner of market5

	FactoryGirl.create(:owner, stock: 50, price: 0.72, market:@market5, product:@product1)
	FactoryGirl.create(:owner, stock: 50, price: 6.02, market:@market5, product:@product2)
	FactoryGirl.create(:owner, stock: 50, price: 1.12, market:@market5, product:@product3)
	FactoryGirl.create(:owner, stock: 50, price: 3.99, market:@market5, product:@product4)
	FactoryGirl.create(:owner, stock: 50, price: 2.00, market:@market5, product:@product5)
	FactoryGirl.create(:owner, stock: 50, price: 1.10, market:@market5, product:@product6)
	FactoryGirl.create(:owner, stock: 50, price: 0.50, market:@market5, product:@product7)
	FactoryGirl.create(:owner, stock: 50, price: 1.47, market:@market5, product:@product8)
	FactoryGirl.create(:owner, stock: 50, price: 2.05, market:@market5, product:@product9)
	#FactoryGirl.create(:owner, stock: 50, price: 5.00, market:@market5, product:@product10)
	

	visit login_path
	fill_in "session_email" , with: @user.email 
	fill_in "session_password" , with: @user.password
	click_button('Log in')
	expect(page.status_code).to be 200
	assert page.has_content?("Welcome Flavio!!!!")
	assert page.has_content?("What do you want to do?")
	
end

it "test # 1" do 

	fill_in "session_address" , with: "via saudoni, 42, 03030 Castrocielo FR"
	fill_in "session_range" , with: 30
	click_button('SMART SHOPPING')
	expect(page.status_code).to be 200
	assert page.has_content?("COMPILE YOUR SHOPPING LIST")
	select 'Mezze Penne Barilla 500gr', from: 'request_product_id'
	click_button('add product')
	select 'Olio Extra Vergine Monini 1L', from: 'request_product_id'
	click_button('add product')
	select 'Passata Di Pomodoro Mutti 400gr', from: 'request_product_id'
	click_button('add product')
	select 'Caffe Lavazza 250gr', from: 'request_product_id'
	click_button('add product')
	select 'Birra Peroni 0.66L', from: 'request_product_id'
	click_button('add product')
	select 'Dentifricio Mentadent 75ml', from: 'request_product_id'
	click_button('add product')
	select 'Fazzoletti Scala 12 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Detergente Per Vetri Vetril 650ml', from: 'request_product_id'
	click_button('add product')
	select 'Tovaglioli Regina 50 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Smacchiatore Omino Bianco 1L', from: 'request_product_id'
	click_button('add product')

	assert page.has_content?("Mezze Penne Barilla 500gr")
	assert page.has_content?("Olio Extra Vergine Monini 1L")
	assert page.has_content?("Passata Di Pomodoro Mutti 400gr")
	assert page.has_content?("Caffe Lavazza 250gr")
	assert page.has_content?("Birra Peroni 0.66L")
	assert page.has_content?("Dentifricio Mentadent 75ml")
	assert page.has_content?("Fazzoletti Scala 12 Pezzi")
	assert page.has_content?("Detergente Per Vetri Vetril 650ml")
	assert page.has_content?("Tovaglioli Regina 50 Pezzi")
	assert page.has_content?("Smacchiatore Omino Bianco 1L")

	fill_in "session_count" , with: 5
	click_button('Go to smart shopping')
	save_and_open_page('core_function_test#1.html')


end

it "test # 2" do 

	fill_in "session_address" , with: "via saudoni, 42, 03030 Castrocielo FR"
	fill_in "session_range" , with: 30
	click_button('SMART SHOPPING')
	expect(page.status_code).to be 200
	assert page.has_content?("COMPILE YOUR SHOPPING LIST")
	select 'Mezze Penne Barilla 500gr', from: 'request_product_id'
	click_button('add product')
	select 'Olio Extra Vergine Monini 1L', from: 'request_product_id'
	click_button('add product')
	select 'Passata Di Pomodoro Mutti 400gr', from: 'request_product_id'
	click_button('add product')
	select 'Caffe Lavazza 250gr', from: 'request_product_id'
	click_button('add product')
	select 'Birra Peroni 0.66L', from: 'request_product_id'
	click_button('add product')
	select 'Dentifricio Mentadent 75ml', from: 'request_product_id'
	click_button('add product')
	select 'Fazzoletti Scala 12 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Detergente Per Vetri Vetril 650ml', from: 'request_product_id'
	click_button('add product')
	select 'Tovaglioli Regina 50 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Smacchiatore Omino Bianco 1L', from: 'request_product_id'
	click_button('add product')

	assert page.has_content?("Mezze Penne Barilla 500gr")
	assert page.has_content?("Olio Extra Vergine Monini 1L")
	assert page.has_content?("Passata Di Pomodoro Mutti 400gr")
	assert page.has_content?("Caffe Lavazza 250gr")
	assert page.has_content?("Birra Peroni 0.66L")
	assert page.has_content?("Dentifricio Mentadent 75ml")
	assert page.has_content?("Fazzoletti Scala 12 Pezzi")
	assert page.has_content?("Detergente Per Vetri Vetril 650ml")
	assert page.has_content?("Tovaglioli Regina 50 Pezzi")
	assert page.has_content?("Smacchiatore Omino Bianco 1L")


	fill_in "session_count" , with: 4
	click_button('Go to smart shopping')
	save_and_open_page('core_function_test#2.html')

end

it "test # 3" do 

	fill_in "session_address" , with: "via saudoni, 42, 03030 Castrocielo FR"
	fill_in "session_range" , with: 30
	click_button('SMART SHOPPING')
	expect(page.status_code).to be 200
	assert page.has_content?("COMPILE YOUR SHOPPING LIST")
	select 'Mezze Penne Barilla 500gr', from: 'request_product_id'
	click_button('add product')
	select 'Olio Extra Vergine Monini 1L', from: 'request_product_id'
	click_button('add product')
	select 'Passata Di Pomodoro Mutti 400gr', from: 'request_product_id'
	click_button('add product')
	select 'Caffe Lavazza 250gr', from: 'request_product_id'
	click_button('add product')
	select 'Birra Peroni 0.66L', from: 'request_product_id'
	click_button('add product')
	select 'Dentifricio Mentadent 75ml', from: 'request_product_id'
	click_button('add product')
	select 'Fazzoletti Scala 12 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Detergente Per Vetri Vetril 650ml', from: 'request_product_id'
	click_button('add product')
	select 'Tovaglioli Regina 50 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Smacchiatore Omino Bianco 1L', from: 'request_product_id'
	click_button('add product')

	assert page.has_content?("Mezze Penne Barilla 500gr")
	assert page.has_content?("Olio Extra Vergine Monini 1L")
	assert page.has_content?("Passata Di Pomodoro Mutti 400gr")
	assert page.has_content?("Caffe Lavazza 250gr")
	assert page.has_content?("Birra Peroni 0.66L")
	assert page.has_content?("Dentifricio Mentadent 75ml")
	assert page.has_content?("Fazzoletti Scala 12 Pezzi")
	assert page.has_content?("Detergente Per Vetri Vetril 650ml")
	assert page.has_content?("Tovaglioli Regina 50 Pezzi")
	assert page.has_content?("Smacchiatore Omino Bianco 1L")

	fill_in "session_count" , with: 3
	click_button('Go to smart shopping')
	save_and_open_page('core_function_test#3.html')

end

it "test # 4" do 
	
	fill_in "session_address" , with: "via saudoni, 42, 03030 Castrocielo FR"
	fill_in "session_range" , with: 30
	click_button('SMART SHOPPING')
	expect(page.status_code).to be 200
	assert page.has_content?("COMPILE YOUR SHOPPING LIST")
	select 'Mezze Penne Barilla 500gr', from: 'request_product_id'
	click_button('add product')
	select 'Olio Extra Vergine Monini 1L', from: 'request_product_id'
	click_button('add product')
	select 'Passata Di Pomodoro Mutti 400gr', from: 'request_product_id'
	click_button('add product')
	select 'Caffe Lavazza 250gr', from: 'request_product_id'
	click_button('add product')
	select 'Birra Peroni 0.66L', from: 'request_product_id'
	click_button('add product')
	select 'Dentifricio Mentadent 75ml', from: 'request_product_id'
	click_button('add product')
	select 'Fazzoletti Scala 12 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Detergente Per Vetri Vetril 650ml', from: 'request_product_id'
	click_button('add product')
	select 'Tovaglioli Regina 50 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Smacchiatore Omino Bianco 1L', from: 'request_product_id'
	click_button('add product')

	assert page.has_content?("Mezze Penne Barilla 500gr")
	assert page.has_content?("Olio Extra Vergine Monini 1L")
	assert page.has_content?("Passata Di Pomodoro Mutti 400gr")
	assert page.has_content?("Caffe Lavazza 250gr")
	assert page.has_content?("Birra Peroni 0.66L")
	assert page.has_content?("Dentifricio Mentadent 75ml")
	assert page.has_content?("Fazzoletti Scala 12 Pezzi")
	assert page.has_content?("Detergente Per Vetri Vetril 650ml")
	assert page.has_content?("Tovaglioli Regina 50 Pezzi")
	assert page.has_content?("Smacchiatore Omino Bianco 1L")


	fill_in "session_count" , with: 2
	click_button('Go to smart shopping')
	save_and_open_page('core_function_test#4.html')

end

it "test # 5" do 

	fill_in "session_address" , with: "via saudoni, 42, 03030 Castrocielo FR"
	fill_in "session_range" , with: 30
	click_button('SMART SHOPPING')
	expect(page.status_code).to be 200
	assert page.has_content?("COMPILE YOUR SHOPPING LIST")
	select 'Mezze Penne Barilla 500gr', from: 'request_product_id'
	click_button('add product')
	select 'Olio Extra Vergine Monini 1L', from: 'request_product_id'
	click_button('add product')
	select 'Passata Di Pomodoro Mutti 400gr', from: 'request_product_id'
	click_button('add product')
	select 'Caffe Lavazza 250gr', from: 'request_product_id'
	click_button('add product')
	select 'Birra Peroni 0.66L', from: 'request_product_id'
	click_button('add product')
	select 'Dentifricio Mentadent 75ml', from: 'request_product_id'
	click_button('add product')
	select 'Fazzoletti Scala 12 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Detergente Per Vetri Vetril 650ml', from: 'request_product_id'
	click_button('add product')
	select 'Tovaglioli Regina 50 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Smacchiatore Omino Bianco 1L', from: 'request_product_id'
	click_button('add product')

	assert page.has_content?("Mezze Penne Barilla 500gr")
	assert page.has_content?("Olio Extra Vergine Monini 1L")
	assert page.has_content?("Passata Di Pomodoro Mutti 400gr")
	assert page.has_content?("Caffe Lavazza 250gr")
	assert page.has_content?("Birra Peroni 0.66L")
	assert page.has_content?("Dentifricio Mentadent 75ml")
	assert page.has_content?("Fazzoletti Scala 12 Pezzi")
	assert page.has_content?("Detergente Per Vetri Vetril 650ml")
	assert page.has_content?("Tovaglioli Regina 50 Pezzi")
	assert page.has_content?("Smacchiatore Omino Bianco 1L")


	fill_in "session_count" , with: 1
	click_button('Go to smart shopping')
	save_and_open_page('core_function_test#5.html')

end

it "test # 6" do #with a range of 3KM, knowing that one of product is missing, we expect no results but a message.

	fill_in "session_address" , with: "via saudoni, 42, 03030 Castrocielo FR"
	fill_in "session_range" , with: 3
	click_button('SMART SHOPPING')
	expect(page.status_code).to be 200
	assert page.has_content?("COMPILE YOUR SHOPPING LIST")
	select 'Mezze Penne Barilla 500gr', from: 'request_product_id'
	click_button('add product')
	select 'Olio Extra Vergine Monini 1L', from: 'request_product_id'
	click_button('add product')
	select 'Passata Di Pomodoro Mutti 400gr', from: 'request_product_id'
	click_button('add product')
	select 'Caffe Lavazza 250gr', from: 'request_product_id'
	click_button('add product')
	select 'Birra Peroni 0.66L', from: 'request_product_id'
	click_button('add product')
	select 'Dentifricio Mentadent 75ml', from: 'request_product_id'
	click_button('add product')
	select 'Fazzoletti Scala 12 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Detergente Per Vetri Vetril 650ml', from: 'request_product_id'
	click_button('add product')
	select 'Tovaglioli Regina 50 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Smacchiatore Omino Bianco 1L', from: 'request_product_id'
	click_button('add product')

	assert page.has_content?("Mezze Penne Barilla 500gr")
	assert page.has_content?("Olio Extra Vergine Monini 1L")
	assert page.has_content?("Passata Di Pomodoro Mutti 400gr")
	assert page.has_content?("Caffe Lavazza 250gr")
	assert page.has_content?("Birra Peroni 0.66L")
	assert page.has_content?("Dentifricio Mentadent 75ml")
	assert page.has_content?("Fazzoletti Scala 12 Pezzi")
	assert page.has_content?("Detergente Per Vetri Vetril 650ml")
	assert page.has_content?("Tovaglioli Regina 50 Pezzi")
	assert page.has_content?("Smacchiatore Omino Bianco 1L")

	fill_in "session_count" , with: 5
	click_button('Go to smart shopping')
	save_and_open_page('core_function_test#6.html')

end

it "test # 6" do #with a range of 3KM, knowing that one of product is missing, we expect no results but a message.

	fill_in "session_address" , with: "via saudoni, 42, 03030 Castrocielo FR"
	fill_in "session_range" , with: 3
	click_button('SMART SHOPPING')
	expect(page.status_code).to be 200
	assert page.has_content?("COMPILE YOUR SHOPPING LIST")
	select 'Mezze Penne Barilla 500gr', from: 'request_product_id'
	click_button('add product')
	select 'Olio Extra Vergine Monini 1L', from: 'request_product_id'
	click_button('add product')
	select 'Passata Di Pomodoro Mutti 400gr', from: 'request_product_id'
	click_button('add product')
	select 'Caffe Lavazza 250gr', from: 'request_product_id'
	click_button('add product')
	select 'Birra Peroni 0.66L', from: 'request_product_id'
	click_button('add product')
	select 'Dentifricio Mentadent 75ml', from: 'request_product_id'
	click_button('add product')
	select 'Fazzoletti Scala 12 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Detergente Per Vetri Vetril 650ml', from: 'request_product_id'
	click_button('add product')
	select 'Tovaglioli Regina 50 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Smacchiatore Omino Bianco 1L', from: 'request_product_id'
	click_button('add product')

	assert page.has_content?("Mezze Penne Barilla 500gr")
	assert page.has_content?("Olio Extra Vergine Monini 1L")
	assert page.has_content?("Passata Di Pomodoro Mutti 400gr")
	assert page.has_content?("Caffe Lavazza 250gr")
	assert page.has_content?("Birra Peroni 0.66L")
	assert page.has_content?("Dentifricio Mentadent 75ml")
	assert page.has_content?("Fazzoletti Scala 12 Pezzi")
	assert page.has_content?("Detergente Per Vetri Vetril 650ml")
	assert page.has_content?("Tovaglioli Regina 50 Pezzi")
	assert page.has_content?("Smacchiatore Omino Bianco 1L")


	fill_in "session_count" , with: 5
	click_button('Go to smart shopping')
	assert page.has_content?("most of the products aren't in the range below, please enter a major range for the research")
	save_and_open_page('core_function_test#6.html')

end

	
it "test # 7" do #with a range of 6KM.

	fill_in "session_address" , with: "via saudoni, 42, 03030 Castrocielo FR"
	fill_in "session_range" , with: 6
	click_button('SMART SHOPPING')
	expect(page.status_code).to be 200
	assert page.has_content?("COMPILE YOUR SHOPPING LIST")
	select 'Mezze Penne Barilla 500gr', from: 'request_product_id'
	click_button('add product')
	select 'Olio Extra Vergine Monini 1L', from: 'request_product_id'
	click_button('add product')
	select 'Passata Di Pomodoro Mutti 400gr', from: 'request_product_id'
	click_button('add product')
	select 'Caffe Lavazza 250gr', from: 'request_product_id'
	click_button('add product')
	select 'Birra Peroni 0.66L', from: 'request_product_id'
	click_button('add product')
	select 'Dentifricio Mentadent 75ml', from: 'request_product_id'
	click_button('add product')
	select 'Fazzoletti Scala 12 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Detergente Per Vetri Vetril 650ml', from: 'request_product_id'
	click_button('add product')
	select 'Tovaglioli Regina 50 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Smacchiatore Omino Bianco 1L', from: 'request_product_id'
	click_button('add product')

	assert page.has_content?("Mezze Penne Barilla 500gr")
	assert page.has_content?("Olio Extra Vergine Monini 1L")
	assert page.has_content?("Passata Di Pomodoro Mutti 400gr")
	assert page.has_content?("Caffe Lavazza 250gr")
	assert page.has_content?("Birra Peroni 0.66L")
	assert page.has_content?("Dentifricio Mentadent 75ml")
	assert page.has_content?("Fazzoletti Scala 12 Pezzi")
	assert page.has_content?("Detergente Per Vetri Vetril 650ml")
	assert page.has_content?("Tovaglioli Regina 50 Pezzi")
	assert page.has_content?("Smacchiatore Omino Bianco 1L")


	fill_in "session_count" , with: 5
	click_button('Go to smart shopping')
	save_and_open_page('core_function_test#7.html')

end


it "test # 8" do #with a range of 7KM.

	fill_in "session_address" , with: "via saudoni, 42, 03030 Castrocielo FR"
	fill_in "session_range" , with: 7
	click_button('SMART SHOPPING')
	expect(page.status_code).to be 200
	assert page.has_content?("COMPILE YOUR SHOPPING LIST")
	select 'Mezze Penne Barilla 500gr', from: 'request_product_id'
	click_button('add product')
	select 'Olio Extra Vergine Monini 1L', from: 'request_product_id'
	click_button('add product')
	select 'Passata Di Pomodoro Mutti 400gr', from: 'request_product_id'
	click_button('add product')
	select 'Caffe Lavazza 250gr', from: 'request_product_id'
	click_button('add product')
	select 'Birra Peroni 0.66L', from: 'request_product_id'
	click_button('add product')
	select 'Dentifricio Mentadent 75ml', from: 'request_product_id'
	click_button('add product')
	select 'Fazzoletti Scala 12 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Detergente Per Vetri Vetril 650ml', from: 'request_product_id'
	click_button('add product')
	select 'Tovaglioli Regina 50 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Smacchiatore Omino Bianco 1L', from: 'request_product_id'
	click_button('add product')

	assert page.has_content?("Mezze Penne Barilla 500gr")
	assert page.has_content?("Olio Extra Vergine Monini 1L")
	assert page.has_content?("Passata Di Pomodoro Mutti 400gr")
	assert page.has_content?("Caffe Lavazza 250gr")
	assert page.has_content?("Birra Peroni 0.66L")
	assert page.has_content?("Dentifricio Mentadent 75ml")
	assert page.has_content?("Fazzoletti Scala 12 Pezzi")
	assert page.has_content?("Detergente Per Vetri Vetril 650ml")
	assert page.has_content?("Tovaglioli Regina 50 Pezzi")
	assert page.has_content?("Smacchiatore Omino Bianco 1L")


	fill_in "session_count" , with: 5
	click_button('Go to smart shopping')
	save_and_open_page('core_function_test#8.html')

end


it "test # 9" do #with a range of 8KM.

	fill_in "session_address" , with: "via saudoni, 42, 03030 Castrocielo FR"
	fill_in "session_range" , with: 8
	click_button('SMART SHOPPING')
	expect(page.status_code).to be 200
	assert page.has_content?("COMPILE YOUR SHOPPING LIST")
	select 'Mezze Penne Barilla 500gr', from: 'request_product_id'
	click_button('add product')
	select 'Olio Extra Vergine Monini 1L', from: 'request_product_id'
	click_button('add product')
	select 'Passata Di Pomodoro Mutti 400gr', from: 'request_product_id'
	click_button('add product')
	select 'Caffe Lavazza 250gr', from: 'request_product_id'
	click_button('add product')
	select 'Birra Peroni 0.66L', from: 'request_product_id'
	click_button('add product')
	select 'Dentifricio Mentadent 75ml', from: 'request_product_id'
	click_button('add product')
	select 'Fazzoletti Scala 12 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Detergente Per Vetri Vetril 650ml', from: 'request_product_id'
	click_button('add product')
	select 'Tovaglioli Regina 50 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Smacchiatore Omino Bianco 1L', from: 'request_product_id'
	click_button('add product')

	assert page.has_content?("Mezze Penne Barilla 500gr")
	assert page.has_content?("Olio Extra Vergine Monini 1L")
	assert page.has_content?("Passata Di Pomodoro Mutti 400gr")
	assert page.has_content?("Caffe Lavazza 250gr")
	assert page.has_content?("Birra Peroni 0.66L")
	assert page.has_content?("Dentifricio Mentadent 75ml")
	assert page.has_content?("Fazzoletti Scala 12 Pezzi")
	assert page.has_content?("Detergente Per Vetri Vetril 650ml")
	assert page.has_content?("Tovaglioli Regina 50 Pezzi")
	assert page.has_content?("Smacchiatore Omino Bianco 1L")


	fill_in "session_count" , with: 5
	click_button('Go to smart shopping')
	save_and_open_page('core_function_test#9.html')

end

it "test with range field blank" do
fill_in "session_address" , with: "via saudoni, 42, 03030 Castrocielo FR"
	fill_in "session_range" , with: 
	click_button('SMART SHOPPING')
	assert page.has_content?("range field cannot be blank")
end

it "test with address field blank" do #we expect the use of the user address stored in database

	
	fill_in "session_range" , with: 10
	click_button('SMART SHOPPING')
	expect(page.status_code).to be 200
	assert page.has_content?("COMPILE YOUR SHOPPING LIST")
	select 'Mezze Penne Barilla 500gr', from: 'request_product_id'
	click_button('add product')
	select 'Olio Extra Vergine Monini 1L', from: 'request_product_id'
	click_button('add product')
	select 'Passata Di Pomodoro Mutti 400gr', from: 'request_product_id'
	click_button('add product')
	select 'Caffe Lavazza 250gr', from: 'request_product_id'
	click_button('add product')
	select 'Birra Peroni 0.66L', from: 'request_product_id'
	click_button('add product')
	select 'Dentifricio Mentadent 75ml', from: 'request_product_id'
	click_button('add product')
	select 'Fazzoletti Scala 12 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Detergente Per Vetri Vetril 650ml', from: 'request_product_id'
	click_button('add product')
	select 'Tovaglioli Regina 50 Pezzi', from: 'request_product_id'
	click_button('add product')
	select 'Smacchiatore Omino Bianco 1L', from: 'request_product_id'
	click_button('add product')

	assert page.has_content?("Mezze Penne Barilla 500gr")
	assert page.has_content?("Olio Extra Vergine Monini 1L")
	assert page.has_content?("Passata Di Pomodoro Mutti 400gr")
	assert page.has_content?("Caffe Lavazza 250gr")
	assert page.has_content?("Birra Peroni 0.66L")
	assert page.has_content?("Dentifricio Mentadent 75ml")
	assert page.has_content?("Fazzoletti Scala 12 Pezzi")
	assert page.has_content?("Detergente Per Vetri Vetril 650ml")
	assert page.has_content?("Tovaglioli Regina 50 Pezzi")
	assert page.has_content?("Smacchiatore Omino Bianco 1L")

	fill_in "session_count" , with: 5
	click_button('Go to smart shopping')
	save_and_open_page('core_function_test#10.html')

	
end

end


