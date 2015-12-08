require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET user#show" do
  let(:user) {User.create!(username: "Person", email: "human@gmail.com", admin: false, password: "1M2N3B4c5")}

    it "renders standard user profile if not admin" do
      session[:user_id] = user.id

      expect(get :show).to render_template(:show)
    end
  end

  describe "GET admin#show" do
  let(:user) {User.create!(username: "Alien", email: "alien@gmail.com", admin: true, password: "1M2N3B4c5")}

    it "renders admin view if current_user is admin" do
      session[:user_id] = user.id

      expect(get :show).to render_template("admin/show")
    end
  end
end
