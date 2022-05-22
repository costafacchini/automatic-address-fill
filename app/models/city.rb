class City < ApplicationRecord
  has_many :postal_codes,
           dependent: :restrict_with_error

  validates :code,
            presence: true

  validates :name,
            presence: true
end
