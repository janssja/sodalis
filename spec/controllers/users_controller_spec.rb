require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'index'" do

    describe "for non-signed-in users" do
      it "should deny access" do
        get :index
        response.should redirect_to(signin_path)
      end
    end
    
    describe "for signed-in-users" do
      before(:each) do
        @user = test_sign_in(Factory(:user))
        second = Factory(:user, :name => "Bob", :email => "another@example.com")
        third  = Factory(:user, :name => "Ben", :email => "another@example.net")

        30.times do
          Factory(:user, :name => Factory.next(:name),
                         :email => Factory.next(:email))
        end
      end
      
      # it "should be successful" do
      #   get :index
      #   response.should be_success
      # end
    end
    
  end
  
  describe "GET 'show'" do
    
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end
  
  describe "POST 'create'" do
    
    describe "failure" do
      
      before(:each) do
        @attr = { :name => "", :email => "", :password => "", :password_confirmation => ""}
      end
      
      it "should have the right title" do
        post :create, :user => @attr
      end
    
      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end
    
      it "should not create a user" do
          lambda do
            post :create, :user => @attr
          end.should_not change(User, :count)
          
      end
    
    end
    
    describe "success" do
      
      before(:each) do
        @attr = { :name => "New User", :email => "user@example.com",
                  :password => "foobar", :password_confirmation => "foobar" }
      end
      
      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end
      
      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end
      
      it "should have a welcome message" do
        post :create, :user => @attr
        flash[:success].should =~ /welcome to Sodalis/i
      end
      
      it "should sign the user in" do
        post :create, :user => @attr
        controller.should be_signed_in
      end
      
    end
  
  end

end