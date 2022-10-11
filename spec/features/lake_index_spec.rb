require 'rails_helper'

RSpec.describe 'It-1 us-1' do
   before :each do 
    @lake1 = Lake.create!(name: "Magikarp Lake", max_depth: 100, allows_public_fishing: true)
    @lake2 = Lake.create!(name: "Mafia Lake", max_depth: 200, allows_public_fishing: false)
    @lake3 = Lake.create!(name: "Oyster Lake", max_depth: 300, allows_public_fishing: true)
   end
  describe 'parent index' do 
    it 'for each parent table, as a visitor, when I visit /parents, I see the name of each parent record in the system' do 

      visit '/lakes/'

      expect(page).to have_content("Name: Magikarp Lake")
      expect(page).to have_content("Max Depth: 100")
      expect(page).to have_content("Allows Public Fishing: True")

      expect(page).to_not have_content("#{@lake4.name}")
      
    end
  end
end