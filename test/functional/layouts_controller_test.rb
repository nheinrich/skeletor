require 'test_helper'

class LayoutsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Layout.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Layout.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Layout.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to layout_url(assigns(:layout))
  end

  def test_edit
    get :edit, :id => Layout.first
    assert_template 'edit'
  end

  def test_update_invalid
    Layout.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Layout.first
    assert_template 'edit'
  end

  def test_update_valid
    Layout.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Layout.first
    assert_redirected_to layout_url(assigns(:layout))
  end

  def test_destroy
    layout = Layout.first
    delete :destroy, :id => layout
    assert_redirected_to layouts_url
    assert !Layout.exists?(layout.id)
  end
end
