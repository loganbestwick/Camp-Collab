FactoryGirl.define do
  factory :event do
    name "logan"
    address "717 california"
  end

  factory :host do
    name "Logan"
    password "password"
    sequence(:email) {|n| "goob_#{n}@foob.com" }
    phone "4123457575"
  end
end