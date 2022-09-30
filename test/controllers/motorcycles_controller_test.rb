require 'test_helper'

class MotorcyclesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get motorcycles_index_url
    assert_response :success
  end
end
