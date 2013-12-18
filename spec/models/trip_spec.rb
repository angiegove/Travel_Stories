require 'spec_helper'

describe Trip do

  before do
    @trip = Trip.create(:title => 'Prawns')
  end

  it 'should have a title' do
    @trip.title.present? == true
  end

end