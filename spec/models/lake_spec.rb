require 'rails_helper'

RSpec.describe Lake, type: :model do 
  before :each do 
    @lake1 = Lake.create!(name: "Magikarp Lake", max_depth: 100, allows_public_fishing: true, created_at: 30.seconds.ago)
    @lake2 = Lake.create!(name: "Mafia Lake", max_depth: 200, allows_public_fishing: false, created_at: 20.seconds.ago)
    @lake3 = Lake.create!(name: "Oyster Lake", max_depth: 300, allows_public_fishing: true, created_at: 10.seconds.ago)
    @fish1 = @lake1.fishes.create!(name: "Magikarp", avg_length: 35, catch_and_release_only: false)
    @fish2 = @lake1.fishes.create!(name: "Gyrados", avg_length: 234, catch_and_release_only: true)
    @fish3 = @lake2.fishes.create!(name: "Blob-Fish", avg_length: 11, catch_and_release_only: true)
end
  describe 'validations' do 
    it { should have_many :fishes}

    it { should validate_presence_of :name}
    it { should validate_presence_of :max_depth}
    it { should allow_value(true).for(:allows_public_fishing)}
    it { should allow_value(false).for(:allows_public_fishing)}
  end 
  

  describe 'US 6' do 
    it 'can order lakes by the date most recently created' do

      expect(Lake.order_by_creation).to eq([@lake3,@lake2,@lake1])
    end

  end

  describe 'us 7' do
    it 'can give count of fish species present in lake' do 
      expect(Lake.fishes_count).to eq(2)
    end
  end
end