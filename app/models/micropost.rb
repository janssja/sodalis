# == Schema Information
# Schema version: 20110507135513
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  activity   :string(255)
#  location   :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Micropost < ActiveRecord::Base
  attr_accessible :activity, :location
  
  belongs_to :user
  
  validates :activity, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  
  default_scope :order => 'microposts.created_at DESC'
end
