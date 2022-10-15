require 'rails_helper'

RSpec.describe 'It-3-20' do 
  before :each do
    @lake1 = Lake.create!(name: "Magikarp Lake", max_depth: 100, allows_public_fishing: true)
    @lake2 = Lake.create!(name: "Mafia Lake", max_depth: 200, allows_public_fishing: false)
    @lake3 = Lake.create!(name: "Oyster Lake", max_depth: 300, allows_public_fishing: true)
    @fish1 = @lake1.fishes.create!(name: "Magikarp", avg_length: 35, catch_and_release_only: false)
    @fish2 = @lake1.fishes.create!(name: "Gyrados", avg_length: 234, catch_and_release_only: true)
    @fish3 = @lake2.fishes.create!(name: "Blob-Fish", avg_length: 11, catch_and_release_only: true)
  end 
  describe 'fish show page' do 
    describe 'delete fish link' do 
      it 'I see a link on fish show page to delete fish. I click it and request is sent to /fish/:id - redirected to fish index' do 

        visit "/fishes/#{@fish1.id}"

        expect(page).to have_link("Delete #{@fish1.name}")
        click_link("Delete #{@fish1.name}")

        expect(current_path).to eq("/fishes")

      end
    end
  end
  describe 'Fish index page delete' do
    it 'When I visit Fish index page, I see a link to delete a Fish. When Clicked, fish is deleted and reroutes back to index page' do 
      visit "/fishes"

      expect(page).to have_link("Delete #{@fish1.name}")
      click_link("Delete #{@fish1.name}")
      expect(current_path).to eq("/fishes")
      expect(page).to_not have_content("#{@fish1.name}")

    end
  end
end