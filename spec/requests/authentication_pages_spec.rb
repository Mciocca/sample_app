require 'spec_helper'

describe "Authentication"  do

subject {page}

describe "signin" do
 before { visit signin_path}

 describe "with valid information" do
   let (:user) (FactoryGirl.create(:user))
    before do
  	  fill_in "Email" with: user.email
  	  fill_in "Name"  with: user.name
  	  fill_in "Password" with: user.password

      
describe "followed by signout" do
  before {click_link "Sign out"}
  it {should have_link('Sign in') }  
end
  	end

  it {should have_link('Profile', href: user_path(user)) }
  it {should_not have_link('Sign in', href: signin_path) }
end


describe "with invalid info" do
  it {should have_selector('div.alert.alert-error', text: 'Invalid') }

describe "followed by signout" do
  before {click_link "Sign out"}
  it {should have_link('Sign in') }  
end

  describe "after visiting another page" do
  	before {click_link "Home"}
  	it {should_not have_selector('div.alert.alert-error') }
  end
end

  end	
end
