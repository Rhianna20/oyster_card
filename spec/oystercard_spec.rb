require 'oystercard'

describe Oystercard do
let(:oystercard) {Oystercard.new}
MINIMUM_FARE = 1
    
    it 'will return a balance' do
    expect(subject).to respond_to (:balance)
    end
    it 'returns default balance' do
    expect(subject.balance).to eq(0)
    end
    describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it 'can top up balance' do 
    expect{ subject.top_up 1 }.to change{ subject.balance}.by 1
    end
    

    it 'raise an error if the balance maximum balance is exceeded' do 
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up maximum_balance
        expect{ subject.top_up 1 }.to raise_error 'Maximum balance exceeded'
    end 
    describe '#deduct' do
    it 'deducts the amount from balance' do
        subject.top_up(20)
    expect{ subject.deduct 4}.to change{ subject.balance}.by -4
    end
    

    describe '#in_journey' do
        it 'is not intially in journey' do
        expect(oystercard.in_journey).to eq false
        end
    end

    describe '#touch_in' do
        it 'oyster card touch in' do
        oystercard.touch_in
        expect(oystercard.in_journey).to eq true
        end

    describe '#touch_out' do
        it 'can touch out' do 
        oystercard.touch_out
        expect(oystercard.in_journey).to eq false 
        end
    describe '#minimum fare' do
      it 'will not touch in if below minimum balance' do
      oystercard.balance
      expect{oystercard.minimum_fare}.to raise_error "please top-up, minimum fare £#{ MINIMUM_FARE }"
   end
end 
end
end
end
end
end