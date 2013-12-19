class User < ActiveRecord::Base

  has_secure_password

  attr_accessible :email, :name, :password_digest, :trip_id, :password, :password_confirmation

  has_many :trips
  has_many :places, through => :trips

  validates :name, :presence => true, :length => { :minimum => 2}
end