require 'test_helper'

class LibrariesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Library.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Library.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Library.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to library_url(assigns(:library))
  end

  def test_edit
    get :edit, :id => Library.first
    assert_template 'edit'
  end

  def test_update_invalid
    Library.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Library.first
    assert_template 'edit'
  end

  def test_update_valid
    Library.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Library.first
    assert_redirected_to library_url(assigns(:library))
  end

  def test_destroy
    library = Library.first
    delete :destroy, :id => library
    assert_redirected_to libraries_url
    assert !Library.exists?(library.id)
  end
end
