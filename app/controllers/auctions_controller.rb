class AuctionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_auction, only: [:show]

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to auctions_path, notice: 'Auction created!'
    else
      flash.now[:alert] = 'Please fix the following errors!!!'
      render :new
    end
  end

  def show
    @bid = Bid.new
    @bids = @auction.bids.order(created_at: :desc)
  end

  private

  def auction_params
    auction_params = params.require(:auction).permit([:title, :description, :reserve])
  end

  def find_auction
    @auction = Auction.find params[:id]
  end

end
