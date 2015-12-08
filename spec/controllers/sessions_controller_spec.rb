require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET '/login'" do

    it "routes to sessions#new" do
     assert_routing({ method: 'get', path: '/login' }, { controller: "sessions", action: "new" })
    end

    it "renders sessions/new.html.erb" do
      get :new
      expect(response).to render_template(:new)
    end

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

  end

  describe "POST '/sessions'" do 
    let(:valid_user) { User.create(email: "test@test.com", username: "test", password: "test") }

    it "routes to sessions#create" do
      assert_routing({ method: 'post', path: '/sessions' }, { controller: "sessions", action: "create" })
    end

    describe "that are successful" do
      before :each do
        post :create, {session: {email: valid_user.email, password: "test"}}
      end

      it "sets session to current user id" do
        expect(session[:user_id]).to eq(valid_user.id)
      end

      it "redirects user to the root_url" do
        expect(response).to redirect_to(root_url)
      end 

      it "returns a 302 http status" do
        expect(response).to have_http_status(302)
      end

    end

    describe "that are not successful" do
      before :each do
        post :create, {session: {email: "fake@fakemail.com", password: "fake"}}
      end

      it "does not assign a session user id" do
        expect(session[:user_id]).to eq(nil)
      end

      it "redirects user to the login page" do
        expect(response).to render_template(:new)
      end

      xit "renders errors" do
        #this could be a test
      end

    end

  end

  describe "GET #destroy" do
    
    before :each do
      session[:user_id] = 1
      get :destroy
    end

    it "routes to sessions#destroy" do
     assert_routing({ method: 'get', path: '/logout' }, { controller: "sessions", action: "destroy" })
    end

    it "removes the session user id" do
      p session[:user_id]
      expect(session[:user_id]).to eq(nil)
    end

    it "redirects user to the root_url" do
      expect(response).to redirect_to(root_url)
    end 
      
    it "returns http code 302" do
      get :destroy
      expect(response).to have_http_status(302)
    end

  end
end
