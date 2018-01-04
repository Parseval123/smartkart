feature "manager test" do

before(:each) do
@manager = FactoryGirl.create(:manager, name: 'Mario', surname: 'Rossi', yearofbirth: 1958, tel: '3395625489', email: 'rossi@gmail.com', curriculum: 'CurriculumRossi', password: 'foobar10')
@market1 = FactoryGirl.create(:market, address: 'via alessandro manzoni, 31, 03031 Aquino FR', group: 'Conad', info: 'Aperto dal lunedi al sabato//08.00-20.00', manager: @manager)

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

	visit loginm_path 
	assert page.has_content?("Log in as Manager")
	assert page.has_title?("Log in as Manager")
	fill_in "session_email", with: "rossi@gmail.com"	
	fill_in "session_password", with: "foobar10"
	click_button('Log in')
	expect(page.status_code).to be 200
	
	select 'Mezze Penne Barilla 500gr', from: 'owner_product_id'
	fill_in "owner_price", with: 0.80
	fill_in "owner_stock", with: 23
	click_button('add product')
	select 'Olio Extra Vergine Monini 1L', from: 'owner_product_id'
	fill_in "owner_price", with: 3.80
	fill_in "owner_stock", with: 12
	click_button('add product')
	select 'Passata Di Pomodoro Mutti 400gr', from: 'owner_product_id'
	fill_in "owner_price", with: 0.99
	fill_in "owner_stock", with: 21
	click_button('add product')
	select 'Caffe Lavazza 250gr', from: 'owner_product_id'
	fill_in "owner_price", with: 2.99
	fill_in "owner_stock", with: 54
	click_button('add product')
	select 'Birra Peroni 0.66L', from: 'owner_product_id'
	fill_in "owner_price", with: 1.10
	fill_in "owner_stock", with: 60
	click_button('add product')
	select 'Dentifricio Mentadent 75ml', from: 'owner_product_id'
	fill_in "owner_price", with: 1.30
	fill_in "owner_stock", with: 14
	click_button('add product')
	select 'Fazzoletti Scala 12 Pezzi', from: 'owner_product_id'
	fill_in "owner_price", with: 1.00
	fill_in "owner_stock", with: 43
	click_button('add product')
	select 'Detergente Per Vetri Vetril 650ml', from: 'owner_product_id'
	fill_in "owner_price", with: 1.70
	fill_in "owner_stock", with: 16
	click_button('add product')
	select 'Tovaglioli Regina 50 Pezzi', from: 'owner_product_id'
	fill_in "owner_price", with: 0.80
	fill_in "owner_stock", with: 23	
	click_button('add product')
	select 'Smacchiatore Omino Bianco 1L', from: 'owner_product_id'
	fill_in "owner_price", with: 2.80
	fill_in "owner_stock", with: 22
	click_button('add product')

end

it "making an inventory" do

save_and_open_page('manager_making_inventory.html')

end

it "edit a product from inventory" do

find(:xpath, "//a[@href='/owners/2/edit']").click
fill_in "owner_price", with: 2.70
fill_in "owner_stock", with: 10
click_button('save changes')

save_and_open_page('manager_edit_inventory.html')

end

it "delete a product from inventory" do

click_link ('delete Olio Extra Vergine Monini')
save_and_open_page('manager_deleting_product.html')

end

end


