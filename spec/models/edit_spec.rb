require 'rails_helper'

describe Edit do

	it 'has a valid factory' do
		expect(build(:edit)).to be_valid
	end

	let(:version) { build(:edit) }

	describe "ActiveModel validations" do

		it { expect(version).to validate_presence_of(:article_id) }
		# it { expect(version).to validate_presence_of(:author_id) }
	end
	
	it { should belong_to(:article) }
end