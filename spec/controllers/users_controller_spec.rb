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
      expect(:create).to render_template("users/new")
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

  describe "PATCH '/users/:id'" do
    let(:user) {User.create(email: "test@test.com", username: "bobolink123", password: "test")}

    describe "on valid update" do
      before :each do 
        put :update, id: user.id, user: {email: "new@newmail.com", username: "xXxBOBOLINKxXx", password: "fleetwoodmac4eva"}
        user.reload
      end
      
      it "properly assigns a user instance variable" do 
        expect(assigns(:user)).to eq(user)
      end 

      it "updates email" do 
        expect(user.email).to eq("new@newmail.com")
      end
      
      it "updates username" do 
        expect(user.username).to eq("xXxBOBOLINKxXx")
      end
      
      it "updates password" do 
        expect(user.authenticate("fleetwoodmac4eva")).to eq(user)
      end
      
      it "redirects user to the root_url" do
        expect(response).to redirect_to(root_url)
      end 
    end

    describe "on invalid update" do
      before :each do 
        put :update, id: user.id, user: {invalid_param: "foo"}
        user.reload
      end

      it "throws an error on duplicate email" do 
        expect(assigns(:errors)).to eq((assigns(:user).errors.full_messages))
      end

      it "rerenders login page" do
        expect(response).to render_template("users/edit")
      end
    end
  end

  describe "DESTROY '/users/:id'" do
    let(:user) {User.create(email: "test@test.com", username: "bobolink123", password: "test")}

    before :each do 
      delete :destroy, id: user.id
    end

    it "properly assigns a user instance variable" do
      expect(assigns(:user)).to eq(user)
    end

    it "deletes the user from the database" do 
      expect(User.all.count).to eq(0)
    end

    it "redirects to root" do
      expect(response).to redirect_to(root_url)
    end

  end

end







