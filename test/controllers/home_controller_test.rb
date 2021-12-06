require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/'
    assert_response :success
  end

  test 'should response on correct data' do
    post '/', xhr: true, params: { arr: '1 5 25 0 1 22 25 1' }
    assert_equal({ 'distances' => [[1, 5, 25], [1], [25, 1]], 'maxDistance' => [1, 5, 25] }, JSON.parse(@response.body))
    post '/', xhr: true, params: { arr: '0 0 0 3 4 6 7' }
    assert_equal({ 'distances' => [], 'maxDistance' => nil }, JSON.parse(@response.body))
  end

  test 'should error on post incorrect data' do
    post '/', xhr: true, params: { arr: '123s 15 234 s' }
    assert_response :success
    assert_equal({ 'error' => 'Строка должна состоять из положительных чисел и пробелов' }, JSON.parse(@response.body))
    post '/', xhr: true, params: { arr: '' }
    assert_equal({ 'error' => 'Строка должна состоять из положительных чисел и пробелов' }, JSON.parse(@response.body))
  end


end
