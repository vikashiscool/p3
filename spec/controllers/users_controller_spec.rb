require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:users) { FactoryGirl.create(:user) }

  describe '#index' do
    before(:each) { get :index }

    it 'assigns all users to @users' do
      expect(assigns(:users)).to match_array users
    end

    it 'success' do
      expect(response).to be_success
    end
  end

  describe '#show' do
	
		let!(:user) { FactoryGirl.create(:user) }

		before { get :show, id: user.id }

		it 'assigns @user' do
			expect(assigns(:user)).to eq user
			expect(assigns(:user)).to be_persisted
		end

		it 'renders users/show' do
			expect(response).to render_template 'users/show'
		end
	end

	describe '#edit' do
		let!(:user) { FactoryGirl.create(:user) }

		before { get :edit, id: user.id }

		it 'renders users/edit' do
			expect(response).to render_template 'users/edit'
		end
	end

end
