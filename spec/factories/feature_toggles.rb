FactoryGirl.define do
  factory :feature_toggle do

    factory :enable_purchasing do
      identifier 'purchasing'
      name 'Students - Purchasing'
      enabled true
    end

    factory :enable_reporting do
      identifier 'reporting'
      name 'Staff - Reporting'
      enabled true
    end

  end
end
