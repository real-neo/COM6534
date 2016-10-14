require 'rails_helper'

describe 'Purchasing consumables' do

  context 'As a student member', js: true do
    let(:student) { FactoryGirl.create(:student) }

    before do
      login_as student
    end

    context 'given that a consumable exists' do
      let!(:consumable) { FactoryGirl.create :consumable, stock_level: 100, category: :wearable }

      context 'the feature is enabled' do
        before do
          FactoryGirl.create(:enable_purchasing)
        end

        specify 'I can purchase that consumable' do
          visit '/'
          click_link 'Check out'
          wait_for_ajax
          fill_in 'Amount', with: 5
          fill_in 'Reason', with: 'For a lab project'
          click_button 'Save'
          wait_for_ajax
          within(:css, "#consumable_#{consumable.id}") do
            expect(page).to have_content 5
          end
        end
      end

      context 'the feature is disabled' do
        specify 'I cannot purchase a consumable' do
          visit '/'
          expect(page).to_not have_link 'Check out'
        end
      end

    end

  end

end
