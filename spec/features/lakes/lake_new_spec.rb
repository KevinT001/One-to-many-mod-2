require 'rails_helper'

RSpec.describe 'Create new Lake: US 11' do 
  describe 'As a visitor, when I visit the Lake index page' do 
    describe 'I see a link to create a new Lake' do 
      it 'has a link that creates a new Lake' do 

        visit '/lakes'

        expect(page).to have_link("Add New Lake")
      end

      it 'I am taken to /parents/new where I see a form for a new lake' do 

        visit '/lakes'
        
        click_link("Add New Lake")
        expect(current_path).to eq('/lakes/new')
      end
    end
  end
end