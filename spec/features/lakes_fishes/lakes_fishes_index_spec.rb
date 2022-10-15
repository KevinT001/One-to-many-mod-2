require 'rails_helper'

RSpec.describe 'It-1 us-5' do 
  before :each do 
    @lake1 = Lake.create!(name: "Magikarp Lake", max_depth: 100, allows_public_fishing: true)
    @lake2 = Lake.create!(name: "Mafia Lake", max_depth: 200, allows_public_fishing: false)
    @lake3 = Lake.create!(name: "Oyster Lake", max_depth: 300, allows_public_fishing: true)
    @fish1 = @lake1.fishes.create!(name: "Magikarp", avg_length: 35, catch_and_release_only: false)
    @fish2 = @lake1.fishes.create!(name: "Gyrados", avg_length: 234, catch_and_release_only: true)
    @fish3 = @lake2.fishes.create!(name: "Blob-Fish", avg_length: 11, catch_and_release_only: true)
  end

  describe 'lake-fish index page' do 
    it 'As visitor, when I visit /lakes/:id/fishes  , I see fishes that are associated with a lake and displays fish attributes' do 
      visit "lakes/#{@lake1.id}/fishes"
      expect(page).to have_content("#{@fish1.name}")
      expect(page).to have_content("#{@fish1.avg_length}")
      expect(page).to have_content("#{@fish1.catch_and_release_only}")
      expect(page).to have_content("#{@fish2.name}")
      expect(page).to have_content("#{@fish2.avg_length}")
    
    end
  end

  describe 'IT-2 US 13' do 
    describe 'Add new Lake-fish item to index page' do 
      describe 'Link to form to add new item' do 
        it 'Has a link to add a new adoptable child to'do 

          visit "/lakes/#{@lake1.id}/fishes"

          expect(page).to have_link("Add New Fish")
          click_link("Add New Fish")
          expect(current_path).to eq("/lakes/#{@lake1.id}/fishes/new")

        end
      end
    end
  end

  describe 'It-2 US 16' do 
    describe 'Link to alphabetize fish on lake fish index page' do 

      it 'Has a link that when clicked will alphabetize the items on index page' do 

        visit "/lakes/#{@lake1.id}/fishes"

        expect(page).to have_link("Sort Fish Alphabetically")
        click_link("Sort Fish Alphabetically")
        expect(current_path).to eq("/lakes/#{@lake1.id}/fishes")
      end
    end
  end
end