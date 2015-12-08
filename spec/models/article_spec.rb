require 'rails_helper'

describe Article do

	# it 'has a valid factory' do
	# 	expect(build(:article)).to be_valid
	# end

	# let(:ruby) { build(:article) }

	# describe "ActiveModel validations" do

	# 	it { expect(ruby).to validate_presence_of(:category_id) }
	# 	# it { expect(ruby).to validate_presence_of(:user_id) }
	# end
	
	it { should belong_to(:category) }
	it { should have_many(:edits) }
end
