require './lib/oystercard.rb'

describe Oystercard do
  let (:oyster) {Oystercard.new}
  subject(:oyster) {Oystercard.new}
  it 'checks that the oystercard has a balance' do
    expect(oyster.balance).to eq(0)
  end

  it 'tops up balance of oystercard' do
    amount = 10
    expect(subject.topup(amount)).to eq(amount)
  end

  it 'raises an error if topped up beyond £90' do
    amount = 10
    9.times { subject.topup(amount) }
    expect { subject.topup(amount) }.to raise_error 'Over limit of £90'
  end
  it 'deducts a fare from the oyster balance' do
    amount = 10
    9.times { subject.topup(amount) }
    fare = 10
    expect(subject.deduct(fare)).to eq(80)
  end

  it 'touches in if over minimum fare' do
    oyster.topup(10)
    expect(subject.touch_in).to be(true)
  end

  it 'touches out' do
    expect(oyster.touch_out).to be(false)
  end
  it 'knows it is in journey' do
      oyster.topup(10)
      oyster.touch_in
     expect(oyster.in_journey?).to be(true)
  end
  it 'raises an error if touched in below minimum fare' do
    expect { oyster.touch_in }.to raise_error 'Balance must be over £1'
  end
  it 'reduces the balance by the minimum by the fare' do
    fare = 1
    oyster.topup(10)
    expect { oyster.touch_out }.to change { oyster.balance }.by(-fare)
end
  it 'should store the entry_station when person touches in' do
    subject.balance = Oystercard::MINBALANCE
    station1 = Station.new
    subject.touch_in(station)
    expect(subject.entry_station).to eq(station1)
end
  let(:station){ double :station }
  it 'creates a double of the station to track and store the first station'
    oyster = Oystercard.new
    oyster.touch_in(entry_station)
    let(:station){ double :station }
    expect(oyster.entry_station).to eq station
end
