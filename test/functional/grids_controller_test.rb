require 'test_helper'

class GridsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Grid.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Grid.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Grid.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to grid_url(assigns(:grid))
  end

  def test_edit
    get :edit, :id => Grid.first
    assert_template 'edit'
  end

  def test_update_invalid
    Grid.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Grid.first
    assert_template 'edit'
  end

  def test_update_valid
    Grid.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Grid.first
    assert_redirected_to grid_url(assigns(:grid))
  end

  def test_destroy
    grid = Grid.first
    delete :destroy, :id => grid
    assert_redirected_to grids_url
    assert !Grid.exists?(grid.id)
  end
end
