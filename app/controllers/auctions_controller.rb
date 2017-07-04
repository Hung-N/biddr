class AuctionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_auction, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def auction_params
    auction_params = params.require(:auction).permit([:title, :body, :category_id, :image, { tag_ids: [] }])
  end

  def find_auction
    @auction = Auction.find params[:id]
  end

end
