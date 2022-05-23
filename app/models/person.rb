class Person < ApplicationRecord
  belongs_to :city

  belongs_to :street

  validates :name,
            presence: true
end
