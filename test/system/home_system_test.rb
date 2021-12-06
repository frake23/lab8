# frozen_string_literal: true

require 'application_system_test_case'

# System testing of home controller
class HomeSystemTest < ApplicationSystemTestCase
  setup do
    @driver = Capybara.current_session.driver.browser
  end

  def send_keys(keys)
    @driver.find_element(name: 'arr').send_keys keys
    @driver.find_element(tag_name: 'button').click
  end

  test 'should give right answers' do
    @driver.get(root_url)
    send_keys '1 5 25 0 625 25 5 5 123 1'

    assert_selector '#initial', text: '1 5 25 0 625 25 5 5 123 1'
    assert_selector '#distance-0', text: '1 5 25'
    assert_selector '#distance-1', text: '625 25 5 5'
    assert_selector '#distance-2', text: '1'
    assert_selector '#maxDistance', text: '625 25 5 5'
  end

  test 'should be empty' do
    @driver.get(root_url)
    send_keys '0 2 3 4 6 7 8'

    assert_selector '#error', text: 'Отрезков из чисел, являющихся степенями 5, не найдено'
  end

  test 'should alert' do
    @driver.get(root_url)
    send_keys '1s 5 25'
    # Selenium::WebDriver::Wait.new(timeout: 10).until { @driver.switch_to.alert }
    sleep 1
    assert_equal 'Строка должна состоять из положительных чисел и пробелов', @driver.switch_to.alert.text
    @driver.switch_to.alert.accept
    send_keys '1  5 25'
    sleep 1
    assert_equal 'Строка должна состоять из положительных чисел и пробелов', @driver.switch_to.alert.text
  end
end
