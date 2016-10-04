require 'spec_helper'
require 'services/purchaser'

describe Purchaser do
  let(:account)  { double 'account' }
  let(:purchase) { double 'purchase', consumable: double('consumable') }
  let(:params)   { Hash.new } 

  subject { described_class.new(purchase, account, params) }

  it 'returns true if both models update' do
    transaction = class_double('transaction')
    allow(transaction).to receive(:transaction).and_yield
    allow(subject).to receive(:update_purchase).and_return true
    allow(subject).to receive(:update_consumable).and_return true
    expect(subject.make_purchase(transaction, double)).to eq true
  end

  it 'rolls back the transaction if the consumable fails to save' do
    transaction = class_double('transaction')
    allow(transaction).to receive(:transaction).and_yield
    allow(subject).to receive(:update_purchase).and_return true
    allow(subject).to receive(:update_consumable).and_return false
    expect { subject.make_purchase(transaction, Exception.new('rollback')) }.to raise_error 'rollback' 
  end

  it 'rolls back the transaction if the purchase fails to save' do
    transaction = class_double('transaction')
    allow(transaction).to receive(:transaction).and_yield
    allow(subject).to receive(:update_purchase).and_return false
    allow(subject).to receive(:update_consumable).and_return true
    expect { subject.make_purchase(transaction, Exception.new('rollback')) }.to raise_error 'rollback' 
  end


end