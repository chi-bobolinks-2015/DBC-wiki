require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it "creates a new user in the database with valid credentials" do
      expect {
        post :create, {user: {username: "test", email: "test@test.com",password: "password"}}
      }.to change(User,:count).by(1)
    end

    it "does not create new user in database with invalid credentials" do
      expect {
        post :create, {user: {username: "test", email: "incorrectemailformat",password: "password"}}
      }.to_not change(User,:count)
    end

    it "redirects to root path after successful user creation" do
        post :create, {user: {username: "test", email: "test@test.com",password: "password"}}
      expect(:create).to redirect_to root_url
    end

    it "renders users/new after unsuccessful user creation" do
        post :create, {user: {username: "test", email: "bademail",password: "password"}}
      expect(:create).to render_template("user/new")
    end
  end

end
