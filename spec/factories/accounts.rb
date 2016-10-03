FactoryGirl.define do
  factory :account do
    factory :staff do
      role :staff
    end

    factory :student do
      role :student
    end
  end
end
