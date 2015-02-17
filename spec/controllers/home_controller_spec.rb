require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  describe "returns 200" do
  	before { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders home/index view" do
    	expect(response).to render_template 'home/index'
    end

  end

end
