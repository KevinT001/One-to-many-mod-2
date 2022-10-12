require 'rails_helper'

RSpec.describe 'It-1 Us-2' do 
  before :each do 
    @lake1 = Lake.create!(name: "Magikarp Lake", max_depth: 100, allows_public_fishing: true)
    @lake2 = Lake.create!(name: "Mafia Lake", max_depth: 200, allows_public_fishing: false)
    @lake3 = Lake.create!(name: "Oyster Lake", max_depth: 300, allows_public_fishing: true)
    @fish1 = @lake1.fishes.create!(name: "Magikarp", avg_length: 35, catch_and_release_only: false)
    @fish2 = @lake1.fishes.create!(name: "Gyrados", avg_length: 234, catch_and_release_only: true)
    @fish3 = @lake2.fishes.create!(name: "Blob-Fish", avg_length: 11, catch_and_release_only: true)
  end

  describe 'Lake Show page' do 
    it 'As a visitor, when visiting /parents/:id, I see the parent with that id including its attributes' do 

      visit "lakes/#{@lake1.id}"

      expect(page).to have_content("#{@lake1.id}")
      expect(page).to have_content("#{@lake1.name}")
      expect(page).to have_content("#{@lake1.max_depth}")
      expect(page).to have_content("#{@lake1.allows_public_fishing}")
      expect(page).to_not have_content("#{@lake2.name}")
      expect(page).to_not have_content("#{@lake3.name}")
    end 

    it 'As a visitor I see a count of number of Fish associated with the lake' do 
      visit "lakes/#{@lake1.id}"

      expect(page).to have_content(@lake1.name)
      expect(page).to have_content("Num Of Fish Species: 2")
    end

  end
end