require 'rails_helper'

RSpec.describe 'It-1 us-1' do
  before :each do 
    @lake1 = Lake.create!(name: "Magikarp Lake", max_depth: 100, allows_public_fishing: true)
    @lake2 = Lake.create!(name: "Mafia Lake", max_depth: 200, allows_public_fishing: false)
    @lake3 = Lake.create!(name: "Oyster Lake", max_depth: 300, allows_public_fishing: true)
  end
  describe 'parent index' do 
    it 'for each parent table, as a visitor, when I visit /parents, I see the name of each parent record in the system' do 

      visit '/lakes'
      
      expect(page).to have_content("Name: Magikarp Lake")
      expect(page).to have_content("Max Depth: 100")
      expect(page).to have_content("Allows Public Fishing: true")
      expect(page).to have_content("Name: Mafia Lake")
      expect(page).to have_content("Max Depth: 200")
      expect(page).to have_content("Allows Public Fishing: false")
      expect(page).to have_content("Name: Oyster Lake")
      expect(page).to have_content("Max Depth: 300")
      expect(page).to have_content("Allows Public Fishing: true")
    end
  end

  describe 'US 6' do
    it 'as visitor on lake index, I see that records are ordered by most recently created first' do 

      visit '/lakes'
      
      expect(@lake3.name).to appear_before(@lake2.name)
      expect(@lake2.name).to appear_before(@lake1.name)
      expect(@lake1.name).to_not appear_before(@lake3.name)
    end

    it 'next to each record i see when it was created' do 

      visit '/lakes'

      expect(page).to have_content(@lake1.created_at)
      expect(page).to have_content(@lake2.created_at)
      expect(page).to have_content(@lake3.created_at)
    end
  end 

  describe 'It-2 Us-17' do 
    describe 'Edit link on page' do 
      it 'As visitor next to each Lake I see a link to edit the Lake info' do

        visit '/lakes'

        expect(page).to have_link("Edit #{@lake1.name}")
      end
    end
  end

end