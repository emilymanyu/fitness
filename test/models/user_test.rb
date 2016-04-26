require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  it { should respond_to(:feed) }
  it { should respond_to(:relationships) }#
     assert true
  it { should respond_to(:relationships) } 
  it { should respond_to(:followed_users) }
  #it { should respond_to(:followed_users) } it { should respond_to(:following?) }
  it { should respond_to(:follow!) }
  it { should respond_to(:unfollow!) } 
 end
 describe "following" do
   let(:other_user) { FactoryGirl.create(:user) } before do
    @user.save
    @user.follow!(other_user)
    end
   it { should be_following(other_user) }
   its(:followed_users) { should include(other_user) } 
   end 
   describe "and unfollowing" do
      before { @user.unfollow!(other_user) }
      it { should_not be_following(other_user) } 
      its(:followed_users) 
      { should_not include(other_user) }
     end
     describe "followed user" do 
     	subject { other_user }
       its(:followers) { should include(@user) } 
      end
  end
end
