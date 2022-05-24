class Person < ApplicationRecord
  belongs_to :city

  belongs_to :street

  belongs_to :street_number

  validates :name,
            presence: true
end
