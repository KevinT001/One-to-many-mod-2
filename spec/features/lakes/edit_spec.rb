require 'rails_helper' 

RSpec.describe 'edit page' do 
  before :each do 
    @lake1 = Lake.create!(name: "Magikarp Lake", max_depth: 100, allows_public_fishing: true)
    @lake2 = Lake.create!(name: "Mafia Lake", max_depth: 200, allows_public_fishing: false)
    @lake3 = Lake.create!(name: "Oyster Lake", max_depth: 300, allows_public_fishing: true)
    @fish1 = @lake1.fishes.create!(name: "Magikarp", avg_length: 35, catch_and_release_only: false)
    @fish2 = @lake1.fishes.create!(name: "Gyrados", avg_length: 234, catch_and_release_only: true)
    @fish3 = @lake2.fishes.create!(name: "Blob-Fish", avg_length: 11, catch_and_release_only: true)
  end

  describe 'It-2 US 12' do 
    describe 'Parent Update' do 
      it 'when visiting a parent show page, I see a link to update the parent' do 
        visit "/lakes/#{@lake1.id}" 
        
        expect(page).to have_link("Edit Lake Information")
        expect(page).to_not have_link("Add New Lake")
      end

      it 'when I click link update_lake, I am taken to /lakes/:id/edit where I see a form to edit the lakes attributes' do 
        visit "/lakes/#{@lake1.id}"

        click_link("Edit Lake Information")
        
        expect(current_path).to eq("/lakes/#{@lake1.id}/edit")
        expect(page).to have_content("Edit Lake Form")
      end

      it 'when I fill out the form with updated info, I click submit on the form and info is updated and I am redirected to parent showpage' do 
        visit "/lakes/#{@lake1.id}/edit"

        fill_in ('name'), with:("Updated Lake")
        fill_in ("Max Depth"), with: (99)
        choose ('Allows Public Fishing')
        click_button("Submit")

        expect(current_path).to eq("/lakes/#{@lake1.id}")
        expect(page).to_not have_content("Submit")
        


      end
    end
  end
end