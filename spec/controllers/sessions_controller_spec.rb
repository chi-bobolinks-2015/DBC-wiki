require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET '/login'" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "routes to sessions#new" do
     assert_routing({ method: 'get', path: '/login' }, { controller: "sessions", action: "new" })
    end

  end

  describe "POST '/sessions'" do 

    it "routes to sessions#create" do
     assert_routing({ method: 'post', path: '/sessions' }, { controller: "sessions", action: "create" })
    end


  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(302)
    end

    it "routes to sessions#create" do
     assert_routing({ method: 'get', path: '/logout' }, { controller: "sessions", action: "destroy" })
    end

  end

  

end
