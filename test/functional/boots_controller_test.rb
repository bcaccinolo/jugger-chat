require 'test_helper'

class BootsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:boots)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_boot
    assert_difference('Boot.count') do
      post :create, :boot => { }
    end

    assert_redirected_to boot_path(assigns(:boot))
  end

  def test_should_show_boot
    get :show, :id => boots(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => boots(:one).id
    assert_response :success
  end

  def test_should_update_boot
    put :update, :id => boots(:one).id, :boot => { }
    assert_redirected_to boot_path(assigns(:boot))
  end

  def test_should_destroy_boot
    assert_difference('Boot.count', -1) do
      delete :destroy, :id => boots(:one).id
    end

    assert_redirected_to boots_path
  end
end
