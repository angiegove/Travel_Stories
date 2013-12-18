class  PagesController < ApplicationController
  def home
    @place = Place.new
  end
end
