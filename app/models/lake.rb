class Lake < ApplicationRecord
  has_many :fishes 
  validates_presence_of :name 
  validates_presence_of :max_depth
  validates :allows_public_fishing, inclusion:[true,false]
  
end