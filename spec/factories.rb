

FactoryGirl.define do



	factory :user do 
	
		factory :user0  do #factory used to acceptance test
		name 'Flavio'
		surname 'Forlini'
		email 'flavioasdf@gmail.com'
		yearofbirth 1992
		address 'via saudoni, 42, 03030 Castrocielo FR'
		password 'foobar10'
		end
	
		factory :user1  do #factory used for acceptance test
		name 'Claudio'
		surname 'Alicino'
		email 'claudioqwerty@gmail.com'
		yearofbirth 1992
		address 'via alessandro severo, 71, 00145 Roma RM'
		password 'foobar10'
		end

		factory :user2 do #factory used to unit test
		name 'Flavio'
		surname 'Forlini'
		email 'orsamaggiore123@gmail.com'
		yearofbirth 1992
		address 'via alessandro severo, 71, 00145 Roma RM'
		password 'foobar10'
		end

		factory :user3 do #factory used to unit test
		name 'Flavio'
		surname 'Forlini'
		email 'orsaminore456@gmail.com'
		yearofbirth 1992
		address 'via alessandro severo, 71, 00145 Roma RM'
		password 'foobar10'
		end

	end

	factory :product do

	factory :product0  do 
		name 'Bucaneve'
		label 'Doria'
		package '500g'
		end

	
	end 

	factory :market do

	manager

	factory :market0  do 
		address 'via alessandro severo, 71, 00145 Roma RM'
		group 'Conad'
		info 'BLABLABLA'
		end


	end

	factory :owner do

    	market
	product	

	factory :owner0 do
                stock 40
                price 4.20
                end

  	end

	factory :manager do

	factory :manager0  do 
		name 'Mario'
		surname 'Rossi'
		email 'mariorossi@gmail.com'
                tel '3365894127'
		yearofbirth 1992
		curriculum 'BLA BLA BLA'
		password 'foobar10'
		end

                factory :manager1  do 
		name 'Mario'
		surname 'Rossi'
		email 'mariorossi2@gmail.com'
                tel '3365894127'
		yearofbirth 1992
		curriculum 'BLA BLA BLA'
		password 'foobar10'
		end
	
	end	

	factory :micropost do #factory used to acceptance test
                
	user
	market

                factory :micropost0 do
                content 'BLA BLA BLA'
                vote 4
                end

        end

	 factory :shopper do #factory used to acceptance test
                
                factory :shopper0 do
                end

        end

	factory :request do #factory used to acceptance test
                
                factory :request0 do
                end

        end

	factory :admin do

	end

	factory :creationreport do
	
	market
	manager
	
	end
  
end
