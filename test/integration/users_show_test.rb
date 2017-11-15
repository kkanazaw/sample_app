require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:archer)
  end

  test "show as active user" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
  end
  
  test "show as non-active user" do
    log_in_as(@user)
    @user.toggle!(:activated)
    get user_path(@user)
    assert_redirected_to root_url
    @user.toggle!(:activated)
  end    
end
