class PostalCode < ApplicationRecord
  validates :code,
            presence: true
end
