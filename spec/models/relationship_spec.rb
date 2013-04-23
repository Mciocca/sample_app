require 'spec_helper'

describe "follower methods" do
  it { should respond_to(:follower) }
  it { should respond_to(:followed) }
  its(:follower) { should == follower }
  its(:followed) { should == followed }

end

describe "when followed id is not present" do
	before {relationship.followed_id = nil}
	it {should_not be_vaild}
end

describe "when follower id is not present" do
	before {relationship.follwer_id = nil }
	it{ should_not be_valid}

end


end