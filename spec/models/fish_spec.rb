require 'rails_helper'

RSpec.describe Fish, type: :model do 
  before :each do 
    @lake1 = Lake.create!(name: "Magikarp Lake", max_depth: 100, allows_public_fishing: true)
    @lake2 = Lake.create!(name: "Mafia Lake", max_depth: 200, allows_public_fishing: false)
    @lake3 = Lake.create!(name: "Oyster Lake", max_depth: 300, allows_public_fishing: true)
    @fish1 = @lake1.fishes.create!(name: "Magikarp", avg_length: 35, catch_and_release_only: false)
    @fish2 = @lake1.fishes.create!(name: "Gyrados", avg_length: 234, catch_and_release_only: true)
    @fish3 = @lake2.fishes.create!(name: "Blob-Fish", avg_length: 11, catch_and_release_only: true)
  end
  
  it { should belong_to :lake}
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:avg_length)}
  it { should allow_value(true).for(:catch_and_release_only)}
  it { should allow_value(false).for(:catch_and_release_only)}
  

  # describe 'It-2 Us- 15' do 
  #   describe 'fish index page' do 

  #     it 'I only see records where the boolean column is true' do 

  #       expect(Fish.must_release).to eq([@fish2, @fish3])
  #     end
  #   end
  # end
end