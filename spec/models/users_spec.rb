require 'rails_helper'

describe User do
  let(:user) { User.new }
  describe 'User' do
    it { is_expected.to validate_presence_of(:username) }
  end
end
