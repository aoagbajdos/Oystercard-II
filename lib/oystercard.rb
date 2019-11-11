class Oystercard
attr_reader :balance, :status, :station, :entry_station
MAXBALANCE = 90
MINBALANCE = 1
MINCHARGE = -1

  def initialize()
    @balance = 0
    @status = false
    @entry_station = double(entry_station)
  end

  def topup(amount)
    fail "Over limit of £#{MAXBALANCE}" unless @balance < MAXBALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

#private :deduct

  def touch_in(station1)
   fail "Balance must be over £1" unless @balance > MINBALANCE
    @status = true
  end
  def touch_out
    deduct(1)
    @status = false
    @entry_station = nil
  end
  def in_journey?
    @status
  end
end
