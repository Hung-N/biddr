require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  let :user { create(:user) }
  let :auction { create(:auction, user: user) }

  describe '#new' do
    context 'with no user signed in' do
      it 'redirects to the sign in page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'with a user signed in' do
      before { sign_in(user) }
      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#create' do
    context 'with no user signed in' do
      it 'redirects to the sign in page' do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'with a user signed in' do
      before { sign_in(user) }
      context 'with valid attributes' do
        it 'creates a new campaign in the database' do
          count_before = Auction.count
          post :create, params: { auction: FactoryGirl.attributes_for(:auction) }
          count_after = Auction.count
        end
      end
    end
  end

  describe '#show' do
    before { get :show, params: { id: auction.id } }

    it 'assigns the auction to an instance variable' do
      expect(assigns(:auction)).to eq(auction)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe '#index' do
    it 'renders the index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end


end
