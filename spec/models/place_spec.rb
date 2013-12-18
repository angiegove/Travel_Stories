
require 'spec_helper'


describe Place do

  before do
    @place = Place.create(:latitude => '-33.855725', :longitude => '151.18036')
  end

  it 'should have a latitude' do
    @place.latitude.present? == true
  end

  it 'should have a longitude' do
    @place.longitude.present? == true
  end

end