require 'rails_helper'

describe 'Managing consumables' do

  context 'As a staff member', js: true do
    let(:staff) { FactoryGirl.create(:staff) }
    before do 
      login_as staff 
      visit '/'
    end

    specify 'I can create a new consumable' do
      click_link 'New'
      fill_in 'Name', with: 'My equipment name'
      fill_in 'Description', with: 'A description about my item'
      fill_in 'Stock level', with: '100'
      fill_in 'Min stock level', with: 10
      select2 'chemical', from: 'Category'
      click_button 'Create Consumable'
      within(:css, '#consumables-table') do
        expect(page).to have_content 'My equipment name'
      end
    end

    context 'Given that a consumable already exists' do
      let!(:consumable) { FactoryGirl.create :consumable, name: 'My consumable' }

      specify 'I can edit the stock level for an item' do
        visit '/'
        click_link "Edit stock level for #{consumable.name}"
        wait_for_ajax
        fill_in 'Stock level', with: 100
        click_button 'Save'
        wait_for_ajax
        within(:css, "#consumable_#{consumable.id}") do
          expect(page).to have_content '100'
        end
      end

    end 

  end

end