class Street < ApplicationRecord
  belongs_to :city

  has_many :street_numbers,
           dependent: :restrict_with_error

  has_many :people,
           dependent: :restrict_with_error

  validates :code,
            presence: true

  validates :name,
            presence: true
end
