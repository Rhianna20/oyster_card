require 'oystercard'

describe Oystercard do
let(:oystercard) {Oystercard.new}
MINIMUM_FARE = 1
    
    it 'will return a balance' do
    expect(subject).to respond_to (:balance)
    end
   
    describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it 'can top up balance' do 
    expect{ subject.top_up 1 }.to change{ subject.balance}.by 1
    end

    it 'raise an error if the maximum balance is exceeded' do 
        expect{ subject.top_up(Oystercard::MAXIMUM_BALANCE + 1)}.to raise_error 'Maximum balance exceeded'
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
        #let(:'double name') {double 'what you are doubling'}
        let(:entry_station) {double :station }
        it 'oyster card touch in' do
        oystercard.top_up(10)
        oystercard.touch_in(entry_station)
        expect(oystercard.in_journey).to eq true
        
    end

    describe '#touch_out' do
        let(:exit_station) {double :station}
        it 'can touch out' do 
        oystercard.touch_out(:exit_station)
        expect(oystercard.in_journey).to eq false 
        end
        it 'will charge the user by minimum fare' do
        expect{oystercard.touch_out(:exit_station)}.to change{oystercard.balance}.by (-Oystercard::MINIMUM_FARE)
        end 

        let(:entry_station) { double :station }
        let(:exit_station) { double :station}
    end
      it 'will not touch in if below minimum balance' do
         expect{subject.touch_in(:entry_station)}.to raise_error "please top-up, minimum fare £1"
      end
   it 'has an empty list of journeys by default' do 
    expect(subject.oyster_journey).to eq []
   end
   it 'stores touch in and out as one journey' do
        subject.top_up(20)
        subject.touch_in(:entry_station)
        subject.touch_out(:exit_station)
        expect(subject.oyster_journey).to eq [{arrival: :entry_station, departure: :exit_station}]
   end
end
end
end
end