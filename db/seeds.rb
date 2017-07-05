
Bid.destroy_all


PASSWORD = '123123'




auction = Auction.all

a.each do |q|
  rand(1..10).times do
      Bid.create(bid: (1..900).to_a.sample)
  end
end
