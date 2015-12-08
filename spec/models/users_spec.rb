require 'rails_helper'

describe User do
  let(:user) { User.new }
  describe 'User' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }

    it { should have_many(:approved_edits).with_foreign_key('approved_by_id') }
    it { should have_many(:edits).with_foreign_key('author_id') }
    it { should have_many(:created_articles).class_name('Article') }
  end
end
