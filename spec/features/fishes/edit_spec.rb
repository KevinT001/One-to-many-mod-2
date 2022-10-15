require 'rails_helper' 

RSpec.describe 'It-2 Us-14' do 
  before :each do
    @lake1 = Lake.create!(name: "Magikarp Lake", max_depth: 100, allows_public_fishing: true)
    @lake2 = Lake.create!(name: "Mafia Lake", max_depth: 200, allows_public_fishing: false)
    @lake3 = Lake.create!(name: "Oyster Lake", max_depth: 300, allows_public_fishing: true)
    @fish1 = @lake1.fishes.create!(name: "Magikarp", avg_length: 35, catch_and_release_only: false)
    @fish2 = @lake1.fishes.create!(name: "Gyrados", avg_length: 234, catch_and_release_only: true)
    @fish3 = @lake2.fishes.create!(name: "Blob-Fish", avg_length: 11, catch_and_release_only: true)
  end 

  describe 'Fish Edit Page' do 

    it 'Page shows form where you can fill it out and submit it to update fish info' do 
      visit "/fishes/#{@fish1.id}/edit"

      expect(page).to have_content("Fish Edit Form")

      fill_in ('name'), with:("Updated Fish Name")
      fill_in ("Average Length(inches"), with: (9)
      choose ('Catch and Release Only(True)')
      click_button("Submit")

      expect(current_path).to eq("/fishes/#{@fish1.id}")
    end
  end
end