FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@exmaple.com" }

	factory :user do
		name "username"
		email { generate(:email) }
		password "hunter2"
		password_confirmation "hunter2"

		factory :admin_user do
			admin true
		end
	end
end