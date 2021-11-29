require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/'
    assert_response :success
  end
  test 'should equal post resp' do
    post '/', xhr: true, params: { arr: [1, 5, 25, 0, 1, 22, 25, 1] }
    p @response.body
    assert_equal '{distances: [[1, 5, 25], [1], [25, 1]], maxDistance: [1, 5, 25]}', @response.body
  end
end
