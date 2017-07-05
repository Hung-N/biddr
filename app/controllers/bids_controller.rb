class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_bid, only: [:destroy]

  def create
    @auction = Auction.find params[:auction_id]
    bid_params = params.require(:bid).permit(:bid)
    @bid = Bid.new bid_params
    @bid.auction = @auction


    if @bid.save
        format.html { redirect_to auction_path(@auction), notice: 'Bid submitted!' }
        # format.js { render :create_success }
      else
        # format.html { render 'home/index' }
        # format.js { render :create_failure }
      end
  end

  def destroy
    @auction = @bid.auction
    @bid.destroy
  end

  private

  def find_bid
    @bid = Bid.find params[:id]
  end

end
