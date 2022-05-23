class Street < ApplicationRecord
  belongs_to :city

  validates :code,
            presence: true

  validates :name,
            presence: true
end
