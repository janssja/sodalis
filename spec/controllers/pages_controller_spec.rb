require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'home'" do
  
    describe "when not signed in" do    
      it "should be successful" do
        get 'home'
        response.should be_success
      end 

      it "should have a non-blank body" do
        get 'home'
        response.body.should_not =~ /<body>\s*<\/body>/ 
      end    
    end                  
  
    describe "when signed in" do
      before(:each) do
        @user = test_sign_in(Factory(:user))
        other_user = Factory(:user, :email => Factory.next(:email))
        other_user.follow!(@user)
      end
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    
    it "should have a non-blank body" do
      get 'contact'
      response.body.should_not =~ /<body>\s*<\/body>/ 
    end
  end
  
  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    
    it "should have a non-blank body" do
      get 'about'
      response.body.should_not =~ /<body>\s*<\/body>/ 
    end
  end
  
  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
    
    it "should have a non-blank body" do
      get 'help'
      response.body.should_not =~ /<body>\s*<\/body>/ 
    end
  end
end
