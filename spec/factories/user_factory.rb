FactoryGirl.define do
	factory :user do
		password "password"
		password_confirmation "password"
		email "user@example.com"
	end
end