require 'rails_helper'

describe Article do
	it { should belong_to(:category) }
	it { should have_many(:edits) }
end
