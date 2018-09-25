require 'rails_helper'

describe ConsumableDecorator do
  subject { ConsumableDecorator.decorate consumable }

  describe '.display_amount_until_reorder' do

    context 'There are more than the minimum amount' do
      let(:consumable) { FactoryBot.create(:consumable, stock_level: 100, min_stock_level: 10) }

      it 'shows the amount over the reorder level' do
        expect(subject.display_amount_until_reorder).to eq 90
      end
    end

    context 'There are less than the minimum amount' do
      let(:consumable) { FactoryBot.create(:consumable, stock_level: 90 , min_stock_level: 100) }

      it 'Tells you how many over the limit you are ' do
        expect(subject.display_amount_until_reorder).to eq "Order now - 10 below minimum level"
      end
    end

    context 'There are exactly the minimum amount' do
      let(:consumable) { FactoryBot.create(:consumable, stock_level: 100 , min_stock_level: 100) }

      it 'Tells you how many over the limit you are ' do
        expect(subject.display_amount_until_reorder).to eq "Order now - 0 below minimum level"
      end
    end

  end
end
