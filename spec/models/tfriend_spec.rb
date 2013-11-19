require 'spec_helper'

describe Tfriend do
  
  let(:friend) { FactoryGirl.create(:user) }
  let(:friends) { FactoryGirl.create(:user) }
  let(:tfriend) { friend.tfriends.build(friends_id: friends.id) }

  subject { tfriend }

  it { should be_valid }
  
  describe "friend methods" do
    it { should respond_to(:friend) }
    it { should respond_to(:friends) }
    its(:friend) { should eq friend }
    its(:friends) { should eq friends }
  end
  
   describe "when friends id is not present" do
    before { tfriend.friends_id = nil }
    it { should_not be_valid }
  end

  describe "when friend id is not present" do
    before { tfriend.friend_id = nil }
    it { should_not be_valid }
  end
end
