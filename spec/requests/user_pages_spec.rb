require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before do 
    	sign_in user, no_capybara: true
    	visit user_path(user) 
    end

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end  
end