require 'rails_helper'

RSpec.describe 'It-2 US 13' do
  describe'Form to add fish to lake-fishes index' do 
    before :each do 
      @lake1 = Lake.create!(name: "Magikarp Lake", max_depth: 100, allows_public_fishing: true)
      @lake2 = Lake.create!(name: "Mafia Lake", max_depth: 200, allows_public_fishing: false)
      @lake3 = Lake.create!(name: "Oyster Lake", max_depth: 300, allows_public_fishing: true)
      @fish1 = @lake1.fishes.create!(name: "Magikarp", avg_length: 35, catch_and_release_only: false)
      @fish2 = @lake1.fishes.create!(name: "Gyrados", avg_length: 234, catch_and_release_only: true)
      @fish3 = @lake2.fishes.create!(name: "Blob-Fish", avg_length: 11, catch_and_release_only: true)
    end

    it 'when on page to add new fish I fill it out and click submit' do

      visit "/lakes/#{@lake1.id}/fishes/new"

      expect(page).to have_content("Add New Fish Form")

      fill_in ('name'), with:("Fire Fish")
      fill_in ('Average Length(inches)'), with: (14)
      # fill_in (id:), with:("")
      choose ('Catch & Release:True')
        
      click_button("Submit")
      expect(current_path).to eq("/lakes/#{@lake1.id}/fishes")

    end
  end 
end