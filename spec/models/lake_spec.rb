require 'rails_helper'

RSpec.describe Lake, type: :model do 
  it { should have_many :fishes}

  it { should validate_presence_of :name}
  it { should validate_presence_of :max_depth}
  it { should allow_value(true).for(:allows_public_fishing)}
  it { should allow_value(false).for(:allows_public_fishing)}
  
end