require 'rails_helper'

RSpec.describe 'IT-1 US 3' do 

  before :each do 
    @lake1 = Lake.create!(name: "Magikarp Lake", max_depth: 100, allows_public_fishing: true)
    @lake2 = Lake.create!(name: "Mafia Lake", max_depth: 200, allows_public_fishing: false)
    @lake3 = Lake.create!(name: "Oyster Lake", max_depth: 300, allows_public_fishing: true)
    @fish1 = @lake1.fishes.create!(name: "Magikarp", avg_length: 35, catch_and_release_only: false)
    @fish2 = @lake1.fishes.create!(name: "Gyrados", avg_length: 234, catch_and_release_only: true)
    @fish3 = @lake2.fishes.create!(name: "Blob-Fish", avg_length: 11, catch_and_release_only: true)

  end
  describe 'Fishes index page' do 
    it 'As visitor, when i visit /fishes   I see child in the system including the Childs attributes' do 

      visit "/fishes"

      expect(page).to have_content(@fish1.name)
      expect(page).to have_content(@fish1.avg_length)
      expect(page).to have_content(@fish1.catch_and_release_only)
      expect(page).to_not have_content(@lake1.name)
    end
  end
end