FactoryGirl.define do
  factory :article do |f|
    f.title "Plane"
    f.text  "AirIndia"
  end
  factory :invalid_article, parent: :article do |f|
  f.title nil
  end
end
