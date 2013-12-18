require 'date'

FactoryGirl.define do
  latitude = -33.85572 + 100
  longitude = 151.18036 + 100

  # factory :place do
  #   email { Faker::Internet.email }
  #   password "password"
  # end

  factory :trip do |f|
    title { Faker::HipsterIpsum.words(rand(1..3)).join ' ' }
  end

  factory :invalid_trip, :class => 'Trip' do
    title nil
  end

  factory :place do
    latitude{ latitude - rand(500) }
    longitude{ longitude - rand(500) }
    story{ Faker::Lorem.paragraphs(paragraph_count = 3) }
    # street { Faker::Address.street_address(include_secondary = false) }
  end

  factory :invalid_place, :class => 'Place' do
    latitude nil
    longitude nil
  end


end