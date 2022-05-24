class StreetNumber < ApplicationRecord
  belongs_to :street

  has_many :people,
           dependent: :restrict_with_error

  validates :number,
            presence: true
end
