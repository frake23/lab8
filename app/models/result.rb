class Result < ApplicationRecord
  validates :input,
            format: { with: /\A(\d+ ?)+\z/, message: 'Строка должна состоять из положительных чисел и пробелов' }
  has_many :distances

  def attributes
    {
      input: nil,
      distances: nil,
      max_distance: nil
    }
  end
  # attributes :input, :distances, :max_distance
end
