class Fish < ApplicationRecord 
  belongs_to :lake
  validates_presence_of :name
  validates_presence_of :avg_length
  validates :catch_and_release_only, inclusion:[true, false]

  def self.must_release
    Fish.where(catch_and_release_only: true)
  end
end