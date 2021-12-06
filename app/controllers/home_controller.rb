# frozen_string_literal: true

require 'sequence'

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
    distances = Sequence.find_distances(arr)
    render json: { distances: distances, maxDistance: distances.max { |a, b| a.length <=> b.length } }
  end
end
