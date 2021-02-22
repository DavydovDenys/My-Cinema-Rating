class Film < ApplicationRecord
  validates :title, presence: true,
            length: { minimum: 3, maximum: 20 },
            uniqueness: { case_sensitive: false }
end
