# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  latitude   :string(255)
#  longitude  :string(255)
#  image      :string(255)
#  trip_id    :integer
#  story      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Place < ActiveRecord::Base
  attr_accessible :story, :title, :trip_id, :longitude, :latitude, :image

  mount_uploader :image, ImageUploader

  has_many :places
end
