class Distance < ApplicationRecord
  belongs_to :result

  def attributes
    {
      distance: nil
    }
  end
end

