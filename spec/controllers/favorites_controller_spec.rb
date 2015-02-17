require 'rails_helper'

RSpec.describe FavoritesController, :type => :controller do
describe '#index' do    
  	let!(:favorite) { FactoryGirl.create(:favorite) }

    before(:example) do
      get :index
    end

		it 'returns 200' do
      expect(response).to be_success
    end

    it 'renders favorites/index' do
    	expect(response).to render_template 'favorites/index'
    end

    it 'assigns @favorite' do
    	expect(assigns(:favorite)).to eq Favorite.all
    end
  end

  describe '#new' do
    before { get :new }

      it 'returns 200' do
        expect(response).to be_success
      end
        
      it 'renders favorites/new' do
        expect(response).to render_template 'favorites/new'
      end

      it 'assigns @favorite' do
      	expect(assigns(:favorite)).to be_a Favorite
      	expect(assigns(:favorite)).not_to be_persisted
      end
    end
    

      
  describe '#create' do
    context 'valid params' do
      before do

        post :create, favorite: {
          title: 'murrica', body: 'f yeah'
        }
      end
  
      it 'assigns @favorite' do
        expect(assigns(:favorite)).to be_a Favorite
      end
  
      it 'persists the favorite' do
        expect(assigns(:favorite)).to be_persisted
      end
  
      it 'redirects to the favorite' do
        expect(response).to redirect_to favorite_path(Favorite.last)
      end
    end      
    
    context 'invalid params' do
      before do
        post :create, favorite: {
          # These params are invalid because they are blank,
          # so the favorite will not be created
          title: '', body: ''
        }
      end
  
      it 'assigns @favorite' do
        expect(assigns(:favorite)).to be_a Favorite
      end
  
      it 'does not persist the favorite' do
        expect(assigns(:favorite)).not_to be_persisted
      end
  
      it 'renders favorites/new' do
        expect(response).to render_template 'favorites/new'
      end
    end  
  end
end
