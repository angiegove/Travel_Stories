# == Schema Information
#
# Table name: trips
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Trip < ActiveRecord::Base
  attr_accessible :description, :title


  has_many :places
end
