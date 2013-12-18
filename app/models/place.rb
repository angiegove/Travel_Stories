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
  attr_accessible :story, :title, :trip_id, :longitude, :latitude, :image, :image2, :image3, :date

  mount_uploader :image, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader

  validates :latitude, :presence => true
  validates :longitude, :presence => true

  belongs_to :trip
end
