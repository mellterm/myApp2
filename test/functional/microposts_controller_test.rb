require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Micropost.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Micropost.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Micropost.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to micropost_url(assigns(:micropost))
  end

  def test_edit
    get :edit, :id => Micropost.first
    assert_template 'edit'
  end

  def test_update_invalid
    Micropost.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Micropost.first
    assert_template 'edit'
  end

  def test_update_valid
    Micropost.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Micropost.first
    assert_redirected_to micropost_url(assigns(:micropost))
  end

  def test_destroy
    micropost = Micropost.first
    delete :destroy, :id => micropost
    assert_redirected_to microposts_url
    assert !Micropost.exists?(micropost.id)
  end
end
