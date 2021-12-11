require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should invalidate result' do
    result = Result.new(input: '1 412 21s')
    assert result.invalid?
  end

  test 'should not save duplicate result' do
    result1 = Result.new(input: '1 2 3 4 5')
    assert result1.save
    result2 = Result.new(input: '1 2 3 4 5')
    assert result2.invalid?
  end

  test 'should save result record' do
    result = Result.new(input: '1 2 3 4 5')
    assert result.save
    assert Result.find_by(input: '1 2 3 4 5')
  end
end
