# frozen_string_literal: true

# home controller
class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def calc
    arr_str = params[:arr]
    unless /^(\d+ ?)+$/.match? arr_str
      return render json: {
        error: 'Строка должна состоять из положительных чисел и пробелов'
      }
    end
    p arr_str
    arr = arr_str.split(' ').map(&:to_i)
    distances = find_distances(arr)
    render json: { distances: distances, maxDistance: distances.max { |a, b| a.length <=> b.length } }
  end

  def find_distances(arr)
    arr
      .map { |i| po5?(i) ? i : 0 }
      .slice_when { |i, j| po5?(i) != po5?(j) }
      .to_a
      .reject { |i| i.include? 0 }
  end

  def po5?(num)
    return false if num <= 0

    while num != 1
      return false unless (num % 5).zero?

      num /= 5
    end
    true
  end

  helper_method :find_distances, :po5?
end
