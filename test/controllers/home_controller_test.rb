# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/'
    assert_response :success
  end

  test 'should response on correct data' do
    post '/', xhr: true, params: { arr: '1 5 25 0 1 22 25 1' }
    assert_equal({
                   'input' => '1 5 25 0 1 22 25 1',
                   'distances' => [{
                     'distance' => '1 5 25'
                   },
                                   {
                                     'distance' => '1'
                                   },
                                   {
                                     'distance' => '25 1'
                                   }],
                   'max_distance' => '1 5 25'
                 }, JSON.parse(@response.body))
    post '/', xhr: true, params: { arr: '0 0 0 3 4 6 7' }
    assert_equal({
                   'input' => '0 0 0 3 4 6 7',
                   'distances' => [],
                   'max_distance' => nil
                 }, JSON.parse(@response.body))
  end

  test 'should error on post incorrect data' do
    post '/', xhr: true, params: { arr: '123s 15 234 s' }
    assert_response :success
    assert_equal({ 'error' => 'Строка должна состоять из положительных чисел и пробелов' }, JSON.parse(@response.body))
    post '/', xhr: true, params: { arr: '' }
    assert_equal({ 'error' => 'Строка должна состоять из положительных чисел и пробелов' }, JSON.parse(@response.body))
  end

  test 'should get history' do
    post '/', xhr: true, params: { arr: '1 5 0' }
    post '/', xhr: true, params: { arr: '1 2 3 4 5' }
    post '/', xhr: true, params: { arr: '0 1 2 5 25' }

    get '/history', xhr: true
    assert_response :success
    assert_equal [{
      'input' => '1 5 0',
      'distances' => [{ 'distance' => '1 5' }],
      'max_distance' => '1 5'
    },
                  {
                    'input' => '1 2 3 4 5',
                    'distances' => [{ 'distance' => '1' }, { 'distance' => '5' }],
                    'max_distance' => '1'
                  },
                  {
                    'input' => '0 1 2 5 25',
                    'distances' => [{ 'distance' => '1' }, { 'distance' => '5 25' }],
                    'max_distance' => '5 25'
                  }],
                 JSON.parse(@response.body).drop(2)
  end
end
