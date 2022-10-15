require 'rails_helper'

RSpec.describe 'Delete Lake' do 
   before :each do 
    @lake1 = Lake.create!(name: "Magikarp Lake", max_depth: 100, allows_public_fishing: true)
    @lake2 = Lake.create!(name: "Mafia Lake", max_depth: 200, allows_public_fishing: false)
    @lake3 = Lake.create!(name: "Oyster Lake", max_depth: 300, allows_public_fishing: true)
    @fish1 = @lake1.fishes.create!(name: "Magikarp", avg_length: 35, catch_and_release_only: false)
    @fish2 = @lake1.fishes.create!(name: "Gyrados", avg_length: 234, catch_and_release_only: true)
    @fish3 = @lake2.fishes.create!(name: "Blob-Fish", avg_length: 11, catch_and_release_only: true)

  end
  describe 'parent show page delete' do 
    it 'When I visit Lake show page, I see a link to delete the parents' do 

      visit "/lakes/#{@lake1.id}"

      expect(page).to have_link("Delete #{@lake1.name}")
    end

    it 'I click the link to delete lake, and request is sent to /lakes/:id  lake is deleted' do 

      visit "/lakes/#{@lake1.id}"

      click_link("Delete #{@lake1.name}")
      expect(current_path).to eq("/lakes")
    end
  end
end