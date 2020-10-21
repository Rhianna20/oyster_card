
class Oystercard
    

    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1

    attr_reader :balance, :in_journey, :entrystation

    def initialize
        @balance = 0
        @in_journey = false
        @entrystation = nil
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
        minimum_fare
        @entrystation = station
        @in_journey = true
    end
    def touch_out
        @balance -= MINIMUM_FARE 
        @entrystation = nil
        @in_journey = false
    end
    
    def minimum_fare 
    raise "please top-up, minimum fare £#{ MINIMUM_FARE }" if @balance < MINIMUM_FARE
        
    end
end

