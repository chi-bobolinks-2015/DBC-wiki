require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'POST #create' do
  #   it "creates a new user in the database" do
  #     expect{
  #       post :create, user: User.create(username: "test", email: "test@test.com",password_digest: "password")
  #     }.to change(User,:count).by(1)
  #   end
  #
  #   it "redirects to root path after successful user creation" do
  #     # it { should redirect_to(action: :new) }
  #   end
  # end

end
