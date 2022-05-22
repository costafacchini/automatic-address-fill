class City < ApplicationRecord
  validates :code,
            presence: true

  validates :name,
            presence: true
end
