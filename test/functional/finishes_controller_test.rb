require 'test_helper'

class FinishesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Finish.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Finish.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Finish.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to finish_url(assigns(:finish))
  end

  def test_edit
    get :edit, :id => Finish.first
    assert_template 'edit'
  end

  def test_update_invalid
    Finish.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Finish.first
    assert_template 'edit'
  end

  def test_update_valid
    Finish.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Finish.first
    assert_redirected_to finish_url(assigns(:finish))
  end

  def test_destroy
    finish = Finish.first
    delete :destroy, :id => finish
    assert_redirected_to finishes_url
    assert !Finish.exists?(finish.id)
  end
end
