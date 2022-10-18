class Lake < ApplicationRecord
  has_many :fishes, dependent: :delete_all
  validates_presence_of :name 
  validates_presence_of :max_depth
  validates :allows_public_fishing, inclusion:[true,false]

  def self.order_by_creation 
    self.order(created_at: :desc)
  end
  
  def fishes_count
    self.fishes.count
  end
end