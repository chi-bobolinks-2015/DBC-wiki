require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    before {get :show }
    it "renders standard user profile if not admin" do

      it { should render_template("/user/show")}
    end
  end
end
