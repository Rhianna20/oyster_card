require 'oystercard.rb'

describe Oystercard do
    subject {Oystercard.new}
    it 'will return a balance' do
     expect(subject).to respond_to (:balance)
    end
    it 'returns default balance' do
    expect(subject.balance).to eq(0)
    end
end
