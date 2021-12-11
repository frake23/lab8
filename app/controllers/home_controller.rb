# frozen_string_literal: true

require 'sequence'

# home controller
class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def calc
    arr_str = params[:arr]

    result = Result.find_by(input: arr_str)
    if result.nil?
      result = Result.new(input: arr_str)
      return render json: { error: result.errors.objects.first.message } if result.invalid?

      arr = arr_str.split(' ').map(&:to_i)
      distances = Sequence.find_distances(arr)
      p distances
      result.max_distance = distances.max{|a, b| a.length<=> b.length}&.join(' ')
      result.save
      result.distances.create(distances.map { |i| { distance: i.join(' ') } })
    end
    render json: result.as_json
  end

  def history
    render json: Result.all.map(&:as_json)
  end
end
