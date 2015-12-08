# require "rails_helper"

# describe ApplicationHelper, :type => :helper do
#   let(:user) {User.create!(username: "Tiger", email: "woods@gmail.com", admin: true, password: "1M2N3B4c5")}

#   describe "#current_user" do
#     it 'should assign current_user' do
#       session[:user_id] = user.id
#       expect(current_user.id).to eq user.id
#     end

#     it "shouldn't assign current_user if session[:user_id] is nil" do
#       session[:user_id] = nil
#       expect(current_user).to be nil
#     end
#   end

#   describe "#logged_in?" do
#     it 'should return true if current_user exists' do
#       session[:user_id] = user.id
#       expect(logged_in?).to be true
#     end

#     it "should return false if current_user doesn't exist" do
#       @current_user = nil
#       expect(logged_in?).to be false
#     end
#   end

#   describe "#is_admin?" do
#     it 'should return true if current_user is an admin' do
#       session[:user_id] = user.id
#       expect(is_admin?).to eq true
#     end

#     it 'should return false if current_user is not an admin' do
#       session[:user_id] = user.id
#       user.admin = false
#       user.save
#       expect(is_admin?).to eq false
#     end
#   end
# end
