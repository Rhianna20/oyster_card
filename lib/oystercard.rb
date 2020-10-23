
class Oystercard
    

    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1

    attr_reader :balance, :in_journey, :entry_station, :exit_station, :oyster_journey, :entrystation, :exitstation

    def initialize
        @balance = 0
        @in_journey = false
       @entry_station = entry_station
        @exit_station = exit_station
        @oyster_journey = []
    end 
    def deduct(amount)
    @balance -= amount
    end

    def top_up(amount)
     fail 'Maximum balance exceeded' if amount + balance > MAXIMUM_BALANCE
     @balance += amount
    end

    def in_journey
        @in_journey
    end

    def touch_in(station)
        fail "please top-up, minimum fare £1" if @balance < MINIMUM_FARE
        @entrystation = station
        @in_journey = true
    end
    def touch_out(station)
        @balance -= MINIMUM_FARE 
        @exitstation = station
        @in_journey = false
        @oyster_journey << {arrival: @entrystation, departure: @exitstation}
        
    end
    
end

